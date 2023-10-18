# ******************************************************************************************
#
#   raylib [core] example - Mouse input
#
#   Example originally created with raylib 1.0, last time updated with raylib 4.0
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - mouse input")

ball_color = Raylib::DARKBLUE

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
#---------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  ball_position = Raylib.get_mouse_position

  if Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_LEFT)
    ball_color = Raylib::MAROON
  elsif Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_MIDDLE)
    ball_color = Raylib::LIME
  elsif Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_RIGHT)
    ball_color = Raylib::DARKBLUE
  elsif Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_SIDE)
    ball_color = Raylib::PURPLE
  elsif Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_EXTRA)
    ball_color = Raylib::YELLOW
  elsif Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_FORWARD)
    ball_color = Raylib::ORANGE
  elsif Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_BACK)
    ball_color = Raylib::BEIGE
  end

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing

      Raylib.clear_background(Raylib::RAYWHITE)

      Raylib.draw_circle_v(ball_position, 40, ball_color)

      Raylib.draw_text("move ball with mouse and click mouse button to change color", 10, 10, 20, Raylib::DARKGRAY)

  Raylib.end_drawing
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
#--------------------------------------------------------------------------------------
