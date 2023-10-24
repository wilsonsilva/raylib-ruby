# ******************************************************************************************
#
#   raylib [textures] example - sprite button
#
#   Example originally created with raylib 2.5, last time updated with raylib 2.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2019-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

NUM_FRAMES = 3 # Number of frames (rectangles) for the button sprite texture

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [textures] example - sprite button')

Raylib.init_audio_device # Initialize audio device

fx_button = Raylib.load_sound(File.join(__dir__, 'resources/buttonfx.wav')) # Load button sound
button = Raylib.load_texture(File.join(__dir__, 'resources/button.png')) # Load button texture

# Define frame rectangle for drawing
frame_height = button.height / NUM_FRAMES.to_f
source_rec = Raylib::Rectangle.create(0, 0, button.width.to_f, frame_height)

# Define button bounds on screen
btn_bounds = Raylib::Rectangle.create(
  SCREEN_WIDTH / 2.0 - button.width / 2.0,
  SCREEN_HEIGHT / 2.0 - button.height / NUM_FRAMES / 2.0,
  button.width.to_f,
  frame_height
)

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  mouse_point = Raylib.get_mouse_position
  btn_action = false

  # Check button state 0-NORMAL, 1-MOUSE_HOVER, 2-PRESSED
  if Raylib.check_collision_point_rec(mouse_point, btn_bounds)
    if Raylib.is_mouse_button_down(Raylib::MOUSE_BUTTON_LEFT)
      btn_state = 2
    else
      btn_state = 1
    end

    btn_action = true if Raylib.is_mouse_button_released(Raylib::MOUSE_BUTTON_LEFT)
  else
    btn_state = 0
  end

  Raylib.play_sound(fx_button) if btn_action

  # Calculate button frame rectangle to draw depending on button state
  source_rec.y = btn_state * frame_height
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_texture_rec(button, source_rec, Raylib::Vector2.create(btn_bounds.x, btn_bounds.y), Raylib::WHITE)  # Draw button frame

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(button)  # Unload button texture
Raylib.unload_sound(fx_button) # Unload sound
Raylib.close_audio_device      # Close audio device
Raylib.close_window            # Close window and OpenGL context
# --------------------------------------------------------------------------------------
