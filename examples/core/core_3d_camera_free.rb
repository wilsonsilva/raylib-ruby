# ******************************************************************************************
#
#   raylib [core] example - Initialize 3d camera free
#
#   Example originally created with raylib 1.3, last time updated with raylib 1.3
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2015-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d camera free")

# Define the camera to look into our 3d world
camera = Raylib::Camera3D.create(
  Raylib::Vector3.create(10.0, 10.0, 10.0), # Camera position
  Raylib::Vector3.create(0.0, 0.0, 10.0),   # Camera looking at point
  Raylib::Vector3.create(0.0, 100, 0.0),    # Camera up vector (rotation towards target)
  45.0,                                     # Camera field-of-view Y
  Raylib::CAMERA_PERSPECTIVE                # Camera projection type
)

cube_position = Raylib::Vector3.create(0.0, 0.0, 0.0)

Raylib.disable_cursor                                  # Limit cursor to relative movement inside the window

Raylib.set_target_fps(60)
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close                      # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  Raylib.update_camera(camera, Raylib::CAMERA_FREE)

  camera.target = Raylib::Vector3.create(0.0, 0.0, 0.0) if Raylib.is_key_down(Raylib::KEY_Z)
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.begin_mode_3d(camera)

  Raylib.draw_cube(cube_position, 2.0, 2.0, 2.0, Raylib::RED)
  Raylib.draw_cube_wires(cube_position, 2.0, 2.0, 2.0, Raylib::MAROON)

  Raylib.draw_grid(10, 1.0)

  Raylib.end_mode_3d

  Raylib.draw_rectangle(10, 10, 320, 133, Raylib.fade(Raylib::SKYBLUE, 0.5))
  Raylib.draw_rectangle_lines(10, 10, 320, 133, Raylib::BLUE)

  Raylib.draw_text("Free camera default controls:", 20, 20, 10, Raylib::BLACK)
  Raylib.draw_text("- Mouse Wheel to Zoom in-out", 40, 40, 10, Raylib::DARKGRAY)
  Raylib.draw_text("- Mouse Wheel Pressed to Pan", 40, 60, 10, Raylib::DARKGRAY)
  Raylib.draw_text("- Alt + Mouse Wheel Pressed to Rotate", 40, 80, 10, Raylib::DARKGRAY)
  Raylib.draw_text("- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom", 40, 100, 10, Raylib::DARKGRAY)
  Raylib.draw_text("- Z to zoom to (0, 0, 0)", 40, 120, 10, Raylib::DARKGRAY)

  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window                                     # Close window and OpenGL context
#--------------------------------------------------------------------------------------
