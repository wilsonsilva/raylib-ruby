# ******************************************************************************************
#
#   raylib [core] examples - basic screen manager
#
#   NOTE: This example illustrates a very simple screen manager based on a states machines
#
#   Example originally created with raylib 4.0, last time updated with raylib 4.0
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

# ------------------------------------------------------------------------------------------
# Types and Structures Definition
# ------------------------------------------------------------------------------------------
module GameScreen
  LOGO = 0
  TITLE = 1
  GAMEPLAY = 2
  ENDING = 3
end

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - basic screen manager")

current_screen = GameScreen::LOGO

# TODO: Initialize all required variables and load all required data here!

frames_counter = 0 # Useful to count frames

Raylib.set_target_fps(60) # Set desired framerate (frames-per-second)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  case current_screen
  when GameScreen::LOGO
    # TODO: Update LOGO screen variables here!
    frames_counter += 1 # Count frames

    # Wait for 2 seconds (120 frames) before jumping to TITLE screen
    if frames_counter > 120
      current_screen = GameScreen::TITLE
    end
  when GameScreen::TITLE
    # TODO: Update TITLE screen variables here!

    # Press enter to change to GAMEPLAY screen
    if Raylib.is_key_pressed(Raylib::KEY_ENTER) || Raylib.is_gesture_detected(Raylib::GESTURE_TAP)
      current_screen = GameScreen::GAMEPLAY
    end
  when GameScreen::GAMEPLAY
    # TODO: Update GAMEPLAY screen variables here!

    # Press enter to change to ENDING screen
    if Raylib.is_key_pressed(Raylib::KEY_ENTER) || Raylib.is_gesture_detected(Raylib::GESTURE_TAP)
      current_screen = GameScreen::ENDING
    end
  when GameScreen::ENDING
    # TODO: Update ENDING screen variables here!

    # Press enter to return to TITLE screen
    if Raylib.is_key_pressed(Raylib::KEY_ENTER) || Raylib.is_gesture_detected(Raylib::GESTURE_TAP)
      current_screen = GameScreen::TITLE
    end
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  case current_screen
  when GameScreen::LOGO
    # TODO: Draw LOGO screen here!
    Raylib.draw_text("LOGO SCREEN", 20, 20, 40, Raylib::LIGHTGRAY)
    Raylib.draw_text("WAIT for 2 SECONDS...", 290, 220, 20, Raylib::GRAY)
  when GameScreen::TITLE
    # TODO: Draw TITLE screen here!
    Raylib.draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Raylib::GREEN)
    Raylib.draw_text("TITLE SCREEN", 20, 20, 40, Raylib::DARKGREEN)
    Raylib.draw_text("PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN", 120, 220, 20, Raylib::DARKGREEN)
  when GameScreen::GAMEPLAY
    # TODO: Draw GAMEPLAY screen here!
    Raylib.draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Raylib::PURPLE)
    Raylib.draw_text("GAMEPLAY SCREEN", 20, 20, 40, Raylib::MAROON)
    Raylib.draw_text("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, Raylib::MAROON)
  when GameScreen::ENDING
    # TODO: Draw ENDING screen here!
    Raylib.draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Raylib::BLUE)
    Raylib.draw_text("ENDING SCREEN", 20, 20, 40, Raylib::DARKBLUE)
    Raylib.draw_text("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 120, 220, 20, Raylib::DARKBLUE)
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------

# TODO: Unload all loaded data (textures, fonts, audio) here!

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
