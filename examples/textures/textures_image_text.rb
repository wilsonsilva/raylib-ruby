# ******************************************************************************************
# 
#   raylib [texture] example - Image text drawing using TTF generated font
#
#   Example originally created with raylib 1.8, last time updated with raylib 4.0
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

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [texture] example - image text drawing')

parrots = Raylib.load_image(File.join(__dir__, 'resources/parrots.png')) # Load image in CPU memory (RAM)

# TTF Font loading with custom generation parameters
font = Raylib.load_font_ex(File.join(__dir__, 'resources/KAISG.ttf'), 64, nil, 0)

# Draw over image using custom font
Raylib.image_draw_text_ex(parrots, font, '[Parrots font drawing]', Raylib::Vector2.create(20.0, 20.0), font.base_size.to_f, 0.0, Raylib::RED)

texture = Raylib.load_texture_from_image(parrots)  # Image converted to texture, uploaded to GPU memory (VRAM)
Raylib.unload_image(parrots) # Once image has been converted to texture and uploaded to VRAM, it can be unloaded from RAM

position = Raylib::Vector2.create(
  ((SCREEN_WIDTH / 2) - (texture.width / 2)).to_f,
  ((SCREEN_HEIGHT / 2) - (texture.height / 2) - 20).to_f
)

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  show_font = Raylib.is_key_down(Raylib::KEY_SPACE)
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  if show_font
    Raylib.draw_texture(font.texture, (SCREEN_WIDTH / 2) - (font.texture.width / 2), 50, Raylib::BLACK)
  else
    # Draw texture with text already drawn inside
    Raylib.draw_texture_v(texture, position, Raylib::WHITE)

    # Draw text directly using sprite font
    Raylib.draw_text_ex(
      font,
      '[Parrots font drawing]',
      Raylib::Vector2.create(position.x + 20, position.y + 20 + 280),
      font.base_size.to_f,
      0.0,
      Raylib::WHITE
    )
  end

  Raylib.draw_text('PRESS SPACE to SHOW FONT ATLAS USED', 290, 420, 10, Raylib::DARKGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(texture) # Texture unloading
Raylib.unload_font(font)       # Unload custom font
Raylib.close_window            # Close window and OpenGL context
# --------------------------------------------------------------------------------------
