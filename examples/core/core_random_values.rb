# ******************************************************************************************
#
#   raylib [core] example - Generate random values
#
#   Example originally created with raylib 1.1, last time updated with raylib 1.1
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

# Program main entry point
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - generate random values")

# SetRandomSeed(0xaabbccff) # Set a custom random seed if desired, by default: "time(NULL)"

rand_value = Raylib.get_random_value(-8, 5) # Get a random integer number between -8 and 5 (both included)

frames_counter = 0 # Variable used to count frames

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  frames_counter += 1

  # Every two seconds (120 frames) a new random value is generated
  if (frames_counter / 120).odd?
    rand_value = Raylib.get_random_value(-8, 5)
    frames_counter = 0
  end

  # Draw
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text("Every 2 seconds a new random value is generated:", 130, 100, 20, Raylib::MAROON)

  Raylib.draw_text(Raylib.text_format("%i", :int, rand_value), 360, 180, 80, Raylib::LIGHTGRAY)

  Raylib.end_drawing
end

# De-Initialization
Raylib.close_window # Close window and OpenGL context
