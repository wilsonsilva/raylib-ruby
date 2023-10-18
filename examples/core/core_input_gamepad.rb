# ******************************************************************************************
#
#   raylib [core] example - Gamepad input
#
#   NOTE: This example requires a Gamepad connected to the system
#        raylib is configured to work with the following gamepads:
#               - Xbox 360 Controller (Xbox 360, Xbox One)
#               - PLAYSTATION(R)3 Controller
#        Check raylib.h for buttons configuration
#
#   Example originally created with raylib 1.1, last time updated with raylib 4.2
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

# NOTE: Gamepad name ID depends on drivers and OS
XBOX360_LEGACY_NAME_ID = "Xbox Controller"
XBOX360_NAME_ID = defined?(PLATFORM_RPI) ? "Microsoft X-Box 360 pad" : "Xbox 360 Controller"
PS3_NAME_ID = "PLAYSTATION(R)3 Controller"
# PS5_NAME_ID = "DualSense Wireless Controller" # PS5 Controller

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.set_config_flags(Raylib::FLAG_MSAA_4X_HINT) # Set MSAA 4X hint before windows creation

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - gamepad input")

tex_ps3_pad = Raylib.load_texture("/Users/wilson/projects/rb/raylib/examples/core/resources/ps3.png")
tex_xbox_pad = Raylib.load_texture("/Users/wilson/projects/rb/raylib/examples/core/resources/xbox.png")

# TODO: Figure out why relative paths don't work

# tex_ps3_pad = Raylib.load_texture("resources/ps3.png")
# tex_xbox_pad = Raylib.load_texture("resources/xbox.png")

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  if Raylib.is_gamepad_available(0)
    Raylib.draw_text(Raylib.text_format("GP1: %s", :string, Raylib.get_gamepad_name(0)), 10, 10, 10, Raylib::BLACK)

    # Implement drawing logic
    gamepad_name = Raylib.get_gamepad_name(0)
    if gamepad_name == XBOX360_NAME_ID || gamepad_name == XBOX360_LEGACY_NAME_ID
      # Draw Xbox controller
      # Draw buttons: xbox home
      Raylib.draw_circle(394, 89, 19, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_MIDDLE)

      # Draw buttons: basic
      Raylib.draw_circle(436, 150, 9, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_MIDDLE_RIGHT)
      Raylib.draw_circle(352, 150, 9, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_MIDDLE_LEFT)
      Raylib.draw_circle(501, 151, 15, Raylib::BLUE) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_RIGHT_FACE_LEFT)

      # Draw buttons: d-pad
      Raylib.draw_rectangle(317, 202, 19, 71, Raylib::BLACK)
      Raylib.draw_rectangle(293, 228, 69, 19, Raylib::BLACK)

      Raylib.draw_rectangle(317, 202, 19, 26, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_FACE_UP)
      Raylib.draw_rectangle(317, 202 + 45, 19, 26, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_FACE_DOWN)
      Raylib.draw_rectangle(292, 228, 25, 19, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_FACE_LEFT)
      Raylib.draw_rectangle(292 + 44, 228, 26, 19, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_FACE_RIGHT)

      # Draw buttons: left-right back
      Raylib.draw_circle(259, 61, 20, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_TRIGGER_1)
      Raylib.draw_circle(536, 61, 20, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_RIGHT_TRIGGER_1)

      # Draw axis: left joystick
      Raylib.draw_circle(259, 152, 39, Raylib::BLACK)
      Raylib.draw_circle(259, 152, 34, Raylib::LIGHTGRAY)
      Raylib.draw_circle(
        259 + (Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_LEFT_X) * 20).to_i,
        152 + (Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_LEFT_Y) * 20).to_i,
        25, Raylib::BLACK
      )

      # Draw axis: right joystick
      Raylib.draw_circle(461, 237, 38, Raylib::BLACK)
      Raylib.draw_circle(461, 237, 33, Raylib::LIGHTGRAY)
      Raylib.draw_circle(
        461 + (Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_RIGHT_X) * 20).to_i,
        237 + (Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_RIGHT_Y) * 20).to_i,
        25, Raylib::BLACK
      )

      # Draw axis: left-right triggers
      Raylib.draw_rectangle(170, 30, 15, 70, Raylib::GRAY)
      Raylib.draw_rectangle(604, 30, 15, 70, Raylib::GRAY)
      Raylib.draw_rectangle(
        170, 30, 15, ((1 + Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_LEFT_TRIGGER)) / 2 * 70).to_i,
        Raylib::RED
      )
      Raylib.draw_rectangle(
        604, 30, 15, ((1 + Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_RIGHT_TRIGGER)) / 2 * 70).to_i,
        Raylib::RED
      )
    elsif gamepad_name == PS3_NAME_ID
      # Draw PS3 controller
      Raylib.draw_texture(tex_ps3_pad, 0, 0, Raylib::DARKGRAY)

      # Draw buttons: ps
      Raylib.draw_circle(396, 222, 13, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_MIDDLE)

      # Draw buttons: basic
      Raylib.draw_rectangle(328, 170, 32, 13, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_MIDDLE_LEFT)

      if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_MIDDLE_RIGHT)
        # Draw triangle for this specific PS3 button
        Raylib.draw_triangle(Raylib::Vector2.create(436, 168), Raylib::Vector2.create(436, 185), Raylib::Vector2.create(464, 177), Raylib::RED)
      end

      # Draw buttons: d-pad
      Raylib.draw_rectangle(225, 132, 24, 84, Raylib::BLACK)
      Raylib.draw_rectangle(195, 161, 84, 25, Raylib::BLACK)

      Raylib.draw_rectangle(225, 132, 24, 29, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_FACE_UP)
      Raylib.draw_rectangle(225, 132 + 54, 24, 30, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_FACE_DOWN)
      Raylib.draw_rectangle(195, 161, 30, 25, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_FACE_LEFT)
      Raylib.draw_rectangle(195 + 54, 161, 30, 25, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_FACE_RIGHT)

      # Draw buttons: left-right back buttons
      Raylib.draw_circle(239, 82, 20, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_LEFT_TRIGGER_1)
      Raylib.draw_circle(557, 82, 20, Raylib::RED) if Raylib.is_gamepad_button_down(0, Raylib::GAMEPAD_BUTTON_RIGHT_TRIGGER_1)

      # Draw axis: left joystick
      Raylib.draw_circle(319, 255, 35, Raylib::BLACK)
      Raylib.draw_circle(319, 255, 31, Raylib::LIGHTGRAY)
      Raylib.draw_circle(
        319 + (Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_LEFT_X) * 20).to_i,
        255 + (Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_LEFT_Y) * 20).to_i,
        25, Raylib::BLACK
      )

      # Draw axis: right joystick
      Raylib.draw_circle(475, 255, 35, Raylib::BLACK)
      Raylib.draw_circle(475, 255, 31, Raylib::LIGHTGRAY)
      Raylib.draw_circle(
        475 + (Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_RIGHT_X) * 20).to_i,
        255 + (Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_RIGHT_Y) * 20).to_i,
        25, Raylib::BLACK
      )

      # Draw axis: left-right triggers
      Raylib.draw_rectangle(169, 48, 15, 70, Raylib::GRAY)
      Raylib.draw_rectangle(611, 48, 15, 70, Raylib::GRAY)
      Raylib.draw_rectangle(
        169, 48, 15, ((1 - Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_LEFT_TRIGGER)) / 2 * 70).to_i,
        Raylib::RED
      )
      Raylib.draw_rectangle(
        611, 48, 15, ((1 - Raylib.get_gamepad_axis_movement(0, Raylib::GAMEPAD_AXIS_RIGHT_TRIGGER)) / 2 * 70).to_i,
        Raylib::RED
      )
    else
      Raylib.draw_text("- GENERIC GAMEPAD -", 280, 180, 20, Raylib::GRAY)
      # TODO: Draw generic gamepad
    end

    axis_count = Raylib.get_gamepad_axis_count(0)
    Raylib.draw_text(Raylib.text_format("DETECTED AXIS [%i]:", :int, axis_count), 10, 50, 10, Raylib::MAROON)

    axis_count.times do |i|
      Raylib.draw_text(
        Raylib.text_format("AXIS %i: %.02f", :int, i, :float, Raylib.get_gamepad_axis_movement(0, i)), 20, 70 + 20 * i, 10, Raylib::DARKGRAY
      )
    end

    detected_button = Raylib.get_gamepad_button_pressed

    if detected_button != Raylib::GAMEPAD_BUTTON_UNKNOWN
      Raylib.draw_text(Raylib.text_format("DETECTED BUTTON: %i", :int, detected_button), 10, 430, 10, Raylib::RED)
    else
      Raylib.draw_text("DETECTED BUTTON: NONE", 10, 430, 10, Raylib::GRAY)
    end
  else
    Raylib.draw_text("GP1: NOT DETECTED", 10, 10, 10, Raylib::GRAY)
    Raylib.draw_texture(tex_xbox_pad, 0, 0, Raylib::LIGHTGRAY)
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(tex_ps3_pad)
Raylib.unload_texture(tex_xbox_pad)

Raylib.close_window
# --------------------------------------------------------------------------------------
