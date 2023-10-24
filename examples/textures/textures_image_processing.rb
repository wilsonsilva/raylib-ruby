# ******************************************************************************************
# 
#   raylib [textures] example - Image processing
# 
#   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
#
#   Example originally created with raylib 1.4, last time updated with raylib 3.5
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

NUM_PROCESSES = 9

image_process = {
  NONE: 0,
  COLOR_GRAYSCALE: 1,
  COLOR_TINT: 2,
  COLOR_INVERT: 3,
  COLOR_CONTRAST: 4,
  COLOR_BRIGHTNESS: 5,
  GAUSSIAN_BLUR: 6,
  FLIP_VERTICAL: 7,
  FLIP_HORIZONTAL: 8
}

process_text = [
  'NO PROCESSING', 'COLOR GRAYSCALE', 'COLOR TINT', 'COLOR INVERT',
  'COLOR CONTRAST', 'COLOR BRIGHTNESS', 'GAUSSIAN BLUR', 'FLIP VERTICAL',
  'FLIP HORIZONTAL'
]

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - image processing')

im_origin = Raylib.load_image(File.join(__dir__, 'resources/parrots.png'))
Raylib.image_format(im_origin, Raylib::PIXELFORMAT_UNCOMPRESSED_R8G8B8A8)
texture = Raylib.load_texture_from_image(im_origin)

im_copy = Raylib.image_copy(im_origin)

current_process = image_process[:NONE]
texture_reload = false

toggle_recs = NUM_PROCESSES.times.map { |i| Raylib::Rectangle.create(40.0, 50 + 32*i, 150.0, 30.0) }

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------
  mouse_hover_rec = toggle_recs.find_index do |rec|
    Raylib.check_collision_point_rec(Raylib.get_mouse_position, rec)
  end || -1

  if Raylib.is_mouse_button_released(Raylib::MOUSE_BUTTON_LEFT) && !mouse_hover_rec.negative?
    current_process = mouse_hover_rec
    texture_reload = true
  end

  if Raylib.is_key_pressed(Raylib::KEY_DOWN)
    current_process = (current_process + 1) % NUM_PROCESSES
    texture_reload = true
  elsif Raylib.is_key_pressed(Raylib::KEY_UP)
    current_process = (current_process - 1) % NUM_PROCESSES
    texture_reload = true
  end

  if texture_reload
    Raylib.unload_image(im_copy)
    im_copy = Raylib.image_copy(im_origin)

    case current_process
    when image_process[:COLOR_GRAYSCALE] then Raylib.image_color_grayscale(im_copy)
    when image_process[:COLOR_TINT] then Raylib.image_color_tint(im_copy, Raylib::GREEN)
    when image_process[:COLOR_INVERT] then Raylib.image_color_invert(im_copy)
    when image_process[:COLOR_CONTRAST] then Raylib.image_color_contrast(im_copy, -40)
    when image_process[:COLOR_BRIGHTNESS] then Raylib.image_color_brightness(im_copy, -80)
    when image_process[:GAUSSIAN_BLUR] then Raylib.image_blur_gaussian(im_copy, 10)
    when image_process[:FLIP_VERTICAL] then Raylib.image_flip_vertical(im_copy)
    when image_process[:FLIP_HORIZONTAL] then Raylib.image_flip_horizontal(im_copy)
    end

    pixels = Raylib.load_image_colors(im_copy)
    Raylib.update_texture(texture, pixels)
    Raylib.unload_image_colors(pixels)

    texture_reload = false
  end

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text('IMAGE PROCESSING:', 40, 30, 10, Raylib::DARKGRAY)

  toggle_recs.each_with_index do |rec, index|
    color = (index == current_process || index == mouse_hover_rec) ? Raylib::SKYBLUE : Raylib::LIGHTGRAY
    line_color = (index == current_process || index == mouse_hover_rec) ? Raylib::BLUE : Raylib::GRAY
    text_color = (index == current_process || index == mouse_hover_rec) ? Raylib::DARKBLUE : Raylib::DARKGRAY

    Raylib.draw_rectangle_rec(rec, color)
    Raylib.draw_rectangle_lines_ex(rec, 1, line_color)
    Raylib.draw_text(process_text[index], rec.x + rec.width/2 - Raylib.measure_text(process_text[index], 10)/2, rec.y + 11, 10, text_color)
  end

  Raylib.draw_texture(texture, SCREEN_WIDTH - texture.width - 60, SCREEN_HEIGHT/2 - texture.height/2, Raylib::WHITE)
  Raylib.draw_rectangle_lines(SCREEN_WIDTH - texture.width - 60, SCREEN_HEIGHT/2 - texture.height/2, texture.width, texture.height, Raylib::BLACK)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(texture) # Unload texture from VRAM
Raylib.unload_image(im_origin) # Unload image-origin from RAM
Raylib.unload_image(im_copy)   # Unload image-copy from RAM

Raylib.close_window            # Close window and OpenGL context
# --------------------------------------------------------------------------------------
