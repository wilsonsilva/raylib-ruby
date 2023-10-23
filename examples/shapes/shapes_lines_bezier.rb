# ******************************************************************************************
# 
#   raylib [shapes] example - Cubic-bezier lines
#
#   Example originally created with raylib 1.7, last time updated with raylib 1.7
# 
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2017-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.set_config_flags(Raylib::FLAG_MSAA_4X_HINT)
Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [shapes] example - cubic-bezier lines')

start = Raylib::Vector2.create(0, 0)
ending = Raylib::Vector2.create(SCREEN_WIDTH.to_f, SCREEN_HEIGHT.to_f)

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  start  = Raylib.get_mouse_position if Raylib.is_mouse_button_down(Raylib::MOUSE_BUTTON_LEFT)
  ending = Raylib.get_mouse_position if Raylib.is_mouse_button_down(Raylib::MOUSE_BUTTON_RIGHT)
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_text('USE MOUSE LEFT-RIGHT CLICK to DEFINE LINE START and END POINTS', 15, 20, 20, Raylib::GRAY)
  Raylib.draw_line_bezier(start, ending, 2.0, Raylib::RED)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
