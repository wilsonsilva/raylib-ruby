# ******************************************************************************************
#
#   raylib [core] example - 2d camera
#
#   Example originally created with raylib 1.5, last time updated with raylib 3.0
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2016-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

MAX_BUILDINGS = 100

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 2d camera")

player = Raylib::Rectangle.create(400, 280, 40, 40)
buildings = Array.new(MAX_BUILDINGS) { Raylib::Rectangle.create(0, 0, 0, 0) }
build_colors = Array.new(MAX_BUILDINGS) { Raylib::Color.create(0, 0, 0, 0) }

spacing = 0

MAX_BUILDINGS.times do |i|
  buildings[i].width = rand(50..200).to_f
  buildings[i].height = rand(100..800).to_f
  buildings[i].y = SCREEN_HEIGHT - 130.0 - buildings[i].height
  buildings[i].x = -6000.0 + spacing

  spacing += buildings[i].width.to_i

  build_colors[i] = Raylib::Color.create(
    rand(200..240),
    rand(200..240),
    rand(200..250),
    255
  )
end

camera = Raylib::Camera2D.new
camera.target = Raylib::Vector2.create(player.x + 20.0, player.y + 20.0)
camera.offset = Raylib::Vector2.create(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0)
camera.rotation = 0.0
camera.zoom = 1.0

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  # Player movement
  if Raylib.is_key_down(Raylib::KEY_RIGHT)
    player.x += 2
  elsif Raylib.is_key_down(Raylib::KEY_LEFT)
    player.x -= 2
  end

  # Camera target follows player
  camera.target = Raylib::Vector2.create(player.x + 20, player.y + 20)

  # Camera rotation controls
  camera.rotation -= 1 if Raylib.is_key_down(Raylib::KEY_A)
  camera.rotation += 1 if Raylib.is_key_down(Raylib::KEY_S)

  # Limit camera rotation to 80 degrees (-40 to 40)
  camera.rotation = 40 if camera.rotation > 40
  camera.rotation = -40 if camera.rotation < -40

  # Camera zoom controls
  camera.zoom += Raylib.get_mouse_wheel_move * 0.05

  camera.zoom = 3.0 if camera.zoom > 3.0
  camera.zoom = 0.1 if camera.zoom < 0.1

  # Camera reset (zoom and rotation)
  if Raylib.is_key_pressed(Raylib::KEY_R)
    camera.zoom = 1.0
    camera.rotation = 0.0
  end
  #----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing

    Raylib.clear_background(Raylib::RAYWHITE)

    Raylib.begin_mode_2d(camera)

      Raylib.draw_rectangle(-6000, 320, 13000, 8000, Raylib::DARKGRAY)

      MAX_BUILDINGS.times do |i|
        Raylib.draw_rectangle_rec(buildings[i], build_colors[i])
      end

      Raylib.draw_rectangle_rec(player, Raylib::RED)

      Raylib.draw_line(camera.target.x.to_i, -SCREEN_HEIGHT * 10, camera.target.x.to_i, SCREEN_HEIGHT * 10, Raylib::GREEN)
      Raylib.draw_line(-SCREEN_WIDTH * 10, camera.target.y.to_i, SCREEN_WIDTH * 10, camera.target.y.to_i, Raylib::GREEN)

    Raylib.end_mode_2d

    Raylib.draw_text("SCREEN AREA", 640, 10, 20, Raylib::RED)

    Raylib.draw_rectangle(0, 0, SCREEN_WIDTH, 5, Raylib::RED)
    Raylib.draw_rectangle(0, 5, 5, SCREEN_HEIGHT - 10, Raylib::RED)
    Raylib.draw_rectangle(SCREEN_WIDTH - 5, 5, 5, SCREEN_HEIGHT - 10, Raylib::RED)
    Raylib.draw_rectangle(0, SCREEN_HEIGHT - 5, SCREEN_WIDTH, 5, Raylib::RED)

    Raylib.draw_rectangle(10, 10, 250, 113, Raylib.fade(Raylib::SKYBLUE, 0.5))
    Raylib.draw_rectangle_lines(10, 10, 250, 113, Raylib::BLUE)

    Raylib.draw_text("Free 2d camera controls:", 20, 20, 10, Raylib::BLACK)
    Raylib.draw_text("- Right/Left to move Offset", 40, 40, 10, Raylib::DARKGRAY)
    Raylib.draw_text("- Mouse Wheel to Zoom in-out", 40, 60, 10, Raylib::DARKGRAY)
    Raylib.draw_text("- A / S to Rotate", 40, 80, 10, Raylib::DARKGRAY)
    Raylib.draw_text("- R to reset Zoom and Rotation", 40, 100, 10, Raylib::DARKGRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
#--------------------------------------------------------------------------------------
