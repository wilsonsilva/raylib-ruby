# ******************************************************************************************
#
#   raylib [textures] example - Load textures from raw data
#
#   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
#
#   Example originally created with raylib 1.3, last time updated with raylib 3.5
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - texture from raw data')

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)

# Load RAW image data (512x512, 32bit RGBA, no file header)
fudesumi_raw = Raylib.load_image_raw(File.join(__dir__, 'resources/fudesumi.raw'), 384, 512, Raylib::PIXELFORMAT_UNCOMPRESSED_R8G8B8A8, 0)
fudesumi = Raylib.load_texture_from_image(fudesumi_raw) # Upload CPU (RAM) image to GPU (VRAM)
Raylib.unload_image(fudesumi_raw)

# Generate a checked texture by code
width = 960
height = 480

# Dynamic memory allocation to store pixels data (Color type)
pixels_data = Array.new(width * height) do |i|
  x, y = i % width, i / width
  color = ((x/32 + y/32)/1) % 2 == 0 ? Raylib::ORANGE : Raylib::GOLD
  [color.r, color.g, color.b, color.a]
end.flatten

# Convert the array to a pointer
pixels = FFI::MemoryPointer.new(:uchar, width * height * 4)
pixels.put_array_of_uchar(0, pixels_data)

# Load pixels data into an image structure and create texture
checked_im = Raylib::Image.create(
  pixels, # We can assign pixels directly to data
  width,
  height,
  1,
  Raylib::PIXELFORMAT_UNCOMPRESSED_R8G8B8A8
)
checked = Raylib.load_texture_from_image(checked_im)
Raylib.unload_image(checked_im) # Unload CPU (RAM) image data (pixels)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_texture(checked, SCREEN_WIDTH/2 - checked.width/2, SCREEN_HEIGHT/2 - checked.height/2, Raylib.fade(Raylib::WHITE, 0.5))
  Raylib.draw_texture(fudesumi, 430, -30, Raylib::WHITE)

  Raylib.draw_text('CHECKED TEXTURE ', 84, 85, 30, Raylib::BROWN)
  Raylib.draw_text('GENERATED by CODE', 72, 148, 30, Raylib::BROWN)
  Raylib.draw_text('and RAW IMAGE LOADING', 46, 210, 30, Raylib::BROWN)

  Raylib.draw_text('(c) Fudesumi sprite by Eiden Marsal', 310, SCREEN_HEIGHT - 20, 10, Raylib::BROWN)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(fudesumi) # Texture unloading
Raylib.unload_texture(checked)  # Texture unloading
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
