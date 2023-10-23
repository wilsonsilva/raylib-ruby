# ******************************************************************************************
#
#   raylib [text] example - Font SDF loading
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [text] example - SDF fonts")

GLSL_VERSION = 330 # OpenGL 3.3

# NOTE: Textures/Fonts MUST be loaded after Window initialization (OpenGL context is required)
msg = "Signed Distance Fields"

# Loading file to memory
bytes_read_ptr = FFI::MemoryPointer.new(:uint)
file_data = Raylib.load_file_data(File.join(__dir__, "resources/anonymous_pro_bold.ttf"), bytes_read_ptr)
file_size = bytes_read_ptr.read_uint

# Default font generation from TTF font
font_default = Raylib::Font.new
font_default.base_size = 16
font_default.glyph_count = 95
font_default.glyphs = Raylib.load_font_data(file_data, file_size, 16, nil, 95, Raylib::FONT_DEFAULT)

recs_ptr = FFI::MemoryPointer.new(Raylib::Rectangle.size, font_default.glyph_count)
atlas = Raylib.gen_image_font_atlas(font_default.glyphs, recs_ptr, 95, 16, 4, 0)
recs_array = Array.new(font_default.glyph_count) do |i|
  Raylib::Rectangle.new(recs_ptr[i * Raylib::Rectangle.size])
end
font_default.recs = recs_array
# font_default.recs = recs_ptr.read_array_of(Raylib::Rectangle, font_default.glyph_count)
# atlas = Raylib.gen_image_font_atlas(font_default.glyphs, font_default.recs, 95, 16, 4, 0)
font_default.texture = Raylib.load_texture_from_image(atlas)
Raylib.unload_image(atlas)

# SDF font generation from TTF font
font_sdf = Raylib::Font.create
font_sdf.base_size = 16
font_sdf.glyph_count = 95
font_sdf.glyphs = Raylib.load_font_data(file_data, file_size, 16, nil, 0, Raylib::FONT_SDF)
atlas = Raylib.gen_image_font_atlas(font_sdf.glyphs, font_sdf.recs, 95, 16, 0, 1)
font_sdf.texture = Raylib.load_texture_from_image(atlas)
Raylib.unload_image(atlas)

Raylib.unload_file_data(file_data) # Free memory from loaded file

# Load SDF required shader (we use default vertex shader)
shader = Raylib.load_shader(nil, Raylib.text_format("resources/shaders/glsl%i/sdf.fs", GLSL_VERSION))
Raylib.set_texture_filter(font_sdf.texture, Raylib::TEXTURE_FILTER_BILINEAR) # Required for SDF font

font_position = Raylib::Vector2.create(40, SCREEN_HEIGHT / 2.0 - 50)
text_size = Raylib::Vector2.create(0.0, 0.0)
font_size = 16.0
current_font = 0 # 0 - fontDefault, 1 - fontSDF

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  font_size += Raylib.get_mouse_wheel_move * 8.0
  font_size = 6 if font_size < 6

  current_font = Raylib.is_key_down(Raylib::KEY_SPACE) ? 1 : 0

  text_size = if current_font == 0
                Raylib.measure_text_ex(font_default, msg, font_size, 0)
              else
                Raylib.measure_text_ex(font_sdf, msg, font_size, 0)
              end

  font_position.x = Raylib.get_screen_width / 2 - text_size.x / 2
  font_position.y = Raylib.get_screen_height / 2 - text_size.y / 2 + 80
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  if current_font == 1
    Raylib.begin_shader_mode(shader) # Activate SDF font shader
    Raylib.draw_text_ex(font_sdf, msg, font_position, font_size, 0, Raylib::BLACK)
    Raylib.end_shader_mode # Activate our default shader for next drawings
    Raylib.draw_texture(font_sdf.texture, 10, 10, Raylib::BLACK)
  else
    Raylib.draw_text_ex(font_default, msg, font_position, font_size, 0, Raylib::BLACK)
    Raylib.draw_texture(font_default.texture, 10, 10, Raylib::BLACK)
  end

  current_font == 1 ? Raylib.draw_text("SDF!", 320, 20, 80, Raylib::RED) : Raylib.draw_text("default font", 315, 40, 30, Raylib::GRAY)

  Raylib.draw_text("FONT SIZE: 16.0", Raylib.get_screen_width - 240, 20, 20, Raylib::DARKGRAY)
  Raylib.draw_text(Raylib.text_format("RENDER SIZE: %02.02f", font_size), Raylib.get_screen_width - 240, 50, 20, Raylib::DARKGRAY)
  Raylib.draw_text("Use MOUSE WHEEL to SCALE TEXT!", Raylib.get_screen_width - 240, 90, 10, Raylib::DARKGRAY)
  Raylib.draw_text("HOLD SPACE to USE SDF FONT VERSION!", 340, Raylib.get_screen_height - 30, 20, Raylib::MAROON)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_font(font_default) # Default font unloading
Raylib.unload_font(font_sdf) # SDF font unloading
Raylib.unload_shader(shader) # Unload SDF shader
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
