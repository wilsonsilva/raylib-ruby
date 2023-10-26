# ******************************************************************************************
#
#   raylib [audio] example - Mixed audio processing
#
#   Example originally created with raylib 4.2, last time updated with raylib 4.2
#
#   Example contributed by hkc (@hatkidchan) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works partially with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2023 hkc (@hatkidchan)
#
# ******************************************************************************************

# FIXME: Attaching the audio mixed processor callback causes the program to slow down until the
# music is no longer playing. Does not work even if I remove all the code from the callback.

require 'bundler/setup'
require 'raylib'

# FIXME: Global variables can potentially be avoided

$exponent = 1.0                     # Audio exponentiation value
$average_volume = Array.new(400, 0) # Average volume history

# ------------------------------------------------------------------------------------
# Audio processing function
# ------------------------------------------------------------------------------------

ProcessAudio = FFI::Function.new(:void, [:pointer, :uint]) do |buffer, frames|
  # samples = buffer.to_a
  # average = 0.0 # Temporary average volume
  #
  # frames.times do |frame|
  #   left = samples[frame * 2]
  #   right = samples[frame * 2 + 1]
  #
  #   left = (left.abs ** $exponent) * (left < 0.0 ? -1.0 : 1.0)
  #   right = (right.abs ** $exponent) * (right < 0.0 ? -1.0 : 1.0)
  #
  #   average += (left.abs / frames) + (right.abs / frames)
  # end
  #
  # # Moving history to the left
  # $average_volume.shift(399)
  # $average_volume << average # Adding last average value
end

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [audio] example - processing mixed output")

Raylib.init_audio_device # Initialize audio device
# Raylib.attach_audio_mixed_processor(ProcessAudio) # FIXME: Uncomment when callbacks are supported

music = Raylib.load_music_stream(File.join(__dir__, "resources/country.mp3")) # FIXME: Should work without File.join
sound = Raylib.load_sound(File.join(__dir__, "resources/coin.wav")) # FIXME: Should work without File.join

Raylib.play_music_stream(music)

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  Raylib.update_music_stream(music) # Update music buffer with new stream data

  # Modify processing variables
  # ----------------------------------------------------------------------------------
  $exponent -= 0.05 if Raylib.is_key_pressed(Raylib::KEY_LEFT)
  $exponent += 0.05 if Raylib.is_key_pressed(Raylib::KEY_RIGHT)

  $exponent = 0.5 if $exponent <= 0.5
  $exponent = 3.0 if $exponent >= 3.0

  Raylib.play_sound(sound) if Raylib.is_key_pressed(Raylib::KEY_SPACE)

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text("MUSIC SHOULD BE PLAYING!", 255, 150, 20, Raylib::LIGHTGRAY)
  Raylib.draw_text("EXPONENT = %.2f" % $exponent, 215, 180, 20, Raylib::LIGHTGRAY)

  Raylib.draw_rectangle(199, 199, 402, 34, Raylib::LIGHTGRAY)
  400.times do |i|
    Raylib.draw_line(201 + i, 232 - $average_volume[i] * 32, 201 + i, 232, Raylib::MAROON)
  end

  Raylib.draw_rectangle_lines(199, 199, 402, 34, Raylib::GRAY)

  Raylib.draw_text("PRESS SPACE TO PLAY OTHER SOUND", 200, 250, 20, Raylib::LIGHTGRAY)
  Raylib.draw_text("USE LEFT AND RIGHT ARROWS TO ALTER DISTORTION", 140, 280, 20, Raylib::LIGHTGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_music_stream(music)                 # Unload music stream buffers from RAM
# Raylib.detach_audio_mixed_processor(ProcessAudio) # Disconnect audio processor # FIXME: Uncomment when callbacks are supported
Raylib.close_audio_device                         # Close audio device (music streaming is automatically stopped)
Raylib.close_window                               # Close window and OpenGL context
# --------------------------------------------------------------------------------------
