# ******************************************************************************************
#
#   raylib [text] example - Text formatting
#
#   Example originally created with raylib 1.1, last time updated with raylib 3.0
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [text] example - text formatting")

score = 100020
hiscore = 200450
lives = 5

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_text(Raylib.text_format("Score: %08i", :int, score), 200, 80, 20, Raylib::RED)
  Raylib.draw_text(Raylib.text_format("HiScore: %08i", :int, hiscore), 200, 120, 20, Raylib::GREEN)
  Raylib.draw_text(Raylib.text_format("Lives: %02i", :int, lives), 200, 160, 40, Raylib::BLUE)
  Raylib.draw_text(Raylib.text_format("Elapsed Time: %02.02f ms", :float, Raylib.get_frame_time * 1000), 200, 220, 20, Raylib::BLACK)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
