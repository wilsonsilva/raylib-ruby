# ******************************************************************************************
#
#   raylib [audio] example - Module playing (streaming)
#
#   Example originally created with raylib 1.5, last time updated with raylib 3.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2016-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

CircleWave = Struct.new(:position, :radius, :alpha, :speed, :color)

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.set_config_flags(Raylib::FLAG_MSAA_4X_HINT) # NOTE: Try to enable MSAA 4X

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [audio] example - module playing (streaming)")

Raylib.init_audio_device # Initialize audio device

MAX_CIRCLES = 64

colors = [
  Raylib::ORANGE, Raylib::RED, Raylib::GOLD, Raylib::LIME, Raylib::BLUE, Raylib::VIOLET, Raylib::BROWN,
  Raylib::LIGHTGRAY, Raylib::PINK, Raylib::YELLOW, Raylib::GREEN, Raylib::SKYBLUE, Raylib::PURPLE, Raylib::BEIGE
]

# Creates some circles for visual effect
circles = Array.new(MAX_CIRCLES) do
  CircleWave.new(
    Raylib::Vector2.create(
      Raylib.get_random_value(10, SCREEN_WIDTH - 40),
      Raylib.get_random_value(10, SCREEN_HEIGHT - 40)
    ),
    Raylib.get_random_value(10, 40).to_f,
    0.0,
    Raylib.get_random_value(1, 100) / 2000.0,
    colors.sample
  )
end

music = Raylib.load_music_stream(File.join(__dir__, "resources/mini1111.xm"))
music.looping = false
pitch = 1.0

Raylib.play_music_stream(music)

pause = false

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
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
    pause ? Raylib.pause_music_stream(music) : Raylib.resume_music_stream(music)
  end

  pitch += 0.01 if Raylib.is_key_down(Raylib::KEY_UP)
  pitch -= 0.01 if Raylib.is_key_down(Raylib::KEY_DOWN)

  Raylib.set_music_pitch(music, pitch)

  # Get timePlayed scaled to bar dimensions
  time_played = Raylib.get_music_time_played(music) / Raylib.get_music_time_length(music) * (SCREEN_WIDTH - 40)

  # Color circles animation
  circles.each do |circle|
    next if pause

    circle.alpha += circle.speed
    circle.radius += circle.speed * 10.0

    if circle.alpha > 1.0
      circle.speed *= -1
    elsif circle.alpha <= 0.0
      circle.alpha = 0.0
      circle.radius = Raylib.get_random_value(10, 40).to_f
      circle.position = Raylib::Vector2.create(
        Raylib.get_random_value(circle.radius, SCREEN_WIDTH - circle.radius),
        Raylib.get_random_value(circle.radius, SCREEN_HEIGHT - circle.radius)
      )
      circle.color = colors.sample
      circle.speed = Raylib.get_random_value(1, 100) / 2000.0
    end
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  circles.each do |circle|
    Raylib.draw_circle_v(circle.position, circle.radius, Raylib.fade(circle.color, circle.alpha))
  end

  # Draw time bar
  Raylib.draw_rectangle(20, SCREEN_HEIGHT - 32, SCREEN_WIDTH - 40, 12, Raylib::LIGHTGRAY)
  Raylib.draw_rectangle(20, SCREEN_HEIGHT - 32, time_played.to_i, 12, Raylib::MAROON)
  Raylib.draw_rectangle_lines(20, SCREEN_HEIGHT - 32, SCREEN_WIDTH - 40, 12, Raylib::GRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_music_stream(music) # Unload music stream buffers from RAM
Raylib.close_audio_device         # Close audio device (music streaming is automatically stopped)
Raylib.close_window               # Close window and OpenGL context
# --------------------------------------------------------------------------------------
