# ******************************************************************************************
#
#   raylib [shapes] example - Draw basic shapes 2d (rectangle, circle, line...)
#
#   Example originally created with raylib 1.0, last time updated with raylib 4.2
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [shapes] example - basic shapes drawing")

rotation = 0.0

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  rotation += 0.2
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text("some basic shapes available on raylib", 20, 20, 20, Raylib::DARKGRAY)

  # Circle shapes and lines
  Raylib.draw_circle(SCREEN_WIDTH/5, 120, 35, Raylib::DARKBLUE)
  Raylib.draw_circle_gradient(SCREEN_WIDTH/5, 220, 60, Raylib::GREEN, Raylib::SKYBLUE)
  Raylib.draw_circle_lines(SCREEN_WIDTH/5, 340, 80, Raylib::DARKBLUE)

  # Rectangle shapes and lines
  Raylib.draw_rectangle(SCREEN_WIDTH/4*2 - 60, 100, 120, 60, Raylib::RED)
  Raylib.draw_rectangle_gradient_h(SCREEN_WIDTH/4*2 - 90, 170, 180, 130, Raylib::MAROON, Raylib::GOLD)
  Raylib.draw_rectangle_lines(SCREEN_WIDTH/4*2 - 40, 320, 80, 60, Raylib::ORANGE)

  # Triangle shapes and lines
  Raylib.draw_triangle(
    Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3.0, 80.0),
    Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3.0 - 60.0, 150.0),
    Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3.0 + 60.0, 150.0),
    Raylib::VIOLET
  )

  Raylib.draw_triangle_lines(
    Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3.0, 160.0),
    Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3.0 - 20.0, 230.0),
    Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3.0 + 20.0, 230.0),
    Raylib::DARKBLUE
  )

  # Polygon shapes and lines
  Raylib.draw_poly(Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3, 330), 6, 80, rotation, Raylib::BROWN)
  Raylib.draw_poly_lines(Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3, 330), 6, 90, rotation, Raylib::BROWN)
  Raylib.draw_poly_lines_ex(Raylib::Vector2.create(SCREEN_WIDTH/4.0 * 3, 330), 6, 85, rotation, 6, Raylib::BEIGE)

  Raylib.draw_line(18, 42, SCREEN_WIDTH - 18, 42, Raylib::BLACK)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
