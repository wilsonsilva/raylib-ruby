# ******************************************************************************************
#
#   raylib [textures] example - Image loading and drawing on it
#
#   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
#
#   Example originally created with raylib 1.4, last time updated with raylib 1.4
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - image drawing')

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)

cat = Raylib.load_image(File.join(__dir__, 'resources/cat.png')) # Load image in CPU memory (RAM)
Raylib.image_crop(cat, Raylib::Rectangle.create(100, 10, 280, 380)) # Crop an image piece
Raylib.image_flip_horizontal(cat) # Flip cropped image horizontally
Raylib.image_resize(cat, 150, 200) # Resize flipped-cropped image

parrots = Raylib.load_image(File.join(__dir__, 'resources/parrots.png')) # Load image in CPU memory (RAM)

# Draw one image over the other with a scaling of 1.5
Raylib.image_draw(parrots, cat, Raylib::Rectangle.create(0, 0, cat.width, cat.height), Raylib::Rectangle.create(30, 40, cat.width*1.5, cat.height*1.5), Raylib::WHITE)
Raylib.image_crop(parrots, Raylib::Rectangle.create(0, 50, parrots.width, parrots.height - 100)) # Crop resulting image

# Draw on the image with a few image draw methods
Raylib.image_draw_pixel(parrots, 10, 10, Raylib::RAYWHITE)
Raylib.image_draw_circle_lines(parrots, 10, 10, 5, Raylib::RAYWHITE)
Raylib.image_draw_rectangle(parrots, 5, 20, 10, 10, Raylib::RAYWHITE)

Raylib.unload_image(cat) # Unload image from RAM

# Load custom font for drawing on image
font = Raylib.load_font(File.join(__dir__, 'resources/custom_jupiter_crash.png'))

# Draw over image using custom font
Raylib.image_draw_text_ex(parrots, font, 'PARROTS & CAT', Raylib::Vector2.create(300, 230), font.base_size, -2, Raylib::WHITE)

Raylib.unload_font(font) # Unload custom font (already drawn used on image)

texture = Raylib.load_texture_from_image(parrots) # Image converted to texture, uploaded to GPU memory (VRAM)
Raylib.unload_image(parrots) # Once image has been converted to texture and uploaded to VRAM, it can be unloaded from RAM

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_texture(texture, SCREEN_WIDTH/2 - texture.width/2, SCREEN_HEIGHT/2 - texture.height/2 - 40, Raylib::WHITE)
  Raylib.draw_rectangle_lines(SCREEN_WIDTH/2 - texture.width/2, SCREEN_HEIGHT/2 - texture.height/2 - 40, texture.width, texture.height, Raylib::DARKGRAY)

  Raylib.draw_text('We are drawing only one texture from various images composed!', 240, 350, 10, Raylib::DARKGRAY)
  Raylib.draw_text('Source images have been cropped, scaled, flipped and copied one over the other.', 190, 370, 10, Raylib::DARKGRAY)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(texture) # Texture unloading

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
