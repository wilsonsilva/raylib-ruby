# ******************************************************************************************
#
#   raylib [core] example - Scissor test
#
#   Example originally created with raylib 2.5, last time updated with raylib 3.0
#
#   Example contributed by Chris Dill (@MysteriousSpace) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib#libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2019-2023 Chris Dill (@MysteriousSpace)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - scissor test")

scissor_area = Raylib::Rectangle .create(0, 0, 300, 300)
scissor_mode = true

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  scissor_mode = !scissor_mode if Raylib.is_key_pressed(Raylib::KEY_S)

  # Centre the scissor area around the mouse position
  scissor_area.x = Raylib.get_mouse_x - scissor_area.width / 2
  scissor_area.y = Raylib.get_mouse_y - scissor_area.height / 2
  # ----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing

    Raylib.clear_background(Raylib::RAYWHITE)

    if scissor_mode
      Raylib.begin_scissor_mode(
        scissor_area.x.to_i, scissor_area.y.to_i, scissor_area.width.to_i, scissor_area.height.to_i
      )
    end

    ## Draw full screen rectangle and some text
    ## NOTE: Only part defined by scissor area will be rendered
    Raylib.draw_rectangle(0, 0, Raylib.get_screen_width, Raylib.get_screen_height, Raylib::RED)
    Raylib.draw_text("Move the mouse around to reveal this text!", 190, 200, 20, Raylib::LIGHTGRAY)

    Raylib.end_scissor_mode if scissor_mode

    Raylib.draw_rectangle_lines_ex(scissor_area, 1, Raylib::BLACK)
    Raylib.draw_text("Press S to toggle scissor test", 10, 10, 20, Raylib::BLACK)

  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
#--------------------------------------------------------------------------------------
