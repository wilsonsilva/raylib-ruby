# ******************************************************************************************
#
#   raylib [core] example - Initialize 3d camera mode
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d camera mode")

camera = Raylib::Camera3D.create(
  Raylib::Vector3.create(0.0, 10.0, 10.0), # Camera position
  Raylib::Vector3.create(0.0, 0.0, 0.0),   # Camera looking at point
  Raylib::Vector3.create(0.0, 1.0, 0.0),   # Camera up vector (rotation towards target)
  45.0,                                   # Camera field-of-view Y
  Raylib::CAMERA_PERSPECTIVE               # Camera projection type
)

cube_position = Raylib::Vector3.create(0.0, 0.0, 0.0)

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  # TODO: Update your variables here
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
    Raylib.clear_background(Raylib::RAYWHITE)

    Raylib.begin_mode_3d(camera)
      Raylib.draw_cube(cube_position, 2.0, 2.0, 2.0, Raylib::RED)
      Raylib.draw_cube_wires(cube_position, 2.0, 2.0, 2.0, Raylib::MAROON)
      Raylib.draw_grid(10, 1.0)
    Raylib.end_mode_3d

    Raylib.draw_text("Welcome to the third dimension!", 10, 40, 20, Raylib::DARKGRAY)
    Raylib.draw_fps(10, 10)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
