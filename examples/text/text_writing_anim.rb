# ******************************************************************************************
#
#   raylib [text] example - Text Writing Animation
#
#   Example originally created with raylib 1.4, last time updated with raylib 1.4
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2016-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [text] example - text writing anim")

message = "This sample illustrates a text writing\nanimation effect! Check it out! ;)"
frames_counter = 0

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  if Raylib.is_key_down(Raylib::KEY_SPACE)
    frames_counter += 8
  else
    frames_counter += 1
  end

  frames_counter = 0 if Raylib.is_key_pressed(Raylib::KEY_ENTER)
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text(Raylib.text_subtext(message, 0, frames_counter/10), 210, 160, 20, Raylib::MAROON)

  Raylib.draw_text("PRESS [ENTER] to RESTART!", 240, 260, 20, Raylib::LIGHTGRAY)
  Raylib.draw_text("PRESS [SPACE] to SPEED UP!", 239, 300, 20, Raylib::LIGHTGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
