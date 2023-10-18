# ******************************************************************************************
#
#   raylib [core] example - split screen
#
#   Example originally created with raylib 3.7, last time updated with raylib 4.0
#
#   Example contributed by Jeffery Myers (@JeffM2501) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2021-2023 Jeffery Myers (@JeffM2501)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Scene drawing
def draw_scene(camera_player_1, camera_player_2)
  count = 5
  spacing = 4

  # Grid of cube trees on a plane to make a "world"
  Raylib.draw_plane(Raylib::Vector3.create(0, 0, 0), Raylib::Vector2.create(50, 50), Raylib::BEIGE) # Simple world plane

  (-count * spacing..count * spacing).step(spacing) do |x|
    (-count * spacing..count * spacing).step(spacing) do |z|
      Raylib.draw_cube(Raylib::Vector3.create(x, 1.5, z), 1, 1, 1, Raylib::LIME)
      Raylib.draw_cube(Raylib::Vector3.create(x, 0.5, z), 0.25, 1, 0.25, Raylib::BROWN)
    end
  end


  # Draw a cube at each player's position
  Raylib.draw_cube(camera_player_1.position, 1, 1, 1, Raylib::RED)
  Raylib.draw_cube(camera_player_2.position, 1, 1, 1, Raylib::BLUE)
end

# Initialization
#--------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - split screen")

camera_player_1 = Raylib::Camera.new

# Setup player 1 camera and screen
camera_player_1.fovy = 45.0
camera_player_1.up.y = 1.0
camera_player_1.target.y = 1.0
camera_player_1.position.z = -3.0
camera_player_1.position.y = 1.0

screen_player_1 = Raylib.load_render_texture(SCREEN_WIDTH/2, SCREEN_HEIGHT)

# Setup player two camera and screen
camera_player_2 = Raylib::Camera.new
camera_player_2.fovy = 45.0
camera_player_2.up.y = 1.0
camera_player_2.target.y = 3.0
camera_player_2.position.x = -3.0
camera_player_2.position.y = 3.0

screen_player_2 = Raylib.load_render_texture(SCREEN_WIDTH / 2, SCREEN_HEIGHT)

# Build a flipped rectangle the size of the split view to use for drawing later
split_screen_rect = Raylib::Rectangle.create(0.0, 0.0, screen_player_1.texture.width.to_f, -screen_player_1.texture.height.to_f)

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close    # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  # If anyone moves this frame, how far will they move based on the time since the last frame
  # this moves thigns at 10 world units per second, regardless of the actual FPS
  offset_this_frame = 10.0 * Raylib.get_frame_time

  # Move Player1 forward and backwards (no turning)
  if Raylib.is_key_down(Raylib::KEY_W)
    camera_player_1.position.z += offset_this_frame
    camera_player_1.target.z += offset_this_frame
  elsif Raylib.is_key_down(Raylib::KEY_S)
    camera_player_1.position.z -= offset_this_frame
    camera_player_1.target.z -= offset_this_frame
  end

  # Move Player2 forward and backwards (no turning)
  if Raylib.is_key_down(Raylib::KEY_UP)
    camera_player_2.position.x += offset_this_frame
    camera_player_2.target.x += offset_this_frame
  elsif Raylib.is_key_down(Raylib::KEY_DOWN)
    camera_player_2.position.x -= offset_this_frame
    camera_player_2.target.x -= offset_this_frame
  end
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  # Draw Player1 view to the render texture
  Raylib.begin_texture_mode(screen_player_1)
    Raylib.clear_background(Raylib::SKYBLUE)
    Raylib.begin_mode_3d(camera_player_1)
      draw_scene(camera_player_1, camera_player_2)
    Raylib.end_mode_3d
    Raylib.draw_text("PLAYER1 W/S to move", 10, 10, 20, Raylib::RED)
  Raylib.end_texture_mode

  # Draw Player2 view to the render texture
  Raylib.begin_texture_mode(screen_player_2)
    Raylib.clear_background(Raylib::SKYBLUE)
    Raylib.begin_mode_3d(camera_player_2)
      draw_scene(camera_player_1, camera_player_2)
    Raylib.end_mode_3d
    Raylib.draw_text("PLAYER2 UP/DOWN to move", 10, 10, 20, Raylib::BLUE)
  Raylib.end_texture_mode

  # Draw both views render textures to the screen side by side
  Raylib.begin_drawing
    Raylib.clear_background(Raylib::BLACK)
    Raylib.draw_texture_rec(screen_player_1.texture, split_screen_rect, Raylib::Vector2.create(0, 0), Raylib::WHITE)
    Raylib.draw_texture_rec(screen_player_2.texture, split_screen_rect, Raylib::Vector2.create(SCREEN_WIDTH/2.0, 0), Raylib::WHITE)
  Raylib.end_drawing
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.unload_render_texture(screen_player_1) # Unload render texture
Raylib.unload_render_texture(screen_player_2) # Unload render texture

Raylib.close_window # Close window and OpenGL context
#--------------------------------------------------------------------------------------
