# ********************************************************************************************
#
#    raylib [dsl] example - Usage of Raylib's namespaced DSL
#
#    Example originally created with raylib 4.5, last time updated with raylib 4.5
#
#    Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#    BSD-like license that allows static linking with closed source software
#
#    Copyright (c) 2023 Wilson Silva (@wilsonsilva)
#
# ********************************************************************************************

require 'bundler/setup'
require 'raylib'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'My window')
Raylib.set_target_fps(60)

until Raylib.window_should_close # Detect window close button or ESC key
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_text('Congrats! You created your first window!', 190, 200, 20, Raylib::LIGHTGRAY)
  Raylib.end_drawing
end

Raylib.close_window # Close window and OpenGL context
