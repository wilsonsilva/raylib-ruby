# ******************************************************************************************
#
#   raylib [audio] example - Music playing (streaming)
#
#   Example originally created with raylib 1.3, last time updated with raylib 4.0
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
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [audio] example - music playing (streaming)")

Raylib.init_audio_device # Initialize audio device

music = Raylib.load_music_stream(File.join(__dir__, "resources/country.mp3"))
Raylib.play_music_stream(music)

pause = false # Music playing paused

Raylib.set_target_fps(30) # Set our game to run at 30 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  Raylib.update_music_stream(music) # Update music buffer with new stream data

  # Restart music playing (stop and play)
  if Raylib.is_key_pressed(Raylib::KEY_SPACE)
    Raylib.stop_music_stream(music)
    Raylib.play_music_stream(music)
  end

  # Pause/Resume music playing
  if Raylib.is_key_pressed(Raylib::KEY_P)
    pause = !pause

    if pause
      Raylib.pause_music_stream(music)
    else
      Raylib.resume_music_stream(music)
    end
  end

  # Get normalized time played for current music stream [0.0..1.0]
  time_played = Raylib.get_music_time_played(music) / Raylib.get_music_time_length(music)

  time_played = 1.0 if time_played > 1.0 # Make sure time played is no longer than music
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text("MUSIC SHOULD BE PLAYING!", 255, 150, 20, Raylib::LIGHTGRAY)

  Raylib.draw_rectangle(200, 200, 400, 12, Raylib::LIGHTGRAY)
  Raylib.draw_rectangle(200, 200, (time_played * 400).to_i, 12, Raylib::MAROON)
  Raylib.draw_rectangle_lines(200, 200, 400, 12, Raylib::GRAY)

  Raylib.draw_text("PRESS SPACE TO RESTART MUSIC", 215, 250, 20, Raylib::LIGHTGRAY)
  Raylib.draw_text("PRESS P TO PAUSE/RESUME MUSIC", 208, 280, 20, Raylib::LIGHTGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_music_stream(music) # Unload music stream buffers from RAM
Raylib.close_audio_device # Close audio device (music streaming is automatically stopped)
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
