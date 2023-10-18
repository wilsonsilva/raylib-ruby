# ********************************************************************************************
#
#   raylib [core] example - 2d camera mouse zoom
#
#   Example originally created with raylib 4.2, last time updated with raylib 4.2
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2022-2023 Jeffery Myers (@JeffM2501)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'
require 'raylib/raymath'
require 'raylib/rlgl'

# Initialization
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 2d camera mouse zoom")

camera = Raylib::Camera2D.new
camera.zoom = 1.0

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  # Translate based on mouse right click
  if Raylib.is_mouse_button_down(Raylib::MOUSE_BUTTON_RIGHT)
    delta = Raylib.get_mouse_delta
    delta = Raylib.vector2_scale(delta, -1.0 / camera.zoom)

    camera.target = Raylib.vector2_add(camera.target, delta)
  end

  # Zoom based on mouse wheel
  wheel = Raylib.get_mouse_wheel_move

  if wheel != 0
    # Get the world point that is under the mouse
    mouse_world_pos = Raylib.get_screen_to_world_2d(Raylib.get_mouse_position, camera)

    # Set the offset to where the mouse is
    camera.offset = Raylib.get_mouse_position

    # Set the target to match, so that the camera maps the world space point
    # under the cursor to the screen space point under the cursor at any zoom
    camera.target = mouse_world_pos

    # Zoom increment
    zoom_increment = 0.125

    camera.zoom += (wheel * zoom_increment)

    if camera.zoom < zoom_increment
      camera.zoom = zoom_increment
    end
  end
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::BLACK)

  Raylib.begin_mode_2d(camera)

  # Draw the 3d grid, rotated 90 degrees and centered around 0,0
  # just so we have something in the XY plane
  Raylib.rl_push_matrix
  Raylib.rl_translatef(0, 25 * 50, 0)
  Raylib.rl_rotatef(90, 1, 0, 0)
  Raylib.draw_grid(100, 50)
  Raylib.rl_pop_matrix

  # Draw a reference circle
  Raylib.draw_circle(100, 100, 50, Raylib::YELLOW)

  Raylib.end_mode_2d

  Raylib.draw_text("Mouse right button drag to move, mouse wheel to zoom", 10, 10, 20, Raylib::WHITE)
  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
#--------------------------------------------------------------------------------------
