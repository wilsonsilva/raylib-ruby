# ******************************************************************************************
#
#   raylib [core] example - Input Gestures Detection
#
#   Example originally created with raylib 1.4, last time updated with raylib 4.2
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2016-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

MAX_GESTURE_STRINGS = 20

# Initialization
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - input gestures")

touch_position = Raylib::Vector2.create(0, 0)
touch_area = Raylib::Rectangle.create(220, 10, SCREEN_WIDTH - 230.0, SCREEN_HEIGHT - 20.0)

gestures_count = 0
gesture_strings = Array.new(MAX_GESTURE_STRINGS) { "" }

current_gesture = Raylib::GESTURE_NONE
last_gesture = Raylib::GESTURE_NONE

# Uncomment to enable only some gestures to be detected
# Raylib.set_gestures_enabled(0b0000000000001001)

Raylib.set_target_fps(60)
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close do
  # Update
  #----------------------------------------------------------------------------------
  last_gesture = current_gesture
  current_gesture = Raylib.get_gesture_detected
  touch_position = Raylib.get_touch_position(0)

  if Raylib.check_collision_point_rec(touch_position, touch_area) && (current_gesture != Raylib::GESTURE_NONE)
    if current_gesture != last_gesture
      # Store gesture string
      case current_gesture
      when Raylib::GESTURE_TAP
        gesture_strings[gestures_count] = "GESTURE TAP"
      when Raylib::GESTURE_DOUBLETAP
        gesture_strings[gestures_count] = "GESTURE DOUBLETAP"
      when Raylib::GESTURE_HOLD
        gesture_strings[gestures_count] = "GESTURE HOLD"
      when Raylib::GESTURE_DRAG
        gesture_strings[gestures_count] = "GESTURE DRAG"
      when Raylib::GESTURE_SWIPE_RIGHT
        gesture_strings[gestures_count] = "GESTURE SWIPE RIGHT"
      when Raylib::GESTURE_SWIPE_LEFT
        gesture_strings[gestures_count] = "GESTURE SWIPE LEFT"
      when Raylib::GESTURE_SWIPE_UP
        gesture_strings[gestures_count] = "GESTURE SWIPE UP"
      when Raylib::GESTURE_SWIPE_DOWN
        gesture_strings[gestures_count] = "GESTURE SWIPE DOWN"
      when Raylib::GESTURE_PINCH_IN
        gesture_strings[gestures_count] = "GESTURE PINCH IN"
      when Raylib::GESTURE_PINCH_OUT
        gesture_strings[gestures_count] = "GESTURE PINCH OUT"
      end

      gestures_count += 1

      # Reset gestures strings
      if gestures_count >= MAX_GESTURE_STRINGS
        gesture_strings.map! { "" }
        gestures_count = 0
      end
    end
  end
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing do
    Raylib.clear_background(Raylib::RAYWHITE)

    Raylib.draw_rectangle_rec(touch_area, Raylib::GRAY)
    Raylib.draw_rectangle(225, 15, SCREEN_WIDTH - 240, SCREEN_HEIGHT - 30, Raylib::RAYWHITE)

    Raylib.draw_text("GESTURES TEST AREA", SCREEN_WIDTH - 270, SCREEN_HEIGHT - 40, 20, Raylib.fade(Raylib::GRAY, 0.5))

    gestures_count.times do |i|
      color = i.even? ? Raylib.fade(Raylib::LIGHTGRAY, 0.5) : Raylib.fade(Raylib::LIGHTGRAY, 0.3)
      Raylib.draw_rectangle(10, 30 + 20 * i, 200, 20, color)

      text_color = (i < gestures_count - 1) ? Raylib::DARKGRAY : Raylib::MAROON
      Raylib.draw_text(gesture_strings[i], 35, 36 + 20 * i, 10, text_color)
    end

    Raylib.draw_rectangle_lines(10, 29, 200, SCREEN_HEIGHT - 50, Raylib::GRAY)
    Raylib.draw_text("DETECTED GESTURES", 50, 15, 10, Raylib::GRAY)

    Raylib.draw_circle_v(touch_position, 30, Raylib::MAROON) if current_gesture != Raylib::GESTURE_NONE
  end
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window
#--------------------------------------------------------------------------------------
