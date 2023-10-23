# ******************************************************************************************
# 
#   raylib [models] example - Load 3d model with animations and play them
#
#   Example originally created with raylib 2.5, last time updated with raylib 3.5
# 
#   Example contributed by Culacant (@culacant) and reviewed by Ramon Santamaria (@raysan5)
#
#   Example ported to Ruby by Wilson Silva (@wilsonsilva). Works with Raylib 4.5
#
#   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
#   BSD-like license that allows static linking with closed source software
# 
#   Copyright (c) 2019-2023 Culacant (@culacant) and Ramon Santamaria (@raysan5)
# 
# ******************************************************************************************
# 
#   NOTE: To export a model from blender, make sure it is not posed, the vertices need to be 
#         in the same position as they would be in edit mode and the scale of your models is 
#         set to 0. Scaling can be done from the export menu.
#
# ******************************************************************************************

require 'bundler/setup'
require 'raylib'

# Initialization
# --------------------------------------------------------------------------------------
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 450

Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [models] example - model animation")

# Define the camera to look into our 3d world
camera = Raylib::Camera3D.create(
  Raylib::Vector3.create(10.0, 10.0, 10.0), # Camera position
  Raylib::Vector3.create(0.0, 0.0, 0.0),   # Camera looking at point
  Raylib::Vector3.create(0.0, 1.0, 0.0),   # Camera up vector (rotation towards target)
  45.0,                                    # Camera field-of-view Y
  Raylib::CAMERA_PERSPECTIVE               # Camera mode type
)

model = Raylib.load_model(File.join(__dir__, "resources/models/iqm/guy.iqm")) # Load the animated model mesh and basic data # FIXME: Should work without File.join
texture = Raylib.load_texture(File.join(__dir__, "resources/models/iqm/guytex.png")) # Load model texture and set material # FIXME: Should work without File.join
# FIXME: MATERIAL_MAP_ALBEDO should be MATERIAL_MAP_DIFFUSE, but I haven't defined MATERIAL_MAP_ALBEDO yet in raylib.rb. I should parse the #define
Raylib.set_material_texture(model.materials[0], Raylib::MATERIAL_MAP_ALBEDO, texture) # Set model material map texture

position = Raylib::Vector3.create(0.0, 0.0, 0.0) # Set model position

# Create a pointer for an unsigned int
anims_count_ptr = FFI::MemoryPointer.new(:uint)

# Initialize animsCount to 0
anims_count_ptr.put_uint(0, 0)

# Load animation data
anim_ptrs = Raylib.load_model_animations(File.join(__dir__, "resources/models/iqm/guyanim.iqm"), anims_count_ptr) # FIXME: Should work without File.join
anims = anims_count_ptr.read_uint.times.map do |i|
  # Raylib::ModelAnimation.new(anim_ptrs + i * Raylib::ModelAnimation.size)
end
anim_frame_counter = 0

Raylib.disable_cursor # Catch cursor
Raylib.set_target_fps(60) # Set our game to run at 60 frames-per-second
# --------------------------------------------------------------------------------------

# Main game loop
until Raylib.window_should_close # Detect window close button or ESC key
  # Update
  # ----------------------------------------------------------------------------------
  Raylib.update_camera(camera, Raylib::CAMERA_FIRST_PERSON)

  # Play animation when spacebar is held down
  if Raylib.is_key_down(Raylib::KEY_SPACE)
    anim_frame_counter += 1
    Raylib.update_model_animation(model, anims[0], anim_frame_counter)
    anim_frame_counter = 0 if anim_frame_counter >= anims[0].frame_count
  end
  # ----------------------------------------------------------------------------------

  # Draw
  # ----------------------------------------------------------------------------------
  Raylib.begin_drawing

  Raylib.clear_background(Raylib::RAYWHITE)

  Raylib.begin_mode_3d(camera)

  Raylib.draw_model_ex(model, position, Raylib::Vector3.create(1.0, 0.0, 0.0), -90.0, Raylib::Vector3.create(1.0, 1.0, 1.0), Raylib::WHITE)

  model.bone_count.times do |i|
    # Raylib.draw_cube(
    #   anims[0].frame_poses[anim_frame_counter][i].translation, 0.2, 0.2, 0.2, Raylib::RED
    # )

    Raylib.draw_cube(
      anims[0].frame_poses(anim_frame_counter)[i].translation, 0.2, 0.2, 0.2, Raylib::RED
    )
  end

  Raylib.draw_grid(10, 1.0) # Draw a grid

  Raylib.end_mode_3d

  Raylib.draw_text("PRESS SPACE to PLAY MODEL ANIMATION", 10, 10, 20, Raylib::MAROON)
  Raylib.draw_text("(c) Guy IQM 3D model by @culacant", SCREEN_WIDTH - 200, SCREEN_HEIGHT - 20, 10, Raylib::GRAY)

  Raylib.end_drawing
  # ----------------------------------------------------------------------------------
end

# De-Initialization
# --------------------------------------------------------------------------------------
Raylib.unload_texture(texture)                                    # Unload texture
Raylib.unload_model_animations(anims, anims_count_ptr.read_uint)  # Unload model animations data
Raylib.unload_model(model)                                        # Unload model

Raylib.close_window # Close window and OpenGL context
# --------------------------------------------------------------------------------------
