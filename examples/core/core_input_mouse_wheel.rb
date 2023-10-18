# ******************************************************************************************
#
#   raylib [core] examples - Mouse wheel input
#
#   Example originally created with raylib 1.1, last time updated with raylib 1.3
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
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - input mouse wheel")

box_position_y = SCREEN_HEIGHT/2 - 40
scroll_speed = 4 # Scrolling speed in pixels

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
    # Update
    #----------------------------------------------------------------------------------
    box_position_y -= Raylib.get_mouse_wheel_move * scroll_speed
    #----------------------------------------------------------------------------------

    # Draw
    #----------------------------------------------------------------------------------
    Raylib.begin_drawing

        Raylib.clear_background(Raylib::RAYWHITE)

        Raylib.draw_rectangle(SCREEN_WIDTH/2 - 40, box_position_y, 80, 80, Raylib::MAROON)

        Raylib.draw_text("Use mouse wheel to move the cube up and down!", 10, 10, 20, Raylib::GRAY)
        Raylib.draw_text("Box position Y: #{format('%03d', box_position_y)}", 10, 40, 20, Raylib::LIGHTGRAY)

    Raylib.end_drawing
    # ----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window        # Close window and OpenGL context
#--------------------------------------------------------------------------------------
