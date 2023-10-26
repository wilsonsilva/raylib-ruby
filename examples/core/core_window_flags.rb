# ******************************************************************************************
#
#   raylib [core] example - window flags
#
#   Example originally created with raylib 3.5, last time updated with raylib 3.5
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2020-2023 Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
#---------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - window flags")

ball_position = Raylib::Vector2.create(Raylib.get_screen_width / 2.0, Raylib.get_screen_height / 2.0)
ball_speed = Raylib::Vector2.create(5.0, 4.0)
ball_radius = 20.0

frames_counter = 0

Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second

def draw_window_flag_state(flag_name, flag_value, key, y_position)
  state_text = if Raylib.is_window_state(flag_value)
                 "on"
               else
                 "off"
               end
  Raylib.draw_text("#{key} #{flag_name}: #{state_text}", 10, y_position, 10, state_text == "on" ? Raylib::LIME : Raylib::MAROON)
end

# Main game loop
until Raylib.window_should_close
  # Update
  #-----------------------------------------------------
  if Raylib.is_key_pressed(Raylib::KEY_F)
    Raylib.toggle_fullscreen
  end

  if Raylib.is_key_pressed(Raylib::KEY_R)
    if Raylib.is_window_state(Raylib::FLAG_WINDOW_RESIZABLE)
      Raylib.clear_window_state(Raylib::FLAG_WINDOW_RESIZABLE)
    else
      Raylib.set_window_state(Raylib::FLAG_WINDOW_RESIZABLE)
    end
  end

  if Raylib.is_key_pressed(Raylib::KEY_D)
    if Raylib.is_window_state(Raylib::FLAG_WINDOW_UNDECORATED)
      Raylib.clear_window_state(Raylib::FLAG_WINDOW_UNDECORATED)
    else
      Raylib.set_window_state(Raylib::FLAG_WINDOW_UNDECORATED)
    end
  end

  if Raylib.is_key_pressed(Raylib::KEY_H)
    unless Raylib.is_window_state(Raylib::FLAG_WINDOW_HIDDEN)
      Raylib.set_window_state(Raylib::FLAG_WINDOW_HIDDEN)
    end
    frames_counter = 0
  end

  if Raylib.is_window_state(Raylib::FLAG_WINDOW_HIDDEN)
    frames_counter += 1
    Raylib.clear_window_state(Raylib::FLAG_WINDOW_HIDDEN) if frames_counter >= 240
  end

  if Raylib.is_key_pressed(Raylib::KEY_N)
    unless Raylib.is_window_state(Raylib::FLAG_WINDOW_MINIMIZED)
      Raylib.minimize_window
    end
    frames_counter = 0
  end

  if Raylib.is_window_state(Raylib::FLAG_WINDOW_MINIMIZED)
    frames_counter += 1
    Raylib.restore_window if frames_counter >= 240
  end

  if Raylib.is_key_pressed(Raylib::KEY_M)
    if Raylib.is_window_state(Raylib::FLAG_WINDOW_MAXIMIZED)
      Raylib.restore_window
    else
      Raylib.maximize_window
    end
  end

  if Raylib.is_key_pressed(Raylib::KEY_U)
    if Raylib.is_window_state(Raylib::FLAG_WINDOW_UNFOCUSED)
      Raylib.clear_window_state(Raylib::FLAG_WINDOW_UNFOCUSED)
    else
      Raylib.set_window_state(Raylib::FLAG_WINDOW_UNFOCUSED)
    end
  end

  if Raylib.is_key_pressed(Raylib::KEY_T)
    if Raylib.is_window_state(Raylib::FLAG_WINDOW_TOPMOST)
      Raylib.clear_window_state(Raylib::FLAG_WINDOW_TOPMOST)
    else
      Raylib.set_window_state(Raylib::FLAG_WINDOW_TOPMOST)
    end
  end

  if Raylib.is_key_pressed(Raylib::KEY_A)
    if Raylib.is_window_state(Raylib::FLAG_WINDOW_ALWAYS_RUN)
      Raylib.clear_window_state(Raylib::FLAG_WINDOW_ALWAYS_RUN)
    else
      Raylib.set_window_state(Raylib::FLAG_WINDOW_ALWAYS_RUN)
    end
  end

  if Raylib.is_key_pressed(Raylib::KEY_V)
    if Raylib.is_window_state(Raylib::FLAG_VSYNC_HINT)
      Raylib.clear_window_state(Raylib::FLAG_VSYNC_HINT)
    else
      Raylib.set_window_state(Raylib::FLAG_VSYNC_HINT)
    end
  end

  # Bouncing ball logic
  ball_position.x += ball_speed.x
  ball_position.y += ball_speed.y

  if (ball_position.x >= (Raylib.get_screen_width - ball_radius)) || (ball_position.x <= ball_radius)
    ball_speed.x *= -1.0
  end

  if (ball_position.y >= (Raylib.get_screen_height - ball_radius)) || (ball_position.y <= ball_radius)
    ball_speed.y *= -1.0
  end

  # Draw
  #-----------------------------------------------------
  Raylib.begin_drawing

  if Raylib.is_window_state(Raylib::FLAG_WINDOW_TRANSPARENT)
    Raylib.clear_background(Raylib::BLANK)
  else
    Raylib.clear_background(Raylib::RAYWHITE)
  end

  Raylib.draw_circle_v(ball_position, ball_radius, Raylib::MAROON)

  Raylib.draw_rectangle_lines_ex(
    Raylib::Rectangle.create(0, 0, Raylib.get_screen_width.to_f, Raylib.get_screen_height.to_f),
    4,
    Raylib::RAYWHITE
  )

  Raylib.draw_circle_v(Raylib.get_mouse_position, 10, Raylib::DARKBLUE)

  Raylib.draw_fps(10, 10)

  Raylib.draw_text(
    "Screen Size: [#{Raylib.get_screen_width}, #{Raylib.get_screen_height}]",
    10,
    40,
    10,
    Raylib::GREEN
  )

  # Draw window state info
  draw_window_flag_state("FLAG_FULLSCREEN_MODE", Raylib::FLAG_FULLSCREEN_MODE, "[F]", 80)
  draw_window_flag_state("FLAG_WINDOW_RESIZABLE", Raylib::FLAG_WINDOW_RESIZABLE, "[R]", 100)
  draw_window_flag_state("FLAG_WINDOW_UNDECORATED", Raylib::FLAG_WINDOW_UNDECORATED, "[D]", 120)
  draw_window_flag_state("FLAG_WINDOW_HIDDEN", Raylib::FLAG_WINDOW_HIDDEN, "[H]", 140)
  draw_window_flag_state("FLAG_WINDOW_MINIMIZED", Raylib::FLAG_WINDOW_MINIMIZED, "[N]", 160)
  draw_window_flag_state("FLAG_WINDOW_MAXIMIZED", Raylib::FLAG_WINDOW_MAXIMIZED, "[M]", 180)
  draw_window_flag_state("FLAG_WINDOW_UNFOCUSED", Raylib::FLAG_WINDOW_UNFOCUSED, "[U]", 200)
  draw_window_flag_state("FLAG_WINDOW_TOPMOST", Raylib::FLAG_WINDOW_TOPMOST, "[T]", 220)
  draw_window_flag_state("FLAG_WINDOW_ALWAYS_RUN", Raylib::FLAG_WINDOW_ALWAYS_RUN, "[A]", 240)
  draw_window_flag_state("FLAG_VSYNC_HINT", Raylib::FLAG_VSYNC_HINT, "[V]", 260)

  Raylib.draw_text("Following flags can only be set before window creation:", 10, 300, 10, Raylib::GRAY)

  draw_window_flag_state("FLAG_WINDOW_HIGHDPI", Raylib::FLAG_WINDOW_HIGHDPI, "[none]", 320)
  draw_window_flag_state("FLAG_WINDOW_TRANSPARENT", Raylib::FLAG_WINDOW_TRANSPARENT, "[none]", 340)
  draw_window_flag_state("FLAG_MSAA_4X_HINT", Raylib::FLAG_MSAA_4X_HINT, "[none]", 360)

  Raylib.end_drawing
  #-----------------------------------------------------
end

# De-Initialization
#---------------------------------------------------------
Raylib.close_window
#---------------------------------------------------------
