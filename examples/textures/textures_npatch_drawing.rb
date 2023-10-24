# ******************************************************************************************
#
#   raylib [textures] example - N-patch drawing
#
#   NOTE: Images are loaded in CPU memory (RAM); textures are loaded in GPU memory (VRAM)
#
#   Example originally created with raylib 2.0, last time updated with raylib 2.5
#
#   Example contributed by Jorge A. Gomes (@overdev) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2018-2023 Jorge A. Gomes (@overdev) and Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - N-patch drawing')

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
n_patch_texture = Raylib.load_texture(File.join(__dir__, 'resources/ninepatch_button.png'))

origin = Raylib::Vector2.create(0.0, 0.0)

# Position and size of the n-patches
dst_rec1 = Raylib::Rectangle.create(480.0, 160.0, 32.0, 32.0)
dst_rec2 = Raylib::Rectangle.create(160.0, 160.0, 32.0, 32.0)
dst_rec_h = Raylib::Rectangle.create(160.0, 93.0, 32.0, 32.0)
dst_rec_v = Raylib::Rectangle.create(92.0, 160.0, 32.0, 32.0)

# A 9-patch (NPATCH_NINE_PATCH) changes its sizes in both axes
nine_patch_info1 = Raylib::NPatchInfo.create(
  Raylib::Rectangle.create(0.0, 0.0, 64.0, 64.0),
  12, 40, 12, 12,
  Raylib::NPATCH_NINE_PATCH
)

nine_patch_info2 = Raylib::NPatchInfo.create(
  Raylib::Rectangle.create(0.0, 128.0, 64.0, 64.0),
  16, 16, 16, 16,
  Raylib::NPATCH_NINE_PATCH
)

# A horizontal 3-patch (NPATCH_THREE_PATCH_HORIZONTAL) changes its sizes along the x axis only
h3_patch_info = Raylib::NPatchInfo.create(
  Raylib::Rectangle.create(0.0, 64.0, 64.0, 64.0),
  8, 8, 8, 8,
  Raylib::NPATCH_THREE_PATCH_HORIZONTAL
)

# A vertical 3-patch (NPATCH_THREE_PATCH_VERTICAL) changes its sizes along the y axis only
v3_patch_info = Raylib::NPatchInfo.create(
  Raylib::Rectangle.create(0.0, 192.0, 64.0, 64.0),
  6, 6, 6, 6,
  Raylib::NPATCH_THREE_PATCH_VERTICAL
)

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  mouse_position = Raylib.get_mouse_position

  # Resize the n-patches based on mouse position
  dst_rec1.width = mouse_position.x - dst_rec1.x
  dst_rec1.height = mouse_position.y - dst_rec1.y
  dst_rec2.width = mouse_position.x - dst_rec2.x
  dst_rec2.height = mouse_position.y - dst_rec2.y
  dst_rec_h.width = mouse_position.x - dst_rec_h.x
  dst_rec_v.height = mouse_position.y - dst_rec_v.y

  # Set a minimum width and/or height
  dst_rec1.width = [1.0, [dst_rec1.width, 300.0].min].max
  dst_rec1.height = [1.0, dst_rec1.height].max
  dst_rec2.width = [1.0, [dst_rec2.width, 300.0].min].max
  dst_rec2.height = [1.0, dst_rec2.height].max
  dst_rec_h.width = [1.0, dst_rec_h.width].max
  dst_rec_v.height = [1.0, dst_rec_v.height].max
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  # Draw the n-patches
  Raylib.draw_texture_n_patch(n_patch_texture, nine_patch_info2, dst_rec2, origin, 0.0, Raylib::WHITE)
  Raylib.draw_texture_n_patch(n_patch_texture, nine_patch_info1, dst_rec1, origin, 0.0, Raylib::WHITE)
  Raylib.draw_texture_n_patch(n_patch_texture, h3_patch_info, dst_rec_h, origin, 0.0, Raylib::WHITE)
  Raylib.draw_texture_n_patch(n_patch_texture, v3_patch_info, dst_rec_v, origin, 0.0, Raylib::WHITE)

  # Draw the source texture
  Raylib.draw_rectangle_lines(5, 88, 74, 266, Raylib::BLUE)
  Raylib.draw_texture(n_patch_texture, 10, 93, Raylib::WHITE)
  Raylib.draw_text('TEXTURE', 15, 360, 10, Raylib::DARKGRAY)

  Raylib.draw_text('Move the mouse to stretch or shrink the n-patches', 10, 20, 20, Raylib::DARKGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(n_patch_texture) # Texture unloading

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
