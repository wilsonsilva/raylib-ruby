# ******************************************************************************************
#
#   raylib [core] example - smooth pixel-perfect camera
#
#   Example originally created with raylib 3.7, last time updated with raylib 4.0

#   Example contributed by Giancamillo Alessandroni (@NotManyIdeasDev) and
#   reviewed by Ramon Santamaria (@raysan5)
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib#libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2021-2023 Giancamillo Alessandroni (@NotManyIdeasDev) and Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

VIRTUAL_SCREEN_WIDTH = 160
VIRTUAL_SCREEN_HEIGHT = 90

VIRTUAL_RATIO = (SCREEN_WIDTH / VIRTUAL_SCREEN_WIDTH).to_f

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - smooth pixel-perfect camera")

world_space_camera = Raylib::Camera2D.create(Raylib::Vector2.create(0, 0), Raylib::Vector2.create(0, 0), 0, 0) # Game world camera
world_space_camera.zoom = 1.0

screen_space_camera = Raylib::Camera2D.create(Raylib::Vector2.create(0, 0), Raylib::Vector2.create(0, 0), 0, 0) # Smoothing camera
screen_space_camera.zoom = 1.0

target = Raylib.load_render_texture(VIRTUAL_SCREEN_WIDTH, VIRTUAL_SCREEN_HEIGHT) # This is where we'll draw all our objects.

rec01 = Raylib::Rectangle.create(70.0, 35.0, 20.0, 20.0)
rec02 = Raylib::Rectangle.create(90.0, 55.0, 30.0, 10.0)
rec03 = Raylib::Rectangle.create(80.0, 65.0, 15.0, 25.0)

# The target's height is flipped (in the source Rectangle), due to OpenGL reasons
source_rec = Raylib::Rectangle.create(0.0, 0.0, target.texture.width.to_f, -target.texture.height.to_f)
dest_rec   = Raylib::Rectangle.create(-VIRTUAL_RATIO, -VIRTUAL_RATIO, SCREEN_WIDTH + (VIRTUAL_RATIO * 2), SCREEN_HEIGHT + (VIRTUAL_RATIO * 2))

origin = Raylib::Vector2.create(0.0, 0.0)

rotation = 0.0

camera_x = 0.0
camera_y = 0.0

Raylib.set_target_fps(60)
#--------------------------------------------------------------------------------------

# Main game loop
while (!Raylib.window_should_close) # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  rotation += 60.0 * Raylib.get_frame_time # Rotate the rectangles, 60 degrees per second

  # Make the camera move to demonstrate the effect
  camera_x = (Math.sin(Raylib.get_time) * 50.0) - 10.0
  camera_y = Math.cos(Raylib.get_time) * 30.0

  # Set the camera's target to the values computed above
  screen_space_camera.target = Raylib::Vector2.create(camera_x, camera_y)

  # Round worldSpace coordinates, keep decimals into screenSpace coordinates
  world_space_camera.target.x = screen_space_camera.target.x.to_i
  screen_space_camera.target.x -= world_space_camera.target.x
  screen_space_camera.target.x *= VIRTUAL_RATIO

  world_space_camera.target.y = screen_space_camera.target.y.to_i
  screen_space_camera.target.y -= world_space_camera.target.y
  screen_space_camera.target.y *= VIRTUAL_RATIO
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_texture_mode(target)
    Raylib.clear_background(Raylib::RAYWHITE)

    Raylib.begin_mode_2d(world_space_camera)
      Raylib.draw_rectangle_pro(rec01, origin, rotation, Raylib::BLACK)
      Raylib.draw_rectangle_pro(rec02, origin, -rotation, Raylib::RED)
      Raylib.draw_rectangle_pro(rec03, origin, rotation + 45.0, Raylib::BLUE)
    Raylib.end_mode_2d
  Raylib.end_texture_mode

  Raylib.begin_drawing
    Raylib.clear_background(Raylib::RED)

    Raylib.begin_mode_2d(screen_space_camera)
      Raylib.draw_texture_pro(target.texture, source_rec, dest_rec, origin, 0.0, Raylib::WHITE)
    Raylib.end_mode_2d

    Raylib.draw_text("Screen resolution: #{SCREEN_WIDTH}x#{SCREEN_HEIGHT}", 10, 10, 20, Raylib::DARKBLUE)
    Raylib.draw_text("World resolution: #{VIRTUAL_SCREEN_WIDTH}/#{VIRTUAL_SCREEN_HEIGHT}", 10, 40, 20, Raylib::DARKGREEN)
    Raylib.draw_fps(Raylib.get_screen_width - 95, 10)
  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.unload_render_texture(target) # Unload render texture

Raylib.close_window # Close window and OpenGL context
#--------------------------------------------------------------------------------------
