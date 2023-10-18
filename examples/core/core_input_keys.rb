# ******************************************************************************************
#
#   raylib [core] example - Keyboard input
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
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - keyboard input")

ball_position = Raylib::Vector2.create(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0)

Raylib.set_target_fps(60)
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  ball_position.x += 2.0 if Raylib.is_key_down(Raylib::KEY_RIGHT)
  ball_position.x -= 2.0 if Raylib.is_key_down(Raylib::KEY_LEFT)
  ball_position.y -= 2.0 if Raylib.is_key_down(Raylib::KEY_UP)
  ball_position.y += 2.0 if Raylib.is_key_down(Raylib::KEY_DOWN)
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing
    Raylib.clear_background(Raylib::RAYWHITE)
    Raylib.draw_text("move the ball with arrow keys", 10, 10, 20, Raylib::DARKGRAY)
    Raylib.draw_circle_v(ball_position, 50, Raylib::MAROON)
  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window
#--------------------------------------------------------------------------------------
