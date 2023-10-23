# ******************************************************************************************
#
#   raylib [text] example - raylib fonts loading
#
#   NOTE: raylib is distributed with some free to use fonts (even for commercial purposes!)
#         To view details and credits for those fonts, check raylib license file
#
#   Example originally created with raylib 1.7, last time updated with raylib 3.7
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2017-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

MAX_FONTS = 8

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [text] example - raylib fonts")

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
fonts = Array.new(MAX_FONTS)
fonts[0] = Raylib.load_font(File.join(__dir__, "resources/fonts/alagard.png"))
fonts[1] = Raylib.load_font(File.join(__dir__, "resources/fonts/pixelplay.png"))
fonts[2] = Raylib.load_font(File.join(__dir__, "resources/fonts/mecha.png"))
fonts[3] = Raylib.load_font(File.join(__dir__, "resources/fonts/setback.png"))
fonts[4] = Raylib.load_font(File.join(__dir__, "resources/fonts/romulus.png"))
fonts[5] = Raylib.load_font(File.join(__dir__, "resources/fonts/pixantiqua.png"))
fonts[6] = Raylib.load_font(File.join(__dir__, "resources/fonts/alpha_beta.png"))
fonts[7] = Raylib.load_font(File.join(__dir__, "resources/fonts/jupiter_crash.png"))

messages = [
  "ALAGARD FONT designed by Hewett Tsoi",
  "PIXELPLAY FONT designed by Aleksander Shevchuk",
  "MECHA FONT designed by Captain Falcon",
  "SETBACK FONT designed by Brian Kent (AEnigma)",
  "ROMULUS FONT designed by Hewett Tsoi",
  "PIXANTIQUA FONT designed by Gerhard Grossmann",
  "ALPHA_BETA FONT designed by Brian Kent (AEnigma)",
  "JUPITER_CRASH FONT designed by Brian Kent (AEnigma)"
]

spacings = [2, 4, 8, 4, 3, 4, 4, 1]
positions = Array.new(MAX_FONTS) { Raylib::Vector2.create(0.0, 0.0) }

MAX_FONTS.times do |i|
  positions[i].x = SCREEN_WIDTH / 2.0 - Raylib.measure_text_ex(fonts[i], messages[i], fonts[i].base_size * 2.0, spacings[i].to_f).x / 2.0
  positions[i].y = 60.0 + fonts[i].base_size + 45.0 * i
end

# Small Y position corrections
positions[3].y += 8
positions[4].y += 2
positions[7].y -= 8

colors = [
  Raylib::MAROON,
  Raylib::ORANGE,
  Raylib::DARKGREEN,
  Raylib::DARKBLUE,
  Raylib::DARKPURPLE,
  Raylib::LIME,
  Raylib::GOLD,
  Raylib::RED
]

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text("free fonts included with raylib", 250, 20, 20, Raylib::DARKGRAY)
  Raylib.draw_line(220, 50, 590, 50, Raylib::DARKGRAY)

  MAX_FONTS.times do |i|
    Raylib.draw_text_ex(fonts[i], messages[i], positions[i], fonts[i].base_size * 2.0, spacings[i].to_f, colors[i])
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
fonts.each { |font| Raylib.unload_font(font) } # Fonts unloading

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
