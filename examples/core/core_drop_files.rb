# ******************************************************************************************
#
#   raylib [core] example - Windows drop files
#
#   NOTE: This example only works on platforms that support drag & drop (Windows, Linux, OSX, Html5?)
#
#   Example originally created with raylib 1.3, last time updated with raylib 4.2
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2015-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - drop files")

file_paths = []

Raylib.set_target_fps(60)
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  if Raylib.is_file_dropped
    dropped_files = Raylib.load_dropped_files
    file_paths = dropped_files.paths

    Raylib.unload_dropped_files(dropped_files)
  end
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  if file_paths.empty?
    Raylib.draw_text("Drop your files to this window!", 100, 40, 20, Raylib::DARKGRAY)
  else
    Raylib.draw_text("Dropped files:", 100, 40, 20, Raylib::DARKGRAY)

    file_paths.each_with_index do |path, index|
      if index % 2 == 0
        Raylib.draw_rectangle(0, 85 + 40 * index, SCREEN_WIDTH, 40, Raylib.fade(Raylib::LIGHTGRAY, 0.5))
      else
        Raylib.draw_rectangle(0, 85 + 40 * index, SCREEN_WIDTH, 40, Raylib.fade(Raylib::LIGHTGRAY, 0.3))
      end

      Raylib.draw_text(path, 120, 100 + 40 * index, 10, Raylib::GRAY)
    end

    Raylib.draw_text("Drop new files...", 100, 110 + 40 * file_paths.size, 20, Raylib::DARKGRAY)
  end

  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
file_paths.clear # Clear the array to free memory

Raylib.close_window
#--------------------------------------------------------------------------------------
