# ******************************************************************************************
#
#   raylib [shapes] example - bouncing ball
#
#   Example originally created with raylib 2.5, last time updated with raylib 2.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2013-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [shapes] example - bouncing ball")

ball_position = Raylib::Vector2.create(Raylib.get_screen_width / 2.0, Raylib.get_screen_height / 2.0)
ball_speed = Raylib::Vector2.create(5.0, 4.0)
ball_radius = 20

pause = false
frames_counter = 0

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------
  pause = !pause if Raylib.is_key_pressed(Raylib::KEY_SPACE)

  if pause
    frames_counter += 1
  else
    ball_position.x += ball_speed.x
    ball_position.y += ball_speed.y

    # Check walls collision for bouncing
    ball_speed.x *= -1.0 if (ball_position.x >= (Raylib.get_screen_width - ball_radius)) || (ball_position.x <= ball_radius)
    ball_speed.y *= -1.0 if (ball_position.y >= (Raylib.get_screen_height - ball_radius)) || (ball_position.y <= ball_radius)
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_circle_v(ball_position, ball_radius.to_f, Raylib::MAROON)
  Raylib.draw_text("PRESS SPACE to PAUSE BALL MOVEMENT", 10, Raylib.get_screen_height - 25, 20, Raylib::LIGHTGRAY)

  # On pause, we draw a blinking message
  Raylib.draw_text("PAUSED", 350, 200, 30, Raylib::GRAY) if pause && (frames_counter / 30) % 2 == 1

  Raylib.draw_fps(10, 10)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window
# --------------------------------------------------------------------------------------
