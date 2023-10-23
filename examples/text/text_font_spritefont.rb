# ******************************************************************************************
#
#   raylib [text] example - Sprite font loading
#
#   NOTE: Sprite fonts should be generated following these conventions:
#
#     - Characters must be ordered starting with character 32 (Space)
#     - Every character must be contained within the same Rectangle height
#     - Every character and every line must be separated by the same distance (margin/padding)
#     - Rectangles must be defined by a MAGENTA color background
#
#   Following those constraints, a font can be provided just by an image,
#   this is quite handy to avoid additional font descriptor files (like BMFonts use).
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [text] example - sprite font loading")

msg1 = "THIS IS A custom SPRITE FONT..."
msg2 = "...and this is ANOTHER CUSTOM font..."
msg3 = "...and a THIRD one! GREAT! :D"

# NOTE: Textures/Fonts MUST be loaded after Window initialization (OpenGL context is required)
font1 = Raylib.load_font(File.join(__dir__, "resources/custom_mecha.png"))          # Font loading
font2 = Raylib.load_font(File.join(__dir__, "resources/custom_alagard.png"))        # Font loading
font3 = Raylib.load_font(File.join(__dir__, "resources/custom_jupiter_crash.png"))  # Font loading

font_position1 = Raylib::Vector2.create(
  SCREEN_WIDTH / 2.0 - Raylib.measure_text_ex(font1, msg1, font1.base_size, -3).x / 2,
  SCREEN_HEIGHT / 2.0 - font1.base_size / 2.0 - 80.0
)

font_position2 = Raylib::Vector2.create(
  SCREEN_WIDTH / 2.0 - Raylib.measure_text_ex(font2, msg2, font2.base_size, -2).x / 2.0,
  SCREEN_HEIGHT / 2.0 - font2.base_size / 2.0 - 10.0
)

font_position3 = Raylib::Vector2.create(
  SCREEN_WIDTH / 2.0 - Raylib.measure_text_ex(font3, msg3, font3.base_size, 2).x / 2.0,
  SCREEN_HEIGHT / 2.0 - font3.base_size / 2.0 + 50.0
)

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text_ex(font1, msg1, font_position1, font1.base_size, -3, Raylib::WHITE)
  Raylib.draw_text_ex(font2, msg2, font_position2, font2.base_size, -2, Raylib::WHITE)
  Raylib.draw_text_ex(font3, msg3, font_position3, font3.base_size, 2, Raylib::WHITE)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_font(font1) # Font unloading
Raylib.unload_font(font2) # Font unloading
Raylib.unload_font(font3) # Font unloading

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
