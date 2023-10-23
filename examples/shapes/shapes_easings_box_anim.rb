# ******************************************************************************************
#
#   raylib [shapes] example - easings box anim
#
#   Example originally created with raylib 2.5, last time updated with raylib 2.5
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

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [shapes] example - easings box anim')

# Box variables to be animated with easings
rec = Raylib::Rectangle.create(Raylib.get_screen_width / 2.0, -100, 100, 100)
rotation = 0.0
alpha = 1.0

state = 0
frames_counter = 0

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  case state
  when 0 # Move box down to center of screen
    frames_counter += 1

    # NOTE: Remember that 3rd parameter of easing function refers to
    # desired value variation, do not confuse it with expected final value!
    rec.y = Reasings.ease_elastic_out(frames_counter.to_f, -100, (Raylib.get_screen_height / 2.0) + 100, 120)

    if frames_counter >= 120
      frames_counter = 0
      state = 1
    end
  when 1 # Scale box to an horizontal bar
    frames_counter += 1
    rec.height = Reasings.ease_bounce_out(frames_counter.to_f, 100, -90, 120)
    rec.width = Reasings.ease_bounce_out(frames_counter.to_f, 100, Raylib.get_screen_width.to_f, 120)

    if frames_counter >= 120
      frames_counter = 0
      state = 2
    end
  when 2 # Rotate horizontal bar rectangle
    frames_counter += 1
    rotation = Reasings.ease_quad_out(frames_counter.to_f, 0.0, 270.0, 240)

    if frames_counter >= 240
      frames_counter = 0
      state = 3
    end
  when 3 # Increase bar size to fill all screen
    frames_counter += 1
    rec.height = Reasings.ease_circ_out(frames_counter.to_f, 10, Raylib.get_screen_width.to_f, 120)

    if frames_counter >= 120
      frames_counter = 0
      state = 4
    end
  when 4 # Fade out animation
    frames_counter += 1
    alpha = Reasings.ease_sine_out(frames_counter.to_f, 1.0, -1.0, 160)

    if frames_counter >= 160
      frames_counter = 0
      state = 5
    end
  end

  # Reset animation at any moment
  if Raylib.is_key_pressed(Raylib::KEY_SPACE)
    rec = Raylib::Rectangle.create(Raylib.get_screen_width / 2.0, -100, 100, 100)
    rotation = 0.0
    alpha = 1.0
    state = 0
    frames_counter = 0
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_rectangle_pro(rec, Raylib::Vector2.create(rec.width / 2, rec.height / 2), rotation, Raylib.fade(Raylib::BLACK, alpha))

  Raylib.draw_text('PRESS [SPACE] TO RESET BOX ANIMATION!', 10, Raylib.get_screen_height - 25, 20, Raylib::LIGHTGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
