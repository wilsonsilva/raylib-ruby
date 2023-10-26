# ******************************************************************************************
#
#   raylib [core] example - World to screen
#
#   Example originally created with raylib 1.3, last time updated with raylib 1.4
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
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - core world screen")

# Define the camera to look into our 3d world
camera = Raylib::Camera.create(
  Raylib::Vector3.create(10.0, 10.0, 10.0), # Camera position
  Raylib::Vector3.create(0.0, 0.0, 0.0),    # Camera looking at point
  Raylib::Vector3.create(0.0, 1.0, 0.0),    # Camera up vector (rotation towards target)
  45.0,                                # Camera field-of-view Y
  Raylib::CAMERA_PERSPECTIVE                # Camera projection type
)

cube_position = Raylib::Vector3.create(0.0, 0.0, 0.0)
cube_screen_position = Raylib::Vector2.create(0.0, 0.0)

Raylib.disable_cursor  # Limit cursor to relative movement inside the window
Raylib.set_target_fps(60)
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close  # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  Raylib.update_camera(camera, Raylib::CAMERA_THIRD_PERSON)

  # Calculate cube screen space position (with a little offset to be in top)
  cube_screen_position = Raylib.get_world_to_screen(
    Raylib::Vector3.create(cube_position.x, cube_position.y + 2.5, cube_position.z),
    camera
  )
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

  Raylib.draw_text(
    "Enemy: 100 / 100",
    cube_screen_position.x - Raylib.measure_text("Enemy: 100/100", 20) / 2,
    cube_screen_position.y,
    20,
    Raylib::BLACK
  )

  Raylib.draw_text(
    "Cube position in screen space coordinates: [#{cube_screen_position.x.to_i}, #{cube_screen_position.y.to_i}]",
    10,
    10,
    20,
    Raylib::LIME
  )

  Raylib.draw_text("Text 2d should be always on top of the cube", 10, 40, 20, Raylib::GRAY)

  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window  # Close window and OpenGL context
#--------------------------------------------------------------------------------------
