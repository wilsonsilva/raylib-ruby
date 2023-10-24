# ******************************************************************************************
#
#   raylib [textures] example - Texture source and destination rectangles
#
#   Example originally created with raylib 1.3, last time updated with raylib 1.3
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

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] examples - texture source and destination rectangles')

# NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
scarfy = Raylib.load_texture(File.join(__dir__, 'resources/scarfy.png')) # Texture loading

frame_width = scarfy.width / 6
frame_height = scarfy.height

# Source rectangle (part of the texture to use for drawing)
source_rec = Raylib::Rectangle.create(0.0, 0.0, frame_width.to_f, frame_height.to_f)

# Destination rectangle (screen rectangle where drawing part of texture)
dest_rec = Raylib::Rectangle.create(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0, frame_width * 2.0, frame_height * 2.0)

# Origin of the texture (rotation/scale point), it's relative to destination rectangle size
origin = Raylib::Vector2.create(frame_width.to_f, frame_height.to_f)

rotation = 0

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  rotation += 1
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  # NOTE: Using draw_texture_pro() we can easily rotate and scale the part of the texture we draw
  # source_rec defines the part of the texture we use for drawing
  # dest_rec defines the rectangle where our texture part will fit (scaling it to fit)
  # origin defines the point of the texture used as reference for rotation and scaling
  # rotation defines the texture rotation (using origin as rotation point)
  Raylib.draw_texture_pro(scarfy, source_rec, dest_rec, origin, rotation.to_f, Raylib::WHITE)
  Raylib.draw_line(dest_rec.x.to_i, 0, dest_rec.x.to_i, SCREEN_HEIGHT, Raylib::GRAY)
  Raylib.draw_line(0, dest_rec.y.to_i, SCREEN_WIDTH, dest_rec.y.to_i, Raylib::GRAY)
  Raylib.draw_text('(c) Scarfy sprite by Eiden Marsal', SCREEN_WIDTH - 200, SCREEN_HEIGHT - 20, 10, Raylib::GRAY)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(scarfy) # Texture unloading
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
