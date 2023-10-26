# ******************************************************************************************
#
#   raylib [shapes] example - collision area
#
#   Example originally created with raylib 2.5, last time updated with raylib 2.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2013-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'raylib [shapes] example - collision area')

# Box A: Moving box
box_a = Raylib::Rectangle.create(10, (Raylib.get_screen_height / 2.0) - 50, 200, 100)
box_a_speed_x = 4

# Box B: Mouse moved box
box_b = Raylib::Rectangle.create(
  (Raylib.get_screen_width / 2.0) - 30, (Raylib.get_screen_height / 2.0) - 30, 60, 60
)

box_collision = Raylib::Rectangle.create(0, 0, 0, 0) # Collision rectangle

SCREEN_UPPER_LIMIT = 40 # Top menu limits

pause = false # Movement pause

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close
  # Update
  # ----------------------------------------------------------------------------------
  # Move box if not paused
  box_a.x += box_a_speed_x unless pause

  # Bounce box on x screen limits
  box_a_speed_x *= -1 if (box_a.x + box_a.width >= Raylib.get_screen_width) || (box_a.x <= 0)

  # Update player-controlled-box (box02)
  box_b.x = Raylib.get_mouse_x - (box_b.width / 2)
  box_b.y = Raylib.get_mouse_y - (box_b.height / 2)

  # Make sure Box B does not go out of move area limits
  if (box_b.x + box_b.width) >= Raylib.get_screen_width
    box_b.x = Raylib.get_screen_width - box_b.width
  elsif box_b.x <= 0
    box_b.x = 0
  end

  if (box_b.y + box_b.height) >= Raylib.get_screen_height
    box_b.y = Raylib.get_screen_height - box_b.height
  elsif box_b.y <= SCREEN_UPPER_LIMIT
    box_b.y = SCREEN_UPPER_LIMIT
  end

  # Check boxes collision
  collision = Raylib.check_collision_recs(box_a, box_b)

  # Get collision rectangle (only on collision)
  box_collision = Raylib.get_collision_rec(box_a, box_b) if collision

  # Pause Box A movement
  pause = !pause if Raylib.is_key_pressed(Raylib::KEY_SPACE)
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_UPPER_LIMIT, collision ? Raylib::RED : Raylib::BLACK)

  Raylib.draw_rectangle_rec(box_a, Raylib::GOLD)
  Raylib.draw_rectangle_rec(box_b, Raylib::BLUE)

  if collision
    # Draw collision area
    Raylib.draw_rectangle_rec(box_collision, Raylib::LIME)

    # Draw collision message
    Raylib.draw_text(
      'COLLISION!',
      (Raylib.get_screen_width / 2) - (Raylib.measure_text('COLLISION!', 20) / 2),
      (SCREEN_UPPER_LIMIT / 2) - 10, 20, Raylib::BLACK
    )

    # Draw collision area
    Raylib.draw_text(
      Raylib.text_format("Collision Area: #{(box_collision.width * box_collision.height).to}"),
      (Raylib.get_screen_width / 2) - 100,
      SCREEN_UPPER_LIMIT + 10, 20, Raylib::BLACK
    )
  end

  Raylib.draw_fps(10, 10)
  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
