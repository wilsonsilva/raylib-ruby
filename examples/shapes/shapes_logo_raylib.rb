# ******************************************************************************************
# 
#   raylib [shapes] example - Draw raylib logo using basic shapes
#
#   Example originally created with raylib 1.0, last time updated with raylib 1.0
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [shapes] example - raylib logo using shapes')

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_rectangle(SCREEN_WIDTH / 2 - 128, SCREEN_HEIGHT / 2 - 128, 256, 256, Raylib::BLACK)
  Raylib.draw_rectangle(SCREEN_WIDTH / 2 - 112, SCREEN_HEIGHT / 2 - 112, 224, 224, Raylib::RAYWHITE)
  Raylib.draw_text('raylib', SCREEN_WIDTH / 2 - 44, SCREEN_HEIGHT / 2 + 48, 50, Raylib::BLACK)
  Raylib.draw_text('this is NOT a texture!', 350, 370, 10, Raylib::GRAY)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
