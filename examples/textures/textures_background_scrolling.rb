# ******************************************************************************************
# 
#   raylib [textures] example - Background scrolling
# 
#   Example originally created with raylib 2.0, last time updated with raylib 2.5
# 
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2019-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - background scrolling')

# NOTE: Be careful, background width must be equal or bigger than screen width
# if not, texture should be draw more than two times for scrolling effect
background = Raylib.load_texture(File.join(__dir__, 'resources/cyberpunk_street_background.png'))
midground  = Raylib.load_texture(File.join(__dir__, 'resources/cyberpunk_street_midground.png'))
foreground = Raylib.load_texture(File.join(__dir__, 'resources/cyberpunk_street_foreground.png'))

scrolling_back = 0.0
scrolling_mid = 0.0
scrolling_fore = 0.0

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  scrolling_back -= 0.1
  scrolling_mid  -= 0.5
  scrolling_fore -= 1.0

  # NOTE: Texture is scaled twice its size, so it sould be considered on scrolling
  scrolling_back = 0 if scrolling_back <= -background.width * 2
  scrolling_mid  = 0 if scrolling_mid  <= -midground.width * 2
  scrolling_fore = 0 if scrolling_fore <= -foreground.width * 2
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib.get_color(0x052c46ff))

  # Draw background image twice
  # NOTE: Texture is scaled twice its size
  Raylib.draw_texture_ex(background, Raylib::Vector2.create(scrolling_back, 20), 0.0, 2.0, Raylib::WHITE)
  Raylib.draw_texture_ex(background, Raylib::Vector2.create(background.width * 2 + scrolling_back, 20), 0.0, 2.0, Raylib::WHITE)

  # Draw midground image twice
  Raylib.draw_texture_ex(midground, Raylib::Vector2.create(scrolling_mid, 20), 0.0, 2.0, Raylib::WHITE)
  Raylib.draw_texture_ex(midground, Raylib::Vector2.create(midground.width * 2 + scrolling_mid, 20), 0.0, 2.0, Raylib::WHITE)

  # Draw foreground image twice
  Raylib.draw_texture_ex(foreground, Raylib::Vector2.create(scrolling_fore, 70), 0.0, 2.0, Raylib::WHITE)
  Raylib.draw_texture_ex(foreground, Raylib::Vector2.create(foreground.width * 2 + scrolling_fore, 70), 0.0, 2.0, Raylib::WHITE)

  Raylib.draw_text('BACKGROUND SCROLLING & PARALLAX', 10, 10, 20, Raylib::RED)
  Raylib.draw_text('(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)', SCREEN_WIDTH - 330, SCREEN_HEIGHT - 20, 10, Raylib::RAYWHITE)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(background) # Unload background texture
Raylib.unload_texture(midground)  # Unload midground texture
Raylib.unload_texture(foreground) # Unload foreground texture

Raylib.close_window               # Close window and OpenGL context
# --------------------------------------------------------------------------------------
