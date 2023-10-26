# ******************************************************************************************
#
#   raylib [core] example - Input multitouch
#
#   Example originally created with raylib 2.1, last time updated with raylib 2.5
#   Example contributed by Berni (@Berni8k) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2019-2023 Berni (@Berni8k) and Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

MAX_TOUCH_POINTS = 10

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - input multitouch")

touch_positions = Array.new(MAX_TOUCH_POINTS) { Raylib::Vector2.create(0.0, 0.0) }

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  touch_point_count = Raylib.get_touch_point_count
  touch_point_count = MAX_TOUCH_POINTS if touch_point_count > MAX_TOUCH_POINTS

  touch_point_count.times do |i|
    touch_positions[i] = Raylib.get_touch_position(i)
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  touch_positions.each do |touch_position|
    if touch_position.x > 0 && touch_position.y > 0
      Raylib.draw_circle_v(touch_position, 34, Raylib::ORANGE)
      Raylib.draw_text(i.to_s, touch_position.x - 10, touch_position.y - 70, 40, Raylib::BLACK)
    end
  end

  Raylib.draw_text("touch the screen at multiple locations to get multiple balls", 10, 10, 20, Raylib::DARKGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window
# --------------------------------------------------------------------------------------
