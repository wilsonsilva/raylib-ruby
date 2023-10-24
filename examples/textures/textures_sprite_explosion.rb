# ******************************************************************************************
#
#   raylib [textures] example - sprite explosion
#
#   Example originally created with raylib 2.5, last time updated with raylib 3.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2019-2023 Anata and Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - sprite explosion')

NUM_FRAMES_PER_LINE = 5
NUM_LINES = 5

Raylib.init_audio_device

# Load explosion sound
fx_boom = Raylib.load_sound(File.join(__dir__, 'resources/boom.wav'))

# Load explosion texture
explosion = Raylib.load_texture(File.join(__dir__, 'resources/explosion.png'))

# Init variables for animation
frame_width = explosion.width / NUM_FRAMES_PER_LINE.to_f
frame_height = explosion.height / NUM_LINES.to_f
current_frame = 0
current_line = 0

frame_rec = Raylib::Rectangle.create(0, 0, frame_width, frame_height) # Sprite one frame rectangle width
position = Raylib::Vector2.create(0.0, 0.0)                           # Sprite one frame rectangle height

active = false
frames_counter = 0

Raylib.set_target_fps(120)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------

  # Check for mouse button pressed and activate explosion (if not active)
  if Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_LEFT) && !active
    position = Raylib.get_mouse_position
    active = true

    position.x -= frame_width / 2.0
    position.y -= frame_height / 2.0

    Raylib.play_sound(fx_boom)
  end

  # Compute explosion animation frames
  if active
    frames_counter += 1

    if frames_counter > 2
      current_frame += 1

      if current_frame >= NUM_FRAMES_PER_LINE
        current_frame = 0
        current_line += 1

        if current_line >= NUM_LINES
          current_line = 0
          active = false
        end
      end

      frames_counter = 0
    end
  end

  frame_rec.x = frame_width * current_frame
  frame_rec.y = frame_height * current_line
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  # Draw explosion required frame rectangle
  Raylib.draw_texture_rec(explosion, frame_rec, position, Raylib::WHITE) if active

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(explosion)  # Unload texture
Raylib.unload_sound(fx_boom)      # Unload sound

Raylib.close_audio_device
Raylib.close_window
# --------------------------------------------------------------------------------------
