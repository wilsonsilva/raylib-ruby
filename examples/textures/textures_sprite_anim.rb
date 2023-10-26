# ******************************************************************************************
#
#   raylib [textures] example - Sprite animation
#
#   Example originally created with raylib 1.3, last time updated with raylib 1.3
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [texture] example - sprite anim')

MAX_FRAME_SPEED = 15
MIN_FRAME_SPEED = 1

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
scarfy = Raylib.load_texture(File.join(__dir__, 'resources/scarfy.png')) # Texture loading

position = Raylib::Vector2.create(350.0, 280.0)
frame_rec = Raylib::Rectangle.create(0.0, 0.0, scarfy.width / 6.0, scarfy.height)
current_frame = 0

frames_counter = 0
frames_speed = 8

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  frames_counter += 1

  if frames_counter >= (60 / frames_speed)
    frames_counter = 0
    current_frame += 1
    current_frame = 0 if current_frame > 5
    frame_rec.x = current_frame * scarfy.width / 6.0
  end

  # Control frames speed
  frames_speed += 1 if Raylib.is_key_pressed(Raylib::KEY_RIGHT)
  frames_speed -= 1 if Raylib.is_key_pressed(Raylib::KEY_LEFT)
  frames_speed = MAX_FRAME_SPEED if frames_speed > MAX_FRAME_SPEED
  frames_speed = MIN_FRAME_SPEED if frames_speed < MIN_FRAME_SPEED
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_texture(scarfy, 15, 40, Raylib::WHITE)
  Raylib.draw_rectangle_lines(15, 40, scarfy.width, scarfy.height, Raylib::LIME)
  Raylib.draw_rectangle_lines(
    15 + frame_rec.x.to_i, 40 + frame_rec.y.to_i, frame_rec.width.to_i, frame_rec.height.to_i, Raylib::RED
  )

  Raylib.draw_text('FRAME SPEED: ', 165, 210, 10, Raylib::DARKGRAY)
  Raylib.draw_text('%02i FPS' % frames_speed, 575, 210, 10, Raylib::DARKGRAY)
  Raylib.draw_text('PRESS RIGHT/LEFT KEYS to CHANGE SPEED!', 290, 240, 10, Raylib::DARKGRAY)

  MAX_FRAME_SPEED.times do |i|
    if i < frames_speed
      Raylib.draw_rectangle(250 + (21 * i), 205, 20, 20, Raylib::RED)
    else
      Raylib.draw_rectangle_lines(250 + (21 * i), 205, 20, 20, Raylib::MAROON)
    end
  end

  Raylib.draw_texture_rec(scarfy, frame_rec, position, Raylib::WHITE) # Draw part of the texture
  Raylib.draw_text('(c) Scarfy sprite by Eiden Marsal', SCREEN_WIDTH - 200, SCREEN_HEIGHT - 20, 10, Raylib::GRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(scarfy) # Texture unloading
Raylib.close_window           # Close window and OpenGL context
# --------------------------------------------------------------------------------------
