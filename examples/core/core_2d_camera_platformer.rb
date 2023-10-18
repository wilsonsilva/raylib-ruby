# ******************************************************************************************
# 
#   raylib [core] example - 2d camera platformer
#
#   Example originally created with raylib 2.5, last time updated with raylib 3.0
# 
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2019-2023 arvyy (@arvyy)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'
require 'raylib/raymath'

G = 400
PLAYER_JUMP_SPD = 350.0
PLAYER_HOR_SPD = 200.0

class Player
  attr_accessor :position, :speed, :can_jump

  def initialize
    @position = Raylib::Vector2.create(0, 0)
    @speed = 0
    @can_jump = false
  end
end

class EnvItem
  attr_accessor :rect, :blocking, :color

  def initialize(rect, blocking, color)
    @rect = rect
    @blocking = blocking
    @color = color
  end
end

def update_player(player, env_items, delta)
  player.position.x -= PLAYER_HOR_SPD * delta if Raylib.is_key_down(Raylib::KEY_LEFT)
  player.position.x += PLAYER_HOR_SPD * delta if Raylib.is_key_down(Raylib::KEY_RIGHT)

  if Raylib.is_key_down(Raylib::KEY_SPACE) && player.can_jump
    player.speed = -PLAYER_JUMP_SPD
    player.can_jump = false
  end

  hit_obstacle = false
  env_items.each do |ei|
    if ei.blocking &&
      ei.rect.x <= player.position.x &&
      ei.rect.x + ei.rect.width >= player.position.x &&
      ei.rect.y >= player.position.y &&
      ei.rect.y <= player.position.y + player.speed * delta
      hit_obstacle = true
      player.speed = 0.0
      player.position.y = ei.rect.y
    end
  end

  unless hit_obstacle
    player.position.y += player.speed * delta
    player.speed += G * delta
    player.can_jump = false
  else
    player.can_jump = true
  end
end

def update_camera_center(camera, player, _env_items, _delta, width, height)
  camera.offset = Raylib::Vector2.create(width / 2.0, height / 2.0)
  camera.target = player.position
end

def update_camera_center_inside_map(camera, player, env_items, _delta, width, height)
  camera.target = player.position
  camera.offset = Raylib::Vector2.create(width / 2.0, height / 2.0)
  min_x, min_y, max_x, max_y = Float::INFINITY, Float::INFINITY, -Float::INFINITY, -Float::INFINITY

  env_items.each do |ei|
    min_x = [ei.rect.x, min_x].min
    max_x = [ei.rect.x + ei.rect.width, max_x].max
    min_y = [ei.rect.y, min_y].min
    max_y = [ei.rect.y + ei.rect.height, max_y].max
  end

  max = Raylib.get_world_to_screen_2d(Raylib::Vector2.create(max_x, max_y), camera)
  min = Raylib.get_world_to_screen_2d(Raylib::Vector2.create(min_x, min_y), camera)

  camera.offset.x = width - (max.x - width/2) if max.x < width
  camera.offset.y = height - (max.y - height/2) if max.y < height
  camera.offset.x = width/2 - min.x if min.x > 0
  camera.offset.y = height/2 - min.y if min.y > 0
end

def update_camera_center_smooth_follow(camera, player, _env_items, delta, width, height)
  min_speed = 30
  min_effect_length = 10
  fraction_speed = 0.8

  camera.offset = Raylib::Vector2.create(width / 2.0, height / 2.0)
  diff = Raylib.vector2_subtract(player.position, camera.target)
  length = Raylib.vector2_length(diff)

  if length > min_effect_length
    speed = [fraction_speed * length, min_speed].max
    camera.target = Raylib.vector2_add(camera.target, Raylib.vector2_scale(diff, speed * delta / length))
  end
end

def update_camera_even_out_on_landing(camera, player, _env_items, delta, width, height)
  even_out_speed = 700
  @evening_out ||= false
  @even_out_target ||= 0

  camera.offset = Raylib::Vector2.create(width / 2.0, height / 2.0)
  camera.target.x = player.position.x

  if @evening_out
    if @even_out_target > camera.target.y
      camera.target.y += even_out_speed * delta

      if camera.target.y > @even_out_target
        camera.target.y = @even_out_target
        @evening_out = false
      end
    else
      camera.target.y -= even_out_speed * delta

      if camera.target.y < @even_out_target
        camera.target.y = @even_out_target
        @evening_out = false
      end
    end
  elsif player.can_jump && (player.speed == 0) && (player.position.y != camera.target.y)
    @evening_out = true
    @even_out_target = player.position.y
  end
end

def update_camera_player_bounds_push(camera, player, _env_items, delta, width, height)
  bbox = Raylib::Vector2.create(0.2, 0.2)

  bbox_world_min = Raylib.get_screen_to_world_2d(Raylib::Vector2.create((1 - bbox.x) * 0.5 * width, (1 - bbox.y) * 0.5 * height), camera)
  bbox_world_max = Raylib.get_screen_to_world_2d(Raylib::Vector2.create((1 + bbox.x) * 0.5 * width, (1 + bbox.y) * 0.5 * height), camera)
  camera.offset = Raylib::Vector2.create((1 - bbox.x) * 0.5 * width, (1 - bbox.y) * 0.5 * height)

  camera.target.x = bbox_world_min.x + (player.position.x - bbox_world_max.x) if player.position.x > bbox_world_max.x
  camera.target.y = bbox_world_min.y + (player.position.y - bbox_world_max.y) if player.position.y > bbox_world_max.y
  camera.target.x = player.position.x if player.position.x < bbox_world_min.x
  camera.target.y = player.position.y if player.position.y < bbox_world_min.y
end

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 2d camera")

player = Player.new
player.position = Raylib::Vector2.create(400, 280)

env_items = [
  EnvItem.new(Raylib::Rectangle.create(0, 0, 1000, 400), 0, Raylib::LIGHTGRAY),
  EnvItem.new(Raylib::Rectangle.create(0, 400, 1000, 200), 1, Raylib::GRAY),
  EnvItem.new(Raylib::Rectangle.create(300, 200, 400, 10), 1, Raylib::GRAY),
  EnvItem.new(Raylib::Rectangle.create(250, 300, 100, 10), 1, Raylib::GRAY),
  EnvItem.new(Raylib::Rectangle.create(650, 300, 100, 10), 1, Raylib::GRAY)
]

camera = Raylib::Camera2D.create(
  player.position,
  Raylib::Vector2.create(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0),
  0.0,
  1.0
)

camera_option = 0
camera_descriptions = [
  "Follow player center",
  "Follow player center, but clamp to map edges",
  "Follow player center; smoothed",
  "Follow player center horizontally; updateplayer center vertically after landing",
  "Player push camera on getting too close to screen edge"
]

# Store references to the multiple update camera methods
camera_updaters = [
  method(:update_camera_center),
  method(:update_camera_center_inside_map),
  method(:update_camera_center_smooth_follow),
  method(:update_camera_even_out_on_landing),
  method(:update_camera_player_bounds_push),
]

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------
#  Program main entry point
# ------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------
  delta_time = Raylib.get_frame_time

  update_player(player, env_items, delta_time)

  camera.zoom += Raylib.get_mouse_wheel_move * 0.05

  camera.zoom = [camera.zoom, 3.0].min
  camera.zoom = [camera.zoom, 0.25].max

  if Raylib.is_key_pressed(Raylib::KEY_R)
    camera.zoom = 1.0
    player.position = Raylib::Vector2.create(400, 280)
  end

  if Raylib.is_key_pressed(Raylib::KEY_C)
    camera_option = (camera_option + 1) % camera_descriptions.size
  end

  camera_updaters[camera_option].call(camera, player, env_items, delta_time, SCREEN_WIDTH, SCREEN_HEIGHT)

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::LIGHTGRAY)

  Raylib.begin_mode_2d(camera)

  env_items.each do |item|
    Raylib.draw_rectangle_rec(item.rect, item.color)
  end

  player_rect = Raylib::Rectangle.create(player.position.x - 20, player.position.y - 40, 40, 40)
  Raylib.draw_rectangle_rec(player_rect, Raylib::RED)

  Raylib.end_mode_2d

  Raylib.draw_text("Controls:", 20, 20, 10, Raylib::BLACK)
  Raylib.draw_text("- Right/Left to move", 40, 40, 10, Raylib::DARKGRAY)
  Raylib.draw_text("- Space to jump", 40, 60, 10, Raylib::DARKGRAY)
  Raylib.draw_text("- Mouse Wheel to Zoom in-out, R to reset zoom", 40, 80, 10, Raylib::DARKGRAY)
  Raylib.draw_text("- C to change camera mode", 40, 100, 10, Raylib::DARKGRAY)
  Raylib.draw_text("Current camera mode:", 20, 120, 10, Raylib::BLACK)
  Raylib.draw_text(camera_descriptions[camera_option], 40, 140, 10, Raylib::DARKGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window
# --------------------------------------------------------------------------------------
