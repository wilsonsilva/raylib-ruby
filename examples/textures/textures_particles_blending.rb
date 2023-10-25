# ******************************************************************************************
# 
#   raylib example - particles blending
#
#   Example originally created with raylib 1.7, last time updated with raylib 3.5
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

# Particle structure with basic data
class Particle < FFI::Struct
  layout :position, Raylib::Vector2,
         :color, Raylib::Color,
         :alpha, :float,
         :size, :float,
         :rotation, :float,
         :active, :bool

  def position = self[:position]
  def position=(new_position) self[:position] = new_position end
  def color = self[:color]
  def color=(new_color) self[:color] = new_color end
  def alpha = self[:alpha]
  def alpha=(new_alpha) self[:alpha] = new_alpha end
  def size = self[:size]
  def size=(new_size) self[:size] = new_size end
  def rotation = self[:rotation]
  def rotation=(new_rotation) self[:rotation] = new_rotation end
  def active = self[:active]
  def active=(new_active) self[:active] = new_active end
end

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - particles blending')

MAX_PARTICLES = 200

# Particles pool, reuse them!
mouse_tail = Array.new(MAX_PARTICLES) { Particle.new }

# Initialize particles
mouse_tail.each do |particle|
  particle.position = Raylib::Vector2.create(0, 0)
  particle.color = Raylib::Color.create(
    rand(0..255),
    rand(0..255),
    rand(0..255),
    255
  )
  particle.alpha = 1.0
  particle.size = rand(1..30) / 20.0
  particle.rotation = rand(0..360)
  particle.active = false
end

gravity = 3.0

smoke = Raylib.load_texture(File.join(__dir__, 'resources/spark_flame.png'))

blending = Raylib::BLEND_ALPHA

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------

  # Activate one particle every frame and Update active particles
  # NOTE: Particles initial position should be mouse position when activated
  # NOTE: Particles fall down with gravity and rotation... and disappear after 2 seconds (alpha = 0)
  # NOTE: When a particle disappears, active = false and it can be reused.
  mouse_tail.each do |particle|
    next if particle.active

    particle.active = true
    particle.alpha = 1.0
    particle.position = Raylib.get_mouse_position

    break
  end

  mouse_tail.each do |particle|
    next unless particle.active

    particle.position.y += gravity / 2
    particle.alpha -= 0.005
    particle.active = false if particle.alpha <= 0.0
    particle.rotation += 2.0
  end

  blending = (blending == Raylib::BLEND_ALPHA) ? Raylib::BLEND_ADDITIVE : Raylib::BLEND_ALPHA if Raylib.is_key_pressed(Raylib::KEY_SPACE)
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::DARKGRAY)
  Raylib.begin_blend_mode(blending)

  # Draw active particles
  mouse_tail.each do |particle|
    next unless particle.active

    Raylib.draw_texture_pro(smoke, Raylib::Rectangle.create(0.0, 0.0, smoke.width.to_f, smoke.height.to_f),
                            Raylib::Rectangle.create(particle.position.x, particle.position.y, smoke.width * particle.size, smoke.height * particle.size),
                            Raylib::Vector2.create(smoke.width * particle.size / 2.0, smoke.height * particle.size / 2.0), particle.rotation,
                            Raylib.fade(particle.color, particle.alpha))
  end

  Raylib.end_blend_mode

  Raylib.draw_text('PRESS SPACE to CHANGE BLENDING MODE', 180, 20, 20, Raylib::BLACK)
  blending_text = (blending == Raylib::BLEND_ALPHA) ? 'ALPHA BLENDING' : 'ADDITIVE BLENDING'
  Raylib.draw_text(blending_text, 290, SCREEN_HEIGHT - 40, 20, (blending == Raylib::BLEND_ALPHA ? Raylib::BLACK : Raylib::RAYWHITE))

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(smoke)
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
