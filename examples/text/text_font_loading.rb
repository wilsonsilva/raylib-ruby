# ******************************************************************************************
#
#   raylib [text] example - Font loading
#
#   NOTE: raylib can load fonts from multiple input file formats:
#
#     - TTF/OTF > Sprite font atlas is generated on loading, user can configure
#                 some of the generation parameters (size, characters to include)
#     - BMFonts > Angel code font fileformat, sprite font image must be provided
#                 together with the .fnt file, font generation cannot be configured
#     - XNA Spritefont > Sprite font image, following XNA Spritefont conventions,
#                 Characters in image must follow some spacing and order rules
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

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [text] example - font loading")

# Define characters to draw
# NOTE: raylib supports UTF-8 encoding, following list is actually codified as UTF8 internally
msg = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHI\nJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmn\no" \
      "pqrstuvwxyz{|}~¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓ\nÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷\nøùúûüýþÿ"

# NOTE: Textures/Fonts MUST be loaded after Window initialization (OpenGL context is required)

# BMFont (AngelCode) : Font data and image atlas have been generated using external program
font_bm = Raylib.load_font(File.join(__dir__, "resources/pixantiqua.fnt"))

# TTF font : Font data and atlas are generated directly from TTF
# NOTE: We define a font base size of 32 pixels tall and up-to 250 characters
font_ttf = Raylib.load_font_ex(File.join(__dir__, "resources/pixantiqua.ttf"), 32, nil, 250)

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  use_ttf = Raylib.is_key_down(Raylib::KEY_SPACE)
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_text("Hold SPACE to use TTF generated font", 20, 20, 20, Raylib::LIGHTGRAY)

  if use_ttf
    Raylib.draw_text_ex(font_ttf, msg, Raylib::Vector2.create(20.0, 100.0), font_ttf.base_size.to_f, 2, Raylib::LIME)
    Raylib.draw_text("Using TTF font generated", 20, Raylib.get_screen_height - 30, 20, Raylib::GRAY)
  else
    Raylib.draw_text_ex(font_bm, msg, Raylib::Vector2.create(20.0, 100.0), font_bm.base_size.to_f, 2, Raylib::MAROON)
    Raylib.draw_text("Using BMFont (Angelcode) imported", 20, Raylib.get_screen_height - 30, 20, Raylib::GRAY)
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_font(font_bm) # AngelCode Font unloading
Raylib.unload_font(font_ttf) # TTF Font unloading

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
