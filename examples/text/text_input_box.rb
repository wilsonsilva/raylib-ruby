# ******************************************************************************************
#
#   raylib [text] example - Input Box
#
#   Example originally created with raylib 1.7, last time updated with raylib 3.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2017-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [text] example - input box')

MAX_INPUT_CHARS = 9

name = ''
letter_count = 0

text_box = Raylib::Rectangle.create((SCREEN_WIDTH / 2.0) - 100, 180, 225, 50)

frames_counter = 0

Raylib.set_target_fps(10)
# --------------------------------------------------------------------------------------

def is_any_key_pressed
  key_pressed = false
  key = Raylib.get_key_pressed

  key_pressed = true if (key >= 32) && (key <= 126)

  key_pressed
end

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------
  mouse_on_text = Raylib.check_collision_point_rec(Raylib.get_mouse_position, text_box)

  if mouse_on_text
    # Set the window's cursor to the I-Beam
    Raylib.set_mouse_cursor(Raylib::MOUSE_CURSOR_IBEAM)

    # Get char pressed (unicode character) on the queue
    key = Raylib.get_char_pressed

    # Check if more characters have been pressed on the same frame
    while key > 0
      # Only allow keys in range [32..125]
      if (key >= 32) && (key <= 125) && (letter_count < MAX_INPUT_CHARS)
        name += key.chr
        letter_count += 1
      end

      key = Raylib.get_char_pressed
    end

    if Raylib.is_key_pressed(Raylib::KEY_BACKSPACE)
      letter_count -= 1
      letter_count = 0 if letter_count < 0
      name = name[0...-1]
    end
  else
    Raylib.set_mouse_cursor(Raylib::MOUSE_CURSOR_DEFAULT)
  end

  frames_counter += 1 if mouse_on_text
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_text('PLACE MOUSE OVER INPUT BOX!', 240, 140, 20, Raylib::GRAY)

  Raylib.draw_rectangle_rec(text_box, Raylib::LIGHTGRAY)

  if mouse_on_text
    Raylib.draw_rectangle_lines(text_box.x.to_i, text_box.y.to_i, text_box.width.to_i, text_box.height.to_i, Raylib::RED)
  else
    Raylib.draw_rectangle_lines(text_box.x.to_i, text_box.y.to_i, text_box.width.to_i, text_box.height.to_i, Raylib::DARKGRAY)
  end

  Raylib.draw_text(name, text_box.x.to_i + 5, text_box.y.to_i + 8, 40, Raylib::MAROON)

  Raylib.draw_text(Raylib.text_format('INPUT CHARS: %i/%i', :int, letter_count, :int, MAX_INPUT_CHARS), 315, 250, 20, Raylib::DARKGRAY)

  if mouse_on_text
    if letter_count < MAX_INPUT_CHARS
      # Draw blinking underscore char
      Raylib.draw_text('_', text_box.x.to_i + 8 + Raylib.measure_text(name, 40), text_box.y.to_i + 12, 40, Raylib::MAROON) if (frames_counter / 20) % 2 == 0
    else
      Raylib.draw_text('Press BACKSPACE to delete chars...', 230, 300, 20, Raylib::GRAY)
    end
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window
# --------------------------------------------------------------------------------------
