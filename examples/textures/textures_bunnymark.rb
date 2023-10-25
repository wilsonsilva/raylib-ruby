# ******************************************************************************************
#
#   raylib [textures] example - Bunnymark
#
#   Example originally created with raylib 1.6, last time updated with raylib 2.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2014-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Particle structure with basic data
class Bunny < FFI::Struct
  layout :position, Raylib::Vector2,
         :speed, Raylib::Vector2,
         :color, Raylib::Color

  def position = self[:position]
  def position=(new_position) self[:position] = new_position end
  def speed = self[:speed]
  def speed=(new_speed) self[:speed] = new_speed end
  def color = self[:color]
  def color=(new_color) self[:color] = new_color end

  def self.create(position, speed, color)
    new.tap do |instance|
      instance.position = position
      instance.speed = speed
      instance.color = color
    end
  end
end

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - bunnymark')

MAX_BUNNIES = 50_000
MAX_BATCH_ELEMENTS = 8192

tex_bunny = Raylib.load_texture(File.join(__dir__, 'resources/wabbit_alpha.png'))

bunnies = []
bunnies_count = 0

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  if Raylib.is_mouse_button_down(Raylib::MOUSE_BUTTON_LEFT)
    # Create more bunnies
    100.times do
      next unless bunnies_count < MAX_BUNNIES

      position = Raylib.get_mouse_position

      speed = Raylib::Vector2.create(
        rand(-250..250) / 60.0,
        rand(-250..250) / 60.0
      )

      color = Raylib::Color.create(
        rand(50..240),
        rand(80..240),
        rand(100..240),
        255
      )
      bunnies << Bunny.create(position, speed, color)
      bunnies_count += 1
    end
  end

  # Update bunnies
  bunnies.each do |bunny|
    bunny.position.x += bunny.speed.x
    bunny.position.y += bunny.speed.y

    if (bunny.position.x + (tex_bunny.width / 2) > Raylib.get_screen_width) ||
       (bunny.position.x + (tex_bunny.width / 2)).negative?
      bunny.speed.x *= -1
    end

    if (bunny.position.y + (tex_bunny.height / 2) > Raylib.get_screen_height) ||
       (bunny.position.y + (tex_bunny.height / 2) - 40).negative?
      bunny.speed.y *= -1
    end
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  bunnies.each do |bunny|
    # NOTE: When internal batch buffer limit is reached (MAX_BATCH_ELEMENTS),
    # a draw call is launched and buffer starts being filled again;
    # before issuing a draw call, updated vertex data from internal CPU buffer is send to GPU...
    # Process of sending data is costly and it could happen that GPU data has not been completely
    # processed for drawing while new data is tried to be sent (updating current in-use buffers)
    # it could generates a stall and consequently a frame drop, limiting the number of drawn bunnies
    Raylib.draw_texture(tex_bunny, bunny.position.x.to_i, bunny.position.y.to_i, bunny.color)
  end

  Raylib.draw_rectangle(0, 0, SCREEN_WIDTH, 40, Raylib::BLACK)
  Raylib.draw_text(Raylib.text_format('bunnies: %i', :int, bunnies_count), 120, 10, 20, Raylib::GREEN)
  Raylib.draw_text(Raylib.text_format('batched draw calls: %i', :int, 1 + (bunnies_count / MAX_BATCH_ELEMENTS)), 320, 10, 20, Raylib::MAROON)

  Raylib.draw_fps(10, 10)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(tex_bunny) # Unload bunny texture
Raylib.close_window              # Close window and OpenGL context
# --------------------------------------------------------------------------------------
