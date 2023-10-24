# ******************************************************************************************
#
#   raylib [textures] example - Procedural images generation
#
#   Example originally created with raylib 1.8, last time updated with raylib 1.8
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2017-2023 Wilhem Barbier (@nounoursheureux) and Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - procedural images generation')

NUM_TEXTURES = 6 # Currently we have 7 generation algorithms

vertical_gradient   = Raylib.gen_image_gradient_v(SCREEN_WIDTH, SCREEN_HEIGHT, Raylib::RED, Raylib::BLUE)
horizontal_gradient = Raylib.gen_image_gradient_h(SCREEN_WIDTH, SCREEN_HEIGHT, Raylib::RED, Raylib::BLUE)
radial_gradient     = Raylib.gen_image_gradient_radial(SCREEN_WIDTH, SCREEN_HEIGHT, 0.0, Raylib::WHITE, Raylib::BLACK)
checked             = Raylib.gen_image_checked(SCREEN_WIDTH, SCREEN_HEIGHT, 32, 32, Raylib::RED, Raylib::BLUE)
white_noise         = Raylib.gen_image_white_noise(SCREEN_WIDTH, SCREEN_HEIGHT, 0.5)
cellular            = Raylib.gen_image_cellular(SCREEN_WIDTH, SCREEN_HEIGHT, 32)

textures = [
  Raylib.load_texture_from_image(vertical_gradient),
  Raylib.load_texture_from_image(horizontal_gradient),
  Raylib.load_texture_from_image(radial_gradient),
  Raylib.load_texture_from_image(checked),
  Raylib.load_texture_from_image(white_noise),
  Raylib.load_texture_from_image(cellular)
]

# Unload image data (CPU RAM)
[vertical_gradient, horizontal_gradient, radial_gradient, checked, white_noise, cellular].each do |image|
  Raylib.unload_image(image)
end

current_texture = 0

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------
  if Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_LEFT) || Raylib.is_key_pressed(Raylib::KEY_RIGHT)
    current_texture = (current_texture + 1) % NUM_TEXTURES # Cycle between the textures
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_texture(textures[current_texture], 0, 0, Raylib::WHITE)
  Raylib.draw_rectangle(30, 400, 325, 30, Raylib.fade(Raylib::SKYBLUE, 0.5))
  Raylib.draw_rectangle_lines(30, 400, 325, 30, Raylib.fade(Raylib::WHITE, 0.5))
  Raylib.draw_text('MOUSE LEFT BUTTON to CYCLE PROCEDURAL TEXTURES', 40, 410, 10, Raylib::WHITE)

  case current_texture
  when 0; Raylib.draw_text('VERTICAL GRADIENT', 560, 10, 20, Raylib::RAYWHITE)
  when 1; Raylib.draw_text('HORIZONTAL GRADIENT', 540, 10, 20, Raylib::RAYWHITE)
  when 2; Raylib.draw_text('RADIAL GRADIENT', 580, 10, 20, Raylib::LIGHTGRAY)
  when 3; Raylib.draw_text('CHECKED', 680, 10, 20, Raylib::RAYWHITE)
  when 4; Raylib.draw_text('WHITE NOISE', 640, 10, 20, Raylib::RED)
  when 5; Raylib.draw_text('CELLULAR', 670, 10, 20, Raylib::RAYWHITE)
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------

# Unload textures data (GPU VRAM)
textures.each { |texture| Raylib.unload_texture(texture) }

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
