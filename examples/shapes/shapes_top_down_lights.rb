# ******************************************************************************************
#
#   raylib [shapes] example - top down lights
#
#   Example originally created with raylib 4.2, last time updated with raylib 4.2
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example contributed by Vlad Adrian (@demizdor) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2022-2023 Jeffery Myers (@JeffM2501)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'
require 'raylib/raymath'
require 'raylib/rlgl'

# Custom Blend Modes
RLGL_SRC_ALPHA = 0x0302
RLGL_MIN = 0x8007
RLGL_MAX = 0x8008

MAX_BOXES = 20
MAX_SHADOWS = MAX_BOXES * 3 # MAX_BOXES *3. Each box can cast up to two shadow volumes for the edges it is away from, and one for the box itself
MAX_LIGHTS = 16

# Shadow geometry type
class ShadowGeometry < FFI::Struct
  layout :vertices, [Raylib::Vector2, 4]

  def vertices = self[:vertices]
  def vertices=(value) self[:vertices] = value end
end

# Light info type
class LightInfo < FFI::Struct
  layout :active, :bool,                          # Is this light slot active?
         :dirty, :bool,                           # Does this light need to be updated?
         :valid, :bool,                           # Is this light in a valid position?

         :position, Raylib::Vector2,              # Light position
         :mask, Raylib::RenderTexture,            # Alpha mask for the light
         :outer_radius, :float,                   # The distance the light touches
         :bounds, Raylib::Rectangle,              # A cached rectangle of the light bounds to help with culling

         :shadows, [ShadowGeometry, MAX_SHADOWS],
         :shadow_count, :int


  def self.create_empty
    new.tap do |light|
      light[:position] = Raylib::Vector2.create(0, 0)
      light[:bounds] = Raylib::Rectangle.create(0, 0, 0, 0)
      # light[:shadows] = Array.new(MAX_SHADOWS) { ShadowGeometry.new }
    end
  end

  def active = self[:active]
  def active=(value) self[:active] = value end
  def valid = self[:valid]
  def valid=(value) self[:valid] = value end
  def dirty = self[:dirty]
  def dirty=(value) self[:dirty] = value end
  def position = self[:position]
  def position=(value) self[:position] = value end
  def outer_radius = self[:outer_radius]
  def outer_radius=(value) self[:outer_radius] = value end
  def bounds = self[:bounds]
  def bounds=(value) self[:bounds] = value end
  def shadow_count = self[:shadow_count]
  def shadow_count=(value) self[:shadow_count] = value end
  def shadows = self[:shadows]
  def shadows=(value) self[:shadows] = value end
  def mask = self[:mask]
  def mask=(value) self[:mask] = value end
end

$lights = Array.new(MAX_LIGHTS) { LightInfo.create_empty }

# Move a light and mark it as dirty so that we update its mask next frame
def move_light(slot, x, y)
  $lights[slot].dirty = true
  $lights[slot].position.x = x
  $lights[slot].position.y = y

  # update the cached bounds
  $lights[slot].bounds.x = x - $lights[slot].outer_radius
  $lights[slot].bounds.y = y - $lights[slot].outer_radius
end

# Compute a shadow volume for the edge
# It takes the edge and projects it back by the light radius and turns it into a quad
def compute_shadow_volume_for_edge(slot, sp, ep)
  return if $lights[slot].shadow_count >= MAX_SHADOWS

  extension = $lights[slot].outer_radius * 2

  sp_vector = Raylib.vector2_normalize(Raylib.vector2_subtract(sp, $lights[slot].position))
  sp_projection = Raylib.vector2_add(sp, Raylib.vector2_scale(sp_vector, extension))

  ep_vector = Raylib.vector2_normalize(Raylib.vector2_subtract(ep, $lights[slot].position))
  ep_projection = Raylib.vector2_add(ep, Raylib.vector2_scale(ep_vector, extension))

  $lights[slot].shadows[$lights[slot].shadow_count].vertices[0] = sp
  $lights[slot].shadows[$lights[slot].shadow_count].vertices[1] = ep
  $lights[slot].shadows[$lights[slot].shadow_count].vertices[2] = ep_projection
  $lights[slot].shadows[$lights[slot].shadow_count].vertices[3] = sp_projection

  $lights[slot].shadow_count += 1
end

# Draw the light and shadows to the mask for a light
def draw_light_mask(slot)
  # Use the light mask
  Raylib.begin_texture_mode($lights[slot].mask)

  Raylib.clear_background(Raylib::WHITE)

  # Force the blend mode to only set the alpha of the destination
  Raylib.rl_set_blend_factors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN)
  Raylib.rl_set_blend_mode(Raylib::BLEND_CUSTOM)

  # If we are valid, then draw the light radius to the alpha mask
  if $lights[slot].valid
    Raylib.draw_circle_gradient(
      $lights[slot].position.x,
      $lights[slot].position.y,
      $lights[slot].outer_radius,
      Raylib.color_alpha(Raylib::WHITE, 0),
      Raylib::WHITE
    )
  end

  Raylib.rl_draw_render_batch_active

  # Cut out the shadows from the light radius by forcing the alpha to maximum
  Raylib.rl_set_blend_mode(Raylib::BLEND_ALPHA)
  Raylib.rl_set_blend_factors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MAX)
  Raylib.rl_set_blend_mode(Raylib::BLEND_CUSTOM)

  # Draw the shadows to the alpha mask
  $lights[slot].shadows.each do |shadow|
    Raylib.draw_triangle_fan(shadow.vertices, 4, Raylib::WHITE)
  end

  Raylib.rl_draw_render_batch_active

  # Go back to normal blend mode
  Raylib.rl_set_blend_mode(Raylib::BLEND_ALPHA)

  Raylib.end_texture_mode
end

# Setup a light
def setup_light(slot, x, y, radius)
  $lights[slot].active = true
  $lights[slot].valid = false # The light must prove it is valid
  $lights[slot].mask = Raylib.load_render_texture(Raylib.get_screen_width, Raylib.get_screen_height)
  $lights[slot].outer_radius = radius

  $lights[slot].bounds.width = radius * 2
  $lights[slot].bounds.height = radius * 2

  move_light(slot, x, y)

  # Force the render texture to have something in it
  draw_light_mask(slot)
end

# See if a light needs to update it's mask
def update_light(slot, boxes, count)
  return false unless $lights[slot].active && $lights[slot].dirty

  $lights[slot].dirty = false
  $lights[slot].shadow_count = 0
  $lights[slot].valid = false

  boxes.each_with_index do |box, i|
    break if i >= count

    # Check if the light's position is inside a box
    return false if Raylib.check_collision_point_rec($lights[slot].position, box)

    # Skip boxes outside the light's bounds
    next unless Raylib.check_collision_recs($lights[slot].bounds, box)

    # Check the edges that are on the same side as the light and cast shadow volumes from them

    # Top
    sp = Raylib::Vector2.create(box.x, box.y)
    ep = Raylib::Vector2.create(box.x + box.width, box.y)
    compute_shadow_volume_for_edge(slot, sp, ep) if $lights[slot].position.y > ep.y

    # Right
    sp = ep
    ep.y += box.height
    compute_shadow_volume_for_edge(slot, sp, ep) if $lights[slot].position.x < ep.x

    # Bottom
    sp = ep
    ep.x -= box.width
    compute_shadow_volume_for_edge(slot, sp, ep) if $lights[slot].position.y < ep.y

    # Left
    sp = ep
    ep.y -= box.height
    compute_shadow_volume_for_edge(slot, sp, ep) if $lights[slot].position.x > ep.x

    # The box itself
    $lights[slot].shadows[$lights[slot].shadow_count].vertices[0] = Raylib::Vector2.create(box.x, box.y)
    $lights[slot].shadows[$lights[slot].shadow_count].vertices[1] = Raylib::Vector2.create(box.x, box.y + box.height)
    $lights[slot].shadows[$lights[slot].shadow_count].vertices[2] = Raylib::Vector2.create(box.x + box.width, box.y + box.height)
    $lights[slot].shadows[$lights[slot].shadow_count].vertices[3] = Raylib::Vector2.create(box.x + box.width, box.y)
    $lights[slot].shadow_count += 1
  end

  $lights[slot].valid = true

  draw_light_mask(slot)

  true
end

# Set up some boxes
def setup_boxes(boxes)
  boxes[0] = Raylib::Rectangle.create(150, 80, 40, 40)
  boxes[1] = Raylib::Rectangle.create(1200, 700, 40, 40)
  boxes[2] = Raylib::Rectangle.create(200, 600, 40, 40)
  boxes[3] = Raylib::Rectangle.create(1000, 50, 40, 40)
  boxes[4] = Raylib::Rectangle.create(500, 350, 40, 40)

  (5...MAX_BOXES).each do |i|
    boxes[i] = Raylib::Rectangle.create(
      rand(0..Raylib.get_screen_width),
      rand(0..Raylib.get_screen_height),
      rand(10..100),
      rand(10..100)
    )
  end

  MAX_BOXES
end

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [shapes] example - top down lights")

# Initialize our 'world' of boxes
boxes = Array.new(MAX_BOXES)
box_count = setup_boxes(boxes)

# Create a checkerboard ground texture
img = Raylib.gen_image_checked(64, 64, 32, 32, Raylib::DARKBROWN, Raylib::DARKGRAY)
background_texture = Raylib.load_texture_from_image(img)
Raylib.unload_image(img)

# Create a global light mask to hold all the blended lights
light_mask = Raylib.load_render_texture(Raylib.get_screen_width, Raylib.get_screen_height)

# Setup initial light
setup_light(0, 600, 400, 300)
next_light = 1

show_lines = false

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------
  # Drag light 0
  move_light(0, Raylib.get_mouse_position.x, Raylib.get_mouse_position.y) if Raylib.is_mouse_button_down(Raylib::MOUSE_BUTTON_LEFT)

  # Make a new light
  if Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_RIGHT) && (next_light < MAX_LIGHTS)
    setup_light(next_light, Raylib.get_mouse_position.x, Raylib.get_mouse_position.y, 200)
    next_light += 1
  end

  # Toggle debug info
  show_lines = !show_lines if Raylib.is_key_pressed(Raylib::KEY_F1)

  # Update the lights and keep track if any were dirty so we know if we need to update the master light mask
  dirty_lights = false

  $lights.length.times do |i|
    if update_light(i, boxes, box_count)
      dirty_lights = true
    end
  end

  # Update the light mask
  if dirty_lights
    # Build up the light mask
    Raylib.begin_texture_mode(light_mask)

    Raylib.clear_background(Raylib::BLACK)

    # Force the blend mode to only set the alpha of the destination
    Raylib.rl_set_blend_factors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN)
    Raylib.rl_set_blend_mode(Raylib::BLEND_CUSTOM)

    # Merge in all the light masks
    $lights.each_with_index do |light, i|
      if light.active
        Raylib.draw_texture_rec(
          light.mask.texture,
          Raylib::Rectangle.create(0, 0, Raylib.get_screen_width, -Raylib.get_screen_height),
          Raylib::Vector2.create(0, 0),
          Raylib::WHITE
        )
      end
    end

    Raylib.rl_draw_render_batch_active

    # Go back to normal blend
    Raylib.rl_set_blend_mode(Raylib::BLEND_ALPHA)

    Raylib.end_texture_mode
  end
  #----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing

  # Draw the tile background
  Raylib.draw_texture_rec(
    background_texture,
    Raylib::Rectangle.create(0, 0, Raylib.get_screen_width, Raylib.get_screen_height),
    Raylib::Vector2.create(0, 0),
    Raylib::WHITE
  )

  # Overlay the shadows from all the lights
  Raylib.draw_texture_rec(
    light_mask.texture,
    Raylib::Rectangle.create(0, 0, Raylib.get_screen_width, -Raylib.get_screen_height),
    Raylib::Vector2.create(0, 0),
    Raylib.color_alpha(Raylib::WHITE, show_lines ? 0.75 : 1.0)
  )

  # Draw the lights
  $lights.each_with_index do |light, i|
    if light.active
      Raylib.draw_circle(light.position.x.to_i, light.position.y.to_i, 10, (i == 0) ? Raylib::YELLOW : Raylib::WHITE)
    end
  end

  if show_lines
    # Debug drawing for shadow volumes and boxes
    $lights[0].shadows.first($lights[0].shadow_count).each do |shadow|
      Raylib.draw_triangle_fan(shadow.vertices, 4, Raylib::DARKPURPLE)
    end

    boxes.first(box_count).each do |box|
      if Raylib.check_collision_recs(box, $lights[0].bounds)
        Raylib.draw_rectangle_rec(box, Raylib::PURPLE)
      end

      Raylib.draw_rectangle_lines(box.x.to_i, box.y.to_i, box.width.to_i, box.height.to_i, Raylib::DARKBLUE)
    end

    Raylib.draw_text("(F1) Hide Shadow Volumes", 10, 50, 10, Raylib::GREEN)
  else
    Raylib.draw_text("(F1) Show Shadow Volumes", 10, 50, 10, Raylib::GREEN)
  end

  Raylib.draw_fps(SCREEN_WIDTH - 80, 10)
  Raylib.draw_text("Drag to move light #1", 10, 10, 10, Raylib::DARKGREEN)
  Raylib.draw_text("Right click to add new light", 10, 30, 10, Raylib::DARKGREEN)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(background_texture)
Raylib.unload_render_texture(light_mask)

$lights.each do |light|
  Raylib.unload_render_texture(light.mask) if light.active
end

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
