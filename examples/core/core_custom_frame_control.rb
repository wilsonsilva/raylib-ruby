# ******************************************************************************************
#
#   raylib [core] example - custom frame control
#
#   NOTE: WARNING: This is an example for advance users willing to have full control over
#   the frame processes. By default, EndDrawing() calls the following processes:
#      1. Draw remaining batch data: rlDrawRenderBatchActive()
#      2. SwapScreenBuffer()
#      3. Frame time control: WaitTime()
#      4. PollInputEvents()
#
#   To avoid steps 2, 3 and 4, flag SUPPORT_CUSTOM_FRAME_CONTROL can be enabled in
#   config.h (it requires recompiling raylib). This way those steps are up to the user.
#
#   Note that enabling this flag invalidates some functions:
#      - GetFrameTime()
#      - SetTargetFPS()
#      - GetFPS()
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2021-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - custom frame control")

# Custom timing variables
previous_time = Raylib.get_time  # Previous time measure
current_time = 0.0               # Current time measure
update_draw_time = 0.0           # Update + Draw time
wait_time = 0.0                  # Wait time (if target fps required)
delta_time = 0.0                 # Frame time (Update + Draw + Wait time)

time_counter = 0.0               # Accumulative time counter (seconds)
position = 0.0                   # Circle position
pause = false                    # Pause control flag

target_fps = 60                  # Our initial target fps
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  Raylib.poll_input_events # Poll input events (SUPPORT_CUSTOM_FRAME_CONTROL)

  pause = !pause if Raylib.is_key_pressed(Raylib::KEY_SPACE)

  target_fps += 20 if Raylib.is_key_pressed(Raylib::KEY_UP)
  target_fps -= 20 if Raylib.is_key_pressed(Raylib::KEY_DOWN)

  target_fps = 0 if target_fps < 0

  unless pause
    position += 200 * delta_time # We move at 200 pixels per second
    position = 0 if position >= Raylib.get_screen_width
    time_counter += delta_time # We count time (seconds)
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  (Raylib.get_screen_width / 200).times do |i|
    Raylib.draw_rectangle(200 * i, 0, 1, Raylib.get_screen_height, Raylib::SKYBLUE)
  end

  Raylib.draw_circle(position.to_i, Raylib.get_screen_height / 2 - 25, 50, Raylib::RED)

  Raylib.draw_text(Raylib.text_format("%03.0f ms", :double, time_counter * 1000.0), position.to_i - 40, Raylib.get_screen_height / 2 - 100, 20, Raylib::MAROON)
  Raylib.draw_text(Raylib.text_format("PosX: %03.0f", :double, position), position.to_i - 50, Raylib.get_screen_height / 2 + 40, 20, Raylib::BLACK)

  Raylib.draw_text("Circle is moving at a constant 200 pixels/sec,\nindependently of the frame rate.", 10, 10, 20, Raylib::DARKGRAY)
  Raylib.draw_text("PRESS SPACE to PAUSE MOVEMENT", 10, Raylib.get_screen_height - 60, 20, Raylib::GRAY)
  Raylib.draw_text("PRESS UP | DOWN to CHANGE TARGET FPS", 10, Raylib.get_screen_height - 30, 20, Raylib::GRAY)
  Raylib.draw_text(Raylib.text_format("TARGET FPS: %i", :int, target_fps), Raylib.get_screen_width - 220, 10, 20, Raylib::LIME)
  # TODO: This is causing Infinity (FloatDomainError) error
  # Raylib.draw_text(Raylib.text_format("CURRENT FPS: %i", :int, (1.0 / delta_time).to_i), Raylib.get_screen_width - 220, 40, 20, Raylib::GREEN)

  Raylib.end_drawing

  # NOTE: In case raylib is configured to SUPPORT_CUSTOM_FRAME_CONTROL,
  # Events polling, screen buffer swap, and frame time control must be managed by the user

  Raylib.swap_screen_buffer # Flip the back buffer to screen (front buffer)

  current_time = Raylib.get_time
  update_draw_time = current_time - previous_time

  if target_fps > 0 # We want a fixed frame rate
    wait_time = (1.0 / target_fps.to_f) - update_draw_time

    if wait_time > 0.0
      Raylib.wait_time(wait_time.to_f)
      current_time = Raylib.get_time
      delta_time = current_time - previous_time
    end
  else
    delta_time = update_draw_time.to_f # Framerate could be variable
  end

  previous_time = current_time
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
