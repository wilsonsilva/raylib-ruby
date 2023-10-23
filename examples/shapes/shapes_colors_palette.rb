# ******************************************************************************************
#
#   raylib [shapes] example - Colors palette
#
#   Example originally created with raylib 1.0, last time updated with raylib 2.5
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [shapes] example - colors palette')

MAX_COLORS_COUNT = 21 # Number of colors available

colors = [
  Raylib::DARKGRAY, Raylib::MAROON, Raylib::ORANGE, Raylib::DARKGREEN, Raylib::DARKBLUE, Raylib::DARKPURPLE,
  Raylib::DARKBROWN, Raylib::GRAY, Raylib::RED, Raylib::GOLD, Raylib::LIME, Raylib::BLUE, Raylib::VIOLET, Raylib::BROWN,
  Raylib::LIGHTGRAY, Raylib::PINK, Raylib::YELLOW, Raylib::GREEN, Raylib::SKYBLUE, Raylib::PURPLE, Raylib::BEIGE
]

COLOR_NAMES = %w[
  DARKGRAY MAROON ORANGE DARKGREEN DARKBLUE DARKPURPLE DARKBROWN GRAY RED GOLD LIME
  BLUE VIOLET BROWN LIGHTGRAY PINK YELLOW GREEN SKYBLUE PURPLE BEIGE
].freeze

colors_recs = Array.new(MAX_COLORS_COUNT) do |i|
  Raylib::Rectangle.create(
    20.0 + 100.0 * (i % 7) + 10.0 * (i % 7),
    80.0 + 100.0 * (i / 7) + 10.0 * (i / 7),
    100.0,
    100.0
  )
end

color_state = Array.new(MAX_COLORS_COUNT, 0) # Color state: 0-DEFAULT, 1-MOUSE_HOVER

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  mouse_point = Raylib.get_mouse_position

  MAX_COLORS_COUNT.times do |i|
    color_state[i] = Raylib.check_collision_point_rec(mouse_point, colors_recs[i]) ? 1 : 0
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_text('raylib colors palette', 28, 42, 20, Raylib::BLACK)
  Raylib.draw_text(
    'press SPACE to see all colors',
    Raylib.get_screen_width - 180,
    Raylib.get_screen_height - 40, 10, Raylib::GRAY
  )

  MAX_COLORS_COUNT.times do |i| # Draw all rectangles
    Raylib.draw_rectangle_rec(colors_recs[i], Raylib.fade(colors[i], color_state[i] == 1 ? 0.6 : 1.0))

    if Raylib.is_key_down(Raylib::KEY_SPACE) || color_state[i] == 1
      Raylib.draw_rectangle(
        colors_recs[i].x, colors_recs[i].y + colors_recs[i].height - 26,
        colors_recs[i].width, 20, Raylib::BLACK
      )
      Raylib.draw_rectangle_lines_ex(colors_recs[i], 6, Raylib.fade(Raylib::BLACK, 0.3))
      Raylib.draw_text(
        COLOR_NAMES[i], colors_recs[i].x + colors_recs[i].width - Raylib.measure_text(COLOR_NAMES[i], 10) - 12,
        colors_recs[i].y + colors_recs[i].height - 20, 10, colors[i]
      )
    end
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
