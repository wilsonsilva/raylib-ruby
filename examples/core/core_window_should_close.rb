# ******************************************************************************************
#
#   raylib [core] example - Window should close
#
#   Example originally created with raylib 4.2, last time updated with raylib 4.2
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

# Initialization
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - window should close")

Raylib.set_exit_key(Raylib::KEY_NULL) # Disable KEY_ESCAPE to close window, X-button still works

exit_window_requested = false # Flag to request window to exit
exit_window = false # Flag to set window to exit

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------

# Main game loop
until exit_window
  # Update
  #----------------------------------------------------------------------------------
  # Detect if X-button or KEY_ESCAPE have been pressed to close window
  if Raylib.window_should_close || Raylib.is_key_pressed(Raylib::KEY_ESCAPE)
    exit_window_requested = true
  end

  if exit_window_requested
    # A request for close window has been issued, we can save data before closing
    # or just show a message asking for confirmation

    if Raylib.is_key_pressed(Raylib::KEY_Y)
      exit_window = true
    elsif Raylib.is_key_pressed(Raylib::KEY_N)
      exit_window_requested = false
    end
  end
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  if exit_window_requested
    Raylib.draw_rectangle(0, 100, SCREEN_WIDTH, 200, Raylib::BLACK)
    Raylib.draw_text("Are you sure you want to exit program? [Y/N]", 40, 180, 30, Raylib::WHITE)
  else
    Raylib.draw_text("Try to close the window to get confirmation message!", 120, 200, 20, Raylib::LIGHTGRAY)
  end

  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
#--------------------------------------------------------------------------------------
