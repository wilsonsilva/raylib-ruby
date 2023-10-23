# ******************************************************************************************
# 
#   raylib [shapes] example - following eyes
#
#   Example originally created with raylib 2.5, last time updated with raylib 2.5
# 
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2013-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [shapes] example - following eyes')

sclera_left_position = Raylib::Vector2.create(Raylib.get_screen_width/2.0 - 100.0, Raylib.get_screen_height/2.0)
sclera_right_position = Raylib::Vector2.create(Raylib.get_screen_width/2.0 + 100.0, Raylib.get_screen_height/2.0)
sclera_radius = 80

iris_radius = 24

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  iris_left_position = Raylib.get_mouse_position
  iris_right_position = Raylib.get_mouse_position

  # Check not inside the left eye sclera
  unless Raylib.check_collision_point_circle(iris_left_position, sclera_left_position, sclera_radius - 20)
    dx = iris_left_position.x - sclera_left_position.x
    dy = iris_left_position.y - sclera_left_position.y

    angle = Math.atan2(dy, dx)

    dxx = (sclera_radius - iris_radius)*Math.cos(angle)
    dyy = (sclera_radius - iris_radius)*Math.sin(angle)

    iris_left_position.x = sclera_left_position.x + dxx
    iris_left_position.y = sclera_left_position.y + dyy
  end

  # Check not inside the right eye sclera
  unless Raylib.check_collision_point_circle(iris_right_position, sclera_right_position, sclera_radius - 20)
    dx = iris_right_position.x - sclera_right_position.x
    dy = iris_right_position.y - sclera_right_position.y

    angle = Math.atan2(dy, dx)

    dxx = (sclera_radius - iris_radius)*Math.cos(angle)
    dyy = (sclera_radius - iris_radius)*Math.sin(angle)

    iris_right_position.x = sclera_right_position.x + dxx
    iris_right_position.y = sclera_right_position.y + dyy
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_circle_v(sclera_left_position, sclera_radius, Raylib::LIGHTGRAY)
  Raylib.draw_circle_v(iris_left_position, iris_radius, Raylib::BROWN)
  Raylib.draw_circle_v(iris_left_position, 10, Raylib::BLACK)

  Raylib.draw_circle_v(sclera_right_position, sclera_radius, Raylib::LIGHTGRAY)
  Raylib.draw_circle_v(iris_right_position, iris_radius, Raylib::DARKGREEN)
  Raylib.draw_circle_v(iris_right_position, 10, Raylib::BLACK)

  Raylib.draw_fps(10, 10)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
