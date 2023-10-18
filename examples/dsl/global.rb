# ********************************************************************************************
#
#    raylib [dsl] example - Usage of Raylib's DSL directly
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
require 'raylib/dsl'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'My window')
set_target_fps(60)

until window_should_close # Detect window close button or ESC key
  begin_drawing
  clear_background(RAYWHITE)
  draw_text('Congrats! You created your first window!', 190, 200, 20, LIGHTGRAY)
  end_drawing
end

close_window # Close window and OpenGL context
