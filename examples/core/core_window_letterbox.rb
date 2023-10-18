# ******************************************************************************************
#
#   raylib [core] example - window scale letterbox (and virtual mouse)
#
#   Example originally created with raylib 2.5, last time updated with raylib 4.0
#
#   Example contributed by Anata (@anatagawa) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
#
#   Copyright (c) 2019-2023 Anata (@anatagawa) and Ramon Santamaria (@raysan5)
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'
require 'raylib/raymath'

# Initialization
#--------------------------------------------------------------------------------------
window_width = 800
window_height = 450

# Enable config flags for resizable window and vertical synchro
Raylib.set_config_flags(Raylib::FLAG_WINDOW_RESIZABLE | Raylib::FLAG_VSYNC_HINT)
Raylib.init_window(window_width, window_height, "raylib [core] example - window scale letterbox")
Raylib.set_window_min_size(320, 240)

game_SCREEN_WIDTH = 640
game_SCREEN_HEIGHT = 480

# Render texture initialization, used to hold the rendering result so we can easily resize it
target = Raylib.load_render_texture(game_SCREEN_WIDTH, game_SCREEN_HEIGHT)
Raylib.set_texture_filter(target.texture, Raylib::TEXTURE_FILTER_BILINEAR)  # Texture scale filter to use

colors = []
10.times do
  colors << Raylib::Color.create(Raylib.get_random_value(100, 250), Raylib.get_random_value(50, 150), Raylib.get_random_value(10, 100), 255)
end

Raylib.set_target_fps(60)
#--------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close  # Detect window close button or ESC key
  # Update
  #----------------------------------------------------------------------------------
  # Compute required framebuffer scaling
  scale = [Raylib.get_screen_width.to_f / game_SCREEN_WIDTH, Raylib.get_screen_height.to_f / game_SCREEN_HEIGHT].min

  if Raylib.is_key_pressed(Raylib::KEY_SPACE)
    # Recalculate random colors for the bars
    for i in 0...10
      colors[i] = Raylib::Color.create(Raylib.get_random_value(100, 250), Raylib.get_random_value(50, 150), Raylib.get_random_value(10, 100), 255)
    end
  end

  # Update virtual mouse (clamped mouse value behind game screen)
  mouse = Raylib.get_mouse_position
  virtual_mouse = Raylib::Vector2.new
  virtual_mouse.x = (mouse.x - (Raylib.get_screen_width - (game_SCREEN_WIDTH * scale)) * 0.5) / scale
  virtual_mouse.y = (mouse.y - (Raylib.get_screen_height - (game_SCREEN_HEIGHT * scale)) * 0.5) / scale
  virtual_mouse = Raylib.vector2_clamp(virtual_mouse, Raylib::Vector2.create(0, 0), Raylib::Vector2.create(game_SCREEN_WIDTH.to_f, game_SCREEN_HEIGHT.to_f))
  #----------------------------------------------------------------------------------

  # Draw
  #----------------------------------------------------------------------------------
  Raylib.begin_texture_mode(target)
  Raylib.clear_background(Raylib::RAYWHITE)  # Clear render texture background color

  for i in 0...10
    Raylib.draw_rectangle(0, (game_SCREEN_HEIGHT / 10) * i, game_SCREEN_WIDTH, game_SCREEN_HEIGHT / 10, colors[i])
  end

  Raylib.draw_text("If executed inside a window,\nyou can resize the window,\nand see the screen scaling!", 10, 25, 20, Raylib::WHITE)
  Raylib.draw_text(Raylib.text_format("Default Mouse: [%i , %i]", :int, mouse.x.to_i, :int, mouse.y.to_i), 350, 25, 20, Raylib::GREEN)
  Raylib.draw_text(Raylib.text_format("Virtual Mouse: [%i , %i]", :int, virtual_mouse.x.to_i, :int, virtual_mouse.y.to_i), 350, 55, 20, Raylib::YELLOW)
  Raylib.end_texture_mode

  Raylib.begin_drawing
  Raylib.clear_background(Raylib::BLACK)  # Clear screen background

  # Draw render texture to screen, properly scaled
  Raylib.draw_texture_pro(target.texture,
                          Raylib::Rectangle.create(0.0, 0.0, target.texture.width.to_f, -target.texture.height.to_f),
                          Raylib::Rectangle.create((Raylib.get_screen_width - (game_SCREEN_WIDTH * scale)) * 0.5,
                                                   (Raylib.get_screen_height - (game_SCREEN_HEIGHT * scale)) * 0.5,
                                                   game_SCREEN_WIDTH * scale,
                                                   game_SCREEN_HEIGHT * scale),
                          Raylib::Vector2.create(0, 0), 0.0, Raylib::WHITE)
  Raylib.end_drawing
  #----------------------------------------------------------------------------------
end

# De-Initialization
#--------------------------------------------------------------------------------------
Raylib.unload_render_texture(target)  # Unload render texture

Raylib.close_window  # Close window and OpenGL context
#--------------------------------------------------------------------------------------
