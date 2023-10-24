# ******************************************************************************************
#
#   raylib [textures] example - Texture loading and drawing
#
#   Example originally created with raylib 1.0, last time updated with raylib 1.0
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2014-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - texture loading and drawing')

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
texture = Raylib.load_texture(File.join(__dir__, 'resources/raylib_logo.png')) # Texture loading
# ---------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_texture(
    texture,
    (SCREEN_WIDTH/2) - (texture.width/2),
    (SCREEN_HEIGHT/2) - (texture.height/2),
    Raylib::WHITE
  )
  Raylib.draw_text('this IS a texture!', 360, 370, 10, Raylib::GRAY)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(texture) # Texture unloading
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
