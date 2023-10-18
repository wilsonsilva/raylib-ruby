# ******************************************************************************************
#
#   raylib [core] example - Picking in 3d mode
#
#   Example originally created with raylib 1.3, last time updated with raylib 4.0
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d picking")

# Define the camera to look into our 3d world
camera = Raylib::Camera.new
camera.position = Raylib::Vector3.create(10.0, 10.0, 10.0)  # Camera position
camera.target = Raylib::Vector3.create(0.0, 0.0, 0.0)       # Camera looking at point
camera.up = Raylib::Vector3.create(0.0, 1.0, 0.0)           # Camera up vector (rotation towards target)
camera.fovy = 45.0                                          # Camera field-of-view Y
camera.projection = Raylib::CAMERA_PERSPECTIVE              # Camera projection type

cube_position = Raylib::Vector3.create(0.0, 1.0, 0.0)
cube_size = Raylib::Vector3.create(2.0, 2.0, 2.0)

ray = Raylib::Ray.new # Picking line ray
collision = Raylib::RayCollision.new # Ray collision hit info

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  if Raylib.is_cursor_hidden
    Raylib.update_camera(camera, Raylib::CAMERA_FIRST_PERSON)
  end

  # Toggle camera controls
  if Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_RIGHT)
    if Raylib.is_cursor_hidden
      Raylib.enable_cursor
    else
      Raylib.disable_cursor
    end
  end

  if Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_LEFT)
    unless collision.hit
      ray = Raylib.get_mouse_ray(Raylib.get_mouse_position, camera)

      # Check collision between ray and box
      bounding_box = Raylib::BoundingBox.create(
        Raylib::Vector3.create(cube_position.x - cube_size.x / 2, cube_position.y - cube_size.y / 2, cube_position.z - cube_size.z / 2),
        Raylib::Vector3.create(cube_position.x + cube_size.x / 2, cube_position.y + cube_size.y / 2, cube_position.z + cube_size.z / 2)
      )
      collision = Raylib.get_ray_collision_box(ray, bounding_box)
    else
      collision.hit = false
    end
  end
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.begin_mode_3d(camera)

  if collision.hit
    Raylib.draw_cube(cube_position, cube_size.x, cube_size.y, cube_size.z, Raylib::RED)
    Raylib.draw_cube_wires(cube_position, cube_size.x, cube_size.y, cube_size.z, Raylib::MAROON)

    Raylib.draw_cube_wires(cube_position, cube_size.x + 0.2, cube_size.y + 0.2, cube_size.z + 0.2, Raylib::GREEN)
  else
    Raylib.draw_cube(cube_position, cube_size.x, cube_size.y, cube_size.z, Raylib::GRAY)
    Raylib.draw_cube_wires(cube_position, cube_size.x, cube_size.y, cube_size.z, Raylib::DARKGRAY)
  end

  Raylib.draw_ray(ray, Raylib::MAROON)
  Raylib.draw_grid(10, 1.0)

  Raylib.end_mode_3d

  Raylib.draw_text("Try clicking on the box with your mouse!", 240, 10, 20, Raylib::DARKGRAY)

  if collision.hit
    Raylib.draw_text("BOX SELECTED", (SCREEN_WIDTH - Raylib.measure_text("BOX SELECTED", 30)) / 2, (SCREEN_HEIGHT * 0.1).to_i, 30, Raylib::GREEN)
  end

  Raylib.draw_text("Right click mouse to toggle camera controls", 10, 430, 10, Raylib::GRAY)
  Raylib.draw_fps(10, 10)

  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window  # Close window and OpenGL context
#--------------------------------------------------------------------------------------
