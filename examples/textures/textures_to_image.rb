# ******************************************************************************************
#
#   raylib [textures] example - Retrieve image data from texture: load_image_from_texture()
#
#   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - texture to image')

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)

image_path = File.join(__dir__, 'resources/raylib_logo.png')
image = Raylib.load_image(image_path)           # Load image data into CPU memory (RAM)
texture = Raylib.load_texture_from_image(image) # Image converted to texture, GPU memory (RAM -> VRAM)
Raylib.unload_image(image)                      # Unload image data from CPU memory (RAM)

image = Raylib.load_image_from_texture(texture) # Load image from GPU texture (VRAM -> RAM)
Raylib.unload_texture(texture)                  # Unload texture from GPU memory (VRAM)

texture = Raylib.load_texture_from_image(image) # Recreate texture from retrieved image data (RAM -> VRAM)
Raylib.unload_image(image)                      # Unload retrieved image data from CPU memory (RAM)
# ---------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_texture(texture, (SCREEN_WIDTH/2) - (texture.width/2), (SCREEN_HEIGHT/2) - (texture.height/2), Raylib::WHITE)
  Raylib.draw_text('this IS a texture loaded from an image!', 300, 370, 10, Raylib::GRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(texture) # Texture unloading

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
