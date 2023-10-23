# ******************************************************************************************
#
#   raylib [audio] example - Sound loading and playing
#
#   Example originally created with raylib 1.1, last time updated with raylib 3.5
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [audio] example - sound loading and playing")

Raylib.init_audio_device

fx_wav = Raylib.load_sound(File.join(__dir__, "resources/sound.wav"))  # Load WAV audio file # FIXME: Should work without File.join
fx_ogg = Raylib.load_sound(File.join(__dir__, "resources/target.ogg")) # Load OGG audio file # FIXME: Should work without File.join

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  Raylib.play_sound(fx_wav) if Raylib.is_key_pressed(Raylib::KEY_SPACE)    # Play WAV sound
  Raylib.play_sound(fx_ogg) if Raylib.is_key_pressed(Raylib::KEY_ENTER)    # Play OGG sound
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_text("Press SPACE to PLAY the WAV sound!", 200, 180, 20, Raylib::LIGHTGRAY)
  Raylib.draw_text("Press ENTER to PLAY the OGG sound!", 200, 220, 20, Raylib::LIGHTGRAY)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_sound(fx_wav)      # Unload sound data
Raylib.unload_sound(fx_ogg)      # Unload sound data

Raylib.close_audio_device        # Close audio device

Raylib.close_window              # Close window and OpenGL context
# --------------------------------------------------------------------------------------
