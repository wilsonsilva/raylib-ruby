# ******************************************************************************************
#
#   raylib [text] example - Font filters
#
#   NOTE: After font loading, font texture atlas filter could be configured for a softer
#   display of the font when scaling it to different sizes, that way, it's not required
#   to generate multiple fonts at multiple sizes (as long as the scaling is not very different)
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [text] example - font filters')

msg = 'Loaded Font'

# NOTE: Textures/Fonts MUST be loaded after Window initialization (OpenGL context is required)

# TTF Font loading with custom generation parameters
font = Raylib.load_font_ex(File.join(__dir__, 'resources/KAISG.ttf'), 96, nil, 0)

# Generate mipmap levels to use trilinear filtering
# NOTE: On 2D drawing it won't be noticeable, it looks like FILTER_BILINEAR
Raylib.gen_texture_mipmaps(font.texture)

font_size = font.base_size.to_f
font_position = Raylib::Vector2.create(40.0, SCREEN_HEIGHT / 2.0 - 80.0)

# Setup texture scaling filter
Raylib.set_texture_filter(font.texture, Raylib::TEXTURE_FILTER_POINT)
current_font_filter = 0 # TEXTURE_FILTER_POINT

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  font_size += Raylib.get_mouse_wheel_move * 4.0

  # Choose font texture filter method
  if Raylib.is_key_pressed(Raylib::KEY_ONE)
    Raylib.set_texture_filter(font.texture, Raylib::TEXTURE_FILTER_POINT)
    current_font_filter = 0
  elsif Raylib.is_key_pressed(Raylib::KEY_TWO)
    Raylib.set_texture_filter(font.texture, Raylib::TEXTURE_FILTER_BILINEAR)
    current_font_filter = 1
  elsif Raylib.is_key_pressed(Raylib::KEY_THREE)
    # NOTE: Trilinear filter won't be noticed on 2D drawing
    Raylib.set_texture_filter(font.texture, Raylib::TEXTURE_FILTER_TRILINEAR)
    current_font_filter = 2
  end

  text_size = Raylib.measure_text_ex(font, msg, font_size, 0)

  font_position.x -= 10 if Raylib.is_key_down(Raylib::KEY_LEFT)
  font_position.x += 10 if Raylib.is_key_down(Raylib::KEY_RIGHT)

  # Load a dropped TTF file dynamically (at current font_size)
  if Raylib.is_file_dropped
    dropped_files = Raylib.load_dropped_files

    # NOTE: We only support first ttf file dropped
    if Raylib.is_file_extension(dropped_files.paths[0], '.ttf')
      Raylib.unload_font(font)
      font = Raylib.load_font_ex(dropped_files.paths[0], font_size.to_i, 0, 0)
    end

    Raylib.unload_dropped_files(dropped_files) # Unload filepaths from memory
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text('Use mouse wheel to change font size', 20, 20, 10, Raylib::GRAY)
  Raylib.draw_text('Use KEY_RIGHT and KEY_LEFT to move text', 20, 40, 10, Raylib::GRAY)
  Raylib.draw_text('Use 1, 2, 3 to change texture filter', 20, 60, 10, Raylib::GRAY)
  Raylib.draw_text('Drop a new TTF font for dynamic loading', 20, 80, 10, Raylib::DARKGRAY)

  Raylib.draw_text_ex(font, msg, font_position, font_size, 0, Raylib::BLACK)

  Raylib.draw_rectangle(0, SCREEN_HEIGHT - 80, SCREEN_WIDTH, 80, Raylib::LIGHTGRAY)
  Raylib.draw_text('Font size: %02.02f' % font_size, 20, SCREEN_HEIGHT - 50, 10, Raylib::DARKGRAY)
  Raylib.draw_text('Text size: [%02.02f, %02.02f]' % [text_size.x, text_size.y], 20, SCREEN_HEIGHT - 30, 10, Raylib::DARKGRAY)
  Raylib.draw_text('CURRENT TEXTURE FILTER:', 250, 400, 20, Raylib::GRAY)

  case current_font_filter
  when 0
    Raylib.draw_text('POINT', 570, 400, 20, Raylib::BLACK)
  when 1
    Raylib.draw_text('BILINEAR', 570, 400, 20, Raylib::BLACK)
  when 2
    Raylib.draw_text('TRILINEAR', 570, 400, 20, Raylib::BLACK)
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_font(font) # Font unloading
Raylib.close_window      # Close window and OpenGL context
# --------------------------------------------------------------------------------------
