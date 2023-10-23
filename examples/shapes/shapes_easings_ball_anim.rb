# ******************************************************************************************
#
#   raylib [shapes] example - easings ball anim
#
#   Example originally created with raylib 2.5, last time updated with raylib 2.5
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

require_relative 'reasings' # Required for easing functions

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [shapes] example - easings ball anim")

# Ball variable value to be animated with easings
ball_position_x = -100
ball_radius = 20
ball_alpha = 0.0

state = 0
frames_counter = 0

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  if state == 0 # Move ball position X with easing
    frames_counter += 1
    ball_position_x = Reasings.ease_elastic_out(frames_counter.to_f, -100, SCREEN_WIDTH / 2.0 + 100, 120).to_i

    if frames_counter >= 120
      frames_counter = 0
      state = 1
    end
  elsif state == 1 # Increase ball radius with easing
    frames_counter += 1
    ball_radius = Reasings.ease_elastic_in(frames_counter.to_f, 20, 500, 200).to_i

    if frames_counter >= 200
      frames_counter = 0
      state = 2
    end
  elsif state == 2 # Change ball alpha with easing (background color blending)
    frames_counter += 1
    ball_alpha = Reasings.ease_cubic_out(frames_counter.to_f, 0.0, 1.0, 200)

    if frames_counter >= 200
      frames_counter = 0
      state = 3
    end
  elsif state == 3 # Reset state to play again
    if Raylib.is_key_pressed(Raylib::KEY_ENTER)
      # Reset required variables to play again
      ball_position_x = -100
      ball_radius = 20
      ball_alpha = 0.0
      state = 0
    end
  end

  frames_counter = 0 if Raylib.is_key_pressed(Raylib::KEY_R)
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Raylib::GREEN) if state >= 2
  Raylib.draw_circle(ball_position_x, 200, ball_radius.to_f, Raylib.fade(Raylib::RED, 1.0 - ball_alpha))

  Raylib.draw_text("PRESS [ENTER] TO PLAY AGAIN!", 240, 200, 20, Raylib::BLACK) if state == 3

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
