# ******************************************************************************************
# 
#   raylib [shapes] example - easings rectangle array
#
#   NOTE: This example requires 'easings.h' library, provided on raylib/src. Just copy
#   the library to same directory as example or make sure it's available on include path.
#
#   Example originally created with raylib 2.0, last time updated with raylib 2.5
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

require_relative 'reasings' # Required for easing functions

RECS_WIDTH = 50
RECS_HEIGHT = 50
MAX_RECS_X = 800 / RECS_WIDTH
MAX_RECS_Y = 450 / RECS_HEIGHT
PLAY_TIME_IN_FRAMES = 240 # At 60 fps = 4 seconds

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [shapes] example - easings rectangle array")

recs = Array.new(MAX_RECS_X * MAX_RECS_Y) { Raylib::Rectangle.new }

(MAX_RECS_Y).times do |y|
  (MAX_RECS_X).times do |x|
    recs[y * MAX_RECS_X + x].x = RECS_WIDTH / 2.0 + RECS_WIDTH * x
    recs[y * MAX_RECS_X + x].y = RECS_HEIGHT / 2.0 + RECS_HEIGHT * y
    recs[y * MAX_RECS_X + x].width = RECS_WIDTH
    recs[y * MAX_RECS_X + x].height = RECS_HEIGHT
  end
end

rotation = 0.0
frames_counter = 0
state = 0 # Rectangles animation state: 0-Playing, 1-Finished

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  if state.zero?
    frames_counter += 1
    (MAX_RECS_X * MAX_RECS_Y).times do |i|
      recs[i].height = Reasings.ease_circ_out(frames_counter.to_f, RECS_HEIGHT, -RECS_HEIGHT, PLAY_TIME_IN_FRAMES)
      recs[i].width = Reasings.ease_circ_out(frames_counter.to_f, RECS_WIDTH, -RECS_WIDTH, PLAY_TIME_IN_FRAMES)

      recs[i].height = 0 if recs[i].height.negative?
      recs[i].width = 0 if recs[i].width.negative?

      state = 1 if recs[i].height.zero? && recs[i].width.zero? # Finish playing

      rotation = Reasings.ease_linear_in(frames_counter.to_f, 0.0, 360.0, PLAY_TIME_IN_FRAMES)
    end
  elsif state == 1 && Raylib.is_key_pressed(Raylib::KEY_SPACE)
    # When animation has finished, press space to restart
    frames_counter = 0

    (MAX_RECS_X * MAX_RECS_Y).times do |i|
      recs[i].height = RECS_HEIGHT
      recs[i].width = RECS_WIDTH
    end

    state = 0
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  if state.zero?
    (MAX_RECS_X * MAX_RECS_Y).times do |i|
      Raylib.draw_rectangle_pro(
        recs[i],
        Raylib::Vector2.create(recs[i].width / 2, recs[i].height / 2),
        rotation,
        Raylib::RED
      )
    end
  elsif state == 1
    Raylib.draw_text("PRESS [SPACE] TO PLAY AGAIN!", 240, 200, 20, Raylib::GRAY)
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
