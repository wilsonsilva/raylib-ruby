# ******************************************************************************************
#
#   raylib [core] example - 3d camera first person
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

MAX_COLUMNS = 20

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d camera first person")

camera = Raylib::Camera3D.create(
  Raylib::Vector3.create(0.0, 2.0, 4.0),
  Raylib::Vector3.create(0.0, 2.0, 0.0),
  Raylib::Vector3.create(0.0, 1.0, 0.0),
  60.0,
  Raylib::CAMERA_PERSPECTIVE
)

camera_mode = Raylib::CAMERA_FIRST_PERSON

heights = Array.new(MAX_COLUMNS) { Raylib.get_random_value(1, 12) }
positions = Array.new(MAX_COLUMNS) do |i|
  Raylib::Vector3.create(
    Raylib.get_random_value(-15, 15),
    heights[i] / 2.0,
    Raylib.get_random_value(-15, 15)
  )
end
colors = Array.new(MAX_COLUMNS) do
  Raylib::Color.create(
    Raylib.get_random_value(20, 255),
    Raylib.get_random_value(10, 55),
    30,
    255
  )
end

Raylib.disable_cursor
Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------
  if Raylib.is_key_pressed(Raylib::KEY_ONE)
    camera_mode = Raylib::CAMERA_FREE
    camera.up = Raylib::Vector3.create(0.0, 1.0, 0.0)
  end

  if Raylib.is_key_pressed(Raylib::KEY_TWO)
    camera_mode = Raylib::CAMERA_FIRST_PERSON
    camera.up = Raylib::Vector3.create(0.0, 1.0, 0.0)
  end

  if Raylib.is_key_pressed(Raylib::KEY_THREE)
    camera_mode = Raylib::CAMERA_THIRD_PERSON
    camera.up = Raylib::Vector3.create(0.0, 1.0, 0.0)
  end

  if Raylib.is_key_pressed(Raylib::KEY_FOUR)
    camera_mode = Raylib::CAMERA_ORBITAL
    camera.up = Raylib::Vector3.create(0.0, 1.0, 0.0)
  end

  if Raylib.is_key_pressed(Raylib::KEY_P)
    if camera.projection == Raylib::CAMERA_PERSPECTIVE
      camera_mode = Raylib::CAMERA_THIRD_PERSON
      camera.position = Raylib::Vector3.create(0.0, 2.0, -100.0)
      camera.target = Raylib::Vector3.create(0.0, 2.0, 0.0)
      camera.up = Raylib::Vector3.create(0.0, 1.0, 0.0)
      camera.projection = Raylib::CAMERA_ORTHOGRAPHIC
      camera.fovy = 20.0
      # CameraYaw and CameraPitch methods not directly available in Ruby
      # You may need to implement these yourself based on your Raylib Ruby binding
    elsif camera.projection == Raylib::CAMERA_ORTHOGRAPHIC
      camera_mode = Raylib::CAMERA_THIRD_PERSON
      camera.position = Raylib::Vector3.create(0.0, 2.0, 10.0)
      camera.target = Raylib::Vector3.create(0.0, 2.0, 0.0)
      camera.up = Raylib::Vector3.create(0.0, 1.0, 0.0)
      camera.projection = Raylib::CAMERA_PERSPECTIVE
      camera.fovy = 60.0
    end
  end


  Raylib.update_camera(camera, camera_mode)
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
    Raylib.clear_background(Raylib::RAYWHITE)

    Raylib.begin_mode_3d(camera)
      Raylib.draw_plane(Raylib::Vector3.create(0.0, 0.0, 0.0), Raylib::Vector2.create(32.0, 32.0), Raylib::LIGHTGRAY)
      Raylib.draw_cube(Raylib::Vector3.create(-16.0, 2.5, 0.0), 1.0, 5.0, 32.0, Raylib::BLUE)
      Raylib.draw_cube(Raylib::Vector3.create(16.0, 2.5, 0.0), 1.0, 5.0, 32.0, Raylib::LIME)
      Raylib.draw_cube(Raylib::Vector3.create(0.0, 2.5, 16.0), 32.0, 5.0, 1.0, Raylib::GOLD)

      MAX_COLUMNS.times do |i|
        Raylib.draw_cube(positions[i], 2.0, heights[i], 2.0, colors[i])
        Raylib.draw_cube_wires(positions[i], 2.0, heights[i], 2.0, Raylib::MAROON)
      end

      if camera_mode == Raylib::CAMERA_THIRD_PERSON
        Raylib.draw_cube(camera.target, 0.5, 0.5, 0.5, Raylib::PURPLE)
        Raylib.draw_cube_wires(camera.target, 0.5, 0.5, 0.5, Raylib::DARKPURPLE)
      end
    Raylib.end_mode_3d

    # Draw info boxes
    Raylib.draw_rectangle(5, 5, 330, 100, Raylib.fade(Raylib::SKYBLUE, 0.5))
    Raylib.draw_rectangle_lines(5, 5, 330, 100, Raylib::BLUE)

    # Draw info in the left box
    Raylib.draw_text("Camera controls:", 15, 15, 10, Raylib::BLACK)
    Raylib.draw_text("- Move keys: W, A, S, D, Space, Left-Ctrl", 15, 30, 10, Raylib::BLACK)
    Raylib.draw_text("- Look around: arrow keys or mouse", 15, 45, 10, Raylib::BLACK)
    Raylib.draw_text("- Camera mode keys: 1, 2, 3, 4", 15, 60, 10, Raylib::BLACK)
    Raylib.draw_text("- Zoom keys: num-plus, num-minus or mouse scroll", 15, 75, 10, Raylib::BLACK)
    Raylib.draw_text("- Camera projection key: P", 15, 90, 10, Raylib::BLACK)

    Raylib.draw_rectangle(600, 5, 195, 100, Raylib.fade(Raylib::SKYBLUE, 0.5))
    Raylib.draw_rectangle_lines(600, 5, 195, 100, Raylib::BLUE)

    # Draw info in the right box
    Raylib.draw_text("Camera status:", 610, 15, 10, Raylib::BLACK)
    camera_mode_str = case camera_mode
                      when Raylib::CAMERA_FREE then "FREE"
                      when Raylib::CAMERA_FIRST_PERSON then "FIRST_PERSON"
                      when Raylib::CAMERA_THIRD_PERSON then "THIRD_PERSON"
                      when Raylib::CAMERA_ORBITAL then "ORBITAL"
                      else "CUSTOM"
                      end

    projection_str = case camera.projection
                     when Raylib::CAMERA_PERSPECTIVE then "PERSPECTIVE"
                     when Raylib::CAMERA_ORTHOGRAPHIC then "ORTHOGRAPHIC"
                     else "CUSTOM"
                     end

    # Raylib.draw_text(Raylib.text_format("- Mode: %s", :string, camera_mode_str), 610, 30, 10, Raylib::BLACK)
    # Raylib.draw_text(Raylib.text_format("- Projection: %s", :string, projection_str), 610, 45, 10, Raylib::BLACK)
    # Raylib.draw_text(Raylib.text_format("- Position: (%06.3f, %06.3f, %06.3f)", :float, camera.position.x, :float, camera.position.y, :float, camera.position.z), 610, 60, 10, Raylib::BLACK)
    # Raylib.draw_text(Raylib.text_format("- Target: (%06.3f, %06.3f, %06.3f)", :float, camera.target.x, :float, camera.target.y, :float, camera.target.z), 610, 75, 10, Raylib::BLACK)
    # Raylib.draw_text(Raylib.text_format("- Up: (%06.3f, %06.3f, %06.3f)", :float, camera.up.x, :float, camera.up.y, :float, camera.up.z), 610, 90, 10, Raylib::BLACK)

    Raylib.draw_text("- Mode: #{camera_mode_str}", 610, 30, 10, Raylib::BLACK)
    Raylib.draw_text("- Projection: #{projection_str}", 610, 45, 10, Raylib::BLACK)
    Raylib.draw_text(sprintf("- Position: (%06.3f, %06.3f, %06.3f)", camera.position.x, camera.position.y, camera.position.z), 610, 60, 10, Raylib::BLACK)
    Raylib.draw_text(sprintf("- Target: (%06.3f, %06.3f, %06.3f)", camera.target.x, camera.target.y, camera.target.z), 610, 75, 10, Raylib::BLACK)
    Raylib.draw_text(sprintf("- Up: (%06.3f, %06.3f, %06.3f)", camera.up.x, camera.up.y, camera.up.z), 610, 90, 10, Raylib::BLACK)

  Raylib.end_drawing

  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window
# --------------------------------------------------------------------------------------
