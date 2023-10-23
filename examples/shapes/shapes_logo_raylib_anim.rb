# ******************************************************************************************
#
#   raylib [shapes] example - raylib logo animation
#
#   Example originally created with raylib 2.5, last time updated with raylib 4.0
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [shapes] example - raylib logo animation')

logo_position_x = (SCREEN_WIDTH / 2) - 128
logo_position_y = (SCREEN_HEIGHT / 2) - 128

frames_counter = 0
letters_count = 0

top_side_rec_width = 16
left_side_rec_height = 16

bottom_side_rec_width = 16
right_side_rec_height = 16

state = 0 # Tracking animation states (State Machine)
alpha = 1.0 # Useful for fading

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  case state
  when 0 # State 0: Small box blinking
    frames_counter += 1

    if frames_counter == 120
      state = 1
      frames_counter = 0
    end
  when 1 # State 1: Top and left bars growing
    top_side_rec_width += 4
    left_side_rec_height += 4

    state = 2 if top_side_rec_width == 256
  when 2 # State 2: Bottom and right bars growing
    bottom_side_rec_width += 4
    right_side_rec_height += 4

    state = 3 if bottom_side_rec_width == 256
  when 3 # State 3: Letters appearing (one by one)
    frames_counter += 1

    if frames_counter / 12 # Every 12 frames, one more letter!
      letters_count += 1
      frames_counter = 0
    end

    if letters_count >= 10 # When all letters have appeared, just fade out everything
      alpha -= 0.02

      if alpha <= 0.0
        alpha = 0.0
        state = 4
      end
    end
  when 4 # State 4: Reset and Replay
    if Raylib.is_key_pressed(Raylib::KEY_R)
      frames_counter = 0
      letters_count = 0

      top_side_rec_width = 16
      left_side_rec_height = 16

      bottom_side_rec_width = 16
      right_side_rec_height = 16

      alpha = 1.0
      state = 0
    end
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  case state
  when 0
    Raylib.draw_rectangle(logo_position_x, logo_position_y, 16, 16, Raylib::BLACK) if (frames_counter / 15) % 2 == 1
  when 1
    Raylib.draw_rectangle(logo_position_x, logo_position_y, top_side_rec_width, 16, Raylib::BLACK)
    Raylib.draw_rectangle(logo_position_x, logo_position_y, 16, left_side_rec_height, Raylib::BLACK)
  when 2
    Raylib.draw_rectangle(logo_position_x, logo_position_y, top_side_rec_width, 16, Raylib::BLACK)
    Raylib.draw_rectangle(logo_position_x, logo_position_y, 16, left_side_rec_height, Raylib::BLACK)
    Raylib.draw_rectangle(logo_position_x + 240, logo_position_y, 16, right_side_rec_height, Raylib::BLACK)
    Raylib.draw_rectangle(logo_position_x, logo_position_y + 240, bottom_side_rec_width, 16, Raylib::BLACK)
  when 3
    Raylib.draw_rectangle(logo_position_x, logo_position_y, top_side_rec_width, 16, Raylib.fade(Raylib::BLACK, alpha))
    Raylib.draw_rectangle(logo_position_x, logo_position_y + 16, 16, left_side_rec_height - 32, Raylib.fade(Raylib::BLACK, alpha))
    Raylib.draw_rectangle(logo_position_x + 240, logo_position_y + 16, 16, right_side_rec_height - 32, Raylib.fade(Raylib::BLACK, alpha))
    Raylib.draw_rectangle(logo_position_x, logo_position_y + 240, bottom_side_rec_width, 16, Raylib.fade(Raylib::BLACK, alpha))
    Raylib.draw_rectangle((SCREEN_WIDTH / 2) - 112, (SCREEN_HEIGHT / 2) - 112, 224, 224, Raylib.fade(Raylib::RAYWHITE, alpha))
    Raylib.draw_text(Raylib.text_subtext('raylib', 0, letters_count), (SCREEN_WIDTH / 2) - 44, (SCREEN_HEIGHT / 2) + 48, 50, Raylib.fade(Raylib::BLACK, alpha))
  when 4
    Raylib.draw_text('[R] REPLAY', 340, 200, 20, Raylib::GRAY)
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
