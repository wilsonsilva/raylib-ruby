# ******************************************************************************************
#
#   raylib [shapes] example - rectangle scaling by mouse
#
#   Example originally created with raylib 2.5, last time updated with raylib 2.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example contributed by Vlad Adrian (@demizdor) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2018-2023 Vlad Adrian (@demizdor) and Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

MOUSE_SCALE_MARK_SIZE = 12

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [shapes] example - rectangle scaling mouse")

rec = Raylib::Rectangle.create(100, 100, 200, 80)

mouse_scale_mode = false

Raylib.set_target_fps(60)
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  mouse_position = Raylib.get_mouse_position

  scale_rectangle = Raylib::Rectangle.create(
    rec.x + rec.width - MOUSE_SCALE_MARK_SIZE,
    rec.y + rec.height - MOUSE_SCALE_MARK_SIZE,
    MOUSE_SCALE_MARK_SIZE,
    MOUSE_SCALE_MARK_SIZE
  )

  if Raylib.check_collision_point_rec(mouse_position, scale_rectangle)
    mouse_scale_ready = true
    mouse_scale_mode = true if Raylib.is_mouse_button_pressed(Raylib::MOUSE_BUTTON_LEFT)
  else
    mouse_scale_ready = false
  end

  if mouse_scale_mode
    mouse_scale_ready = true

    rec.width = mouse_position.x - rec.x
    rec.height = mouse_position.y - rec.y

    # Check minimum rec size
    rec.width = MOUSE_SCALE_MARK_SIZE if rec.width < MOUSE_SCALE_MARK_SIZE
    rec.height = MOUSE_SCALE_MARK_SIZE if rec.height < MOUSE_SCALE_MARK_SIZE

    # Check maximum rec size
    rec.width = SCREEN_WIDTH - rec.x if rec.width > (SCREEN_WIDTH - rec.x)
    rec.height = SCREEN_HEIGHT - rec.y if rec.height > (SCREEN_HEIGHT - rec.y)

    mouse_scale_mode = false if Raylib.is_mouse_button_released(Raylib::MOUSE_BUTTON_LEFT)
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.draw_text("Scale rectangle dragging from bottom-right corner!", 10, 10, 20, Raylib::GRAY)

  Raylib.draw_rectangle_rec(rec, Raylib.fade(Raylib::GREEN, 0.5))

  if mouse_scale_ready
    Raylib.draw_rectangle_lines_ex(rec, 1, Raylib::RED)
    Raylib.draw_triangle(Raylib::Vector2.create(rec.x + rec.width - MOUSE_SCALE_MARK_SIZE, rec.y + rec.height),
                         Raylib::Vector2.create(rec.x + rec.width, rec.y + rec.height),
                         Raylib::Vector2.create(rec.x + rec.width, rec.y + rec.height - MOUSE_SCALE_MARK_SIZE), Raylib::RED)
  end

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
