module Raylib
  # Initialize window and OpenGL context
  attach_function :init_window, :InitWindow, [:int, :int, :pointer], :void

  # Check if KEY_ESCAPE pressed or Close icon pressed
  attach_function :window_should_close, :WindowShouldClose, [], :bool

  # Close window and unload OpenGL context
  attach_function :close_window, :CloseWindow, [], :void

  # Check if window has been initialized successfully
  attach_function :is_window_ready, :IsWindowReady, [], :bool

  # Check if window is currently fullscreen
  attach_function :is_window_fullscreen, :IsWindowFullscreen, [], :bool

  # Check if window is currently hidden (only PLATFORM_DESKTOP)
  attach_function :is_window_hidden, :IsWindowHidden, [], :bool

  # Check if window is currently minimized (only PLATFORM_DESKTOP)
  attach_function :is_window_minimized, :IsWindowMinimized, [], :bool

  # Check if window is currently maximized (only PLATFORM_DESKTOP)
  attach_function :is_window_maximized, :IsWindowMaximized, [], :bool

  # Check if window is currently focused (only PLATFORM_DESKTOP)
  attach_function :is_window_focused, :IsWindowFocused, [], :bool

  # Check if window has been resized last frame
  attach_function :is_window_resized, :IsWindowResized, [], :bool

  # Check if one specific window flag is enabled
  attach_function :is_window_state, :IsWindowState, [:uint], :bool

  # Set window configuration state using flags (only PLATFORM_DESKTOP)
  attach_function :set_window_state, :SetWindowState, [:uint], :void

  # Clear window configuration state flags
  attach_function :clear_window_state, :ClearWindowState, [:uint], :void

  # Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
  attach_function :toggle_fullscreen, :ToggleFullscreen, [], :void

  # Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
  attach_function :maximize_window, :MaximizeWindow, [], :void

  # Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
  attach_function :minimize_window, :MinimizeWindow, [], :void

  # Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
  attach_function :restore_window, :RestoreWindow, [], :void

  # Set icon for window (single image, RGBA 32bit, only PLATFORM_DESKTOP)
  attach_function :set_window_icon, :SetWindowIcon, [Image.by_value], :void

  # Set icon for window (multiple images, RGBA 32bit, only PLATFORM_DESKTOP)
  attach_function :set_window_icons, :SetWindowIcons, [:pointer, :int], :void

  # Set title for window (only PLATFORM_DESKTOP)
  attach_function :set_window_title, :SetWindowTitle, [:pointer], :void

  # Set window position on screen (only PLATFORM_DESKTOP)
  attach_function :set_window_position, :SetWindowPosition, [:int, :int], :void

  # Set monitor for the current window (fullscreen mode)
  attach_function :set_window_monitor, :SetWindowMonitor, [:int], :void

  # Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
  attach_function :set_window_min_size, :SetWindowMinSize, [:int, :int], :void

  # Set window dimensions
  attach_function :set_window_size, :SetWindowSize, [:int, :int], :void

  # Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)
  attach_function :set_window_opacity, :SetWindowOpacity, [:float], :void

  # Get native window handle
  attach_function :get_window_handle, :GetWindowHandle, [], :pointer

  # Get current screen width
  attach_function :get_screen_width, :GetScreenWidth, [], :int

  # Get current screen height
  attach_function :get_screen_height, :GetScreenHeight, [], :int

  # Get current render width (it considers HiDPI)
  attach_function :get_render_width, :GetRenderWidth, [], :int

  # Get current render height (it considers HiDPI)
  attach_function :get_render_height, :GetRenderHeight, [], :int

  # Get number of connected monitors
  attach_function :get_monitor_count, :GetMonitorCount, [], :int

  # Get current connected monitor
  attach_function :get_current_monitor, :GetCurrentMonitor, [], :int

  # Get specified monitor position
  attach_function :get_monitor_position, :GetMonitorPosition, [:int], Vector2.by_value

  # Get specified monitor width (current video mode used by monitor)
  attach_function :get_monitor_width, :GetMonitorWidth, [:int], :int

  # Get specified monitor height (current video mode used by monitor)
  attach_function :get_monitor_height, :GetMonitorHeight, [:int], :int

  # Get specified monitor physical width in millimetres
  attach_function :get_monitor_physical_width, :GetMonitorPhysicalWidth, [:int], :int

  # Get specified monitor physical height in millimetres
  attach_function :get_monitor_physical_height, :GetMonitorPhysicalHeight, [:int], :int

  # Get specified monitor refresh rate
  attach_function :get_monitor_refresh_rate, :GetMonitorRefreshRate, [:int], :int

  # Get window position XY on monitor
  attach_function :get_window_position, :GetWindowPosition, [], Vector2.by_value

  # Get window scale DPI factor
  attach_function :get_window_scale_dpi, :GetWindowScaleDPI, [], Vector2.by_value

  # Get the human-readable, UTF-8 encoded name of the primary monitor
  attach_function :get_monitor_name, :GetMonitorName, [:int], :pointer

  # Set clipboard text content
  attach_function :set_clipboard_text, :SetClipboardText, [:pointer], :void

  # Get clipboard text content
  attach_function :get_clipboard_text, :GetClipboardText, [], :pointer

  # Enable waiting for events on EndDrawing(), no automatic event polling
  attach_function :enable_event_waiting, :EnableEventWaiting, [], :void

  # Disable waiting for events on EndDrawing(), automatic events polling
  attach_function :disable_event_waiting, :DisableEventWaiting, [], :void

  # Swap back buffer with front buffer (screen drawing)
  attach_function :swap_screen_buffer, :SwapScreenBuffer, [], :void

  # Register all input events
  attach_function :poll_input_events, :PollInputEvents, [], :void

  # Wait for some time (halt program execution)
  attach_function :wait_time, :WaitTime, [:double], :void

  # Shows cursor
  attach_function :show_cursor, :ShowCursor, [], :void

  # Hides cursor
  attach_function :hide_cursor, :HideCursor, [], :void

  # Check if cursor is not visible
  attach_function :is_cursor_hidden, :IsCursorHidden, [], :bool

  # Enables cursor (unlock cursor)
  attach_function :enable_cursor, :EnableCursor, [], :void

  # Disables cursor (lock cursor)
  attach_function :disable_cursor, :DisableCursor, [], :void

  # Check if cursor is on the screen
  attach_function :is_cursor_on_screen, :IsCursorOnScreen, [], :bool

  # Set background color (framebuffer clear color)
  attach_function :clear_background, :ClearBackground, [Color.by_value], :void

  # Setup canvas (framebuffer) to start drawing
  attach_function :begin_drawing, :BeginDrawing, [], :void

  # End canvas drawing and swap buffers (double buffering)
  attach_function :end_drawing, :EndDrawing, [], :void

  # Begin 2D mode with custom camera (2D)
  attach_function :begin_mode_2d, :BeginMode2D, [Camera2D.by_value], :void

  # Ends 2D mode with custom camera
  attach_function :end_mode_2d, :EndMode2D, [], :void

  # Begin 3D mode with custom camera (3D)
  attach_function :begin_mode_3d, :BeginMode3D, [Camera3D.by_value], :void

  # Ends 3D mode and returns to default 2D orthographic mode
  attach_function :end_mode_3d, :EndMode3D, [], :void

  # Begin drawing to render texture
  attach_function :begin_texture_mode, :BeginTextureMode, [RenderTexture2D.by_value], :void

  # Ends drawing to render texture
  attach_function :end_texture_mode, :EndTextureMode, [], :void

  # Begin custom shader drawing
  attach_function :begin_shader_mode, :BeginShaderMode, [Shader.by_value], :void

  # End custom shader drawing (use default shader)
  attach_function :end_shader_mode, :EndShaderMode, [], :void

  # Begin blending mode (alpha, additive, multiplied, subtract, custom)
  attach_function :begin_blend_mode, :BeginBlendMode, [:int], :void

  # End blending mode (reset to default: alpha blending)
  attach_function :end_blend_mode, :EndBlendMode, [], :void

  # Begin scissor mode (define screen area for following drawing)
  attach_function :begin_scissor_mode, :BeginScissorMode, [:int, :int, :int, :int], :void

  # End scissor mode
  attach_function :end_scissor_mode, :EndScissorMode, [], :void

  # Begin stereo rendering (requires VR simulator)
  attach_function :begin_vr_stereo_mode, :BeginVrStereoMode, [VrStereoConfig.by_value], :void

  # End stereo rendering (requires VR simulator)
  attach_function :end_vr_stereo_mode, :EndVrStereoMode, [], :void

  # Load VR stereo config for VR simulator device parameters
  attach_function :load_vr_stereo_config, :LoadVrStereoConfig, [VrDeviceInfo.by_value], VrStereoConfig.by_value

  # Unload VR stereo config
  attach_function :unload_vr_stereo_config, :UnloadVrStereoConfig, [VrStereoConfig.by_value], :void

  # Load shader from files and bind default locations
  attach_function :load_shader, :LoadShader, [:pointer, :pointer], Shader.by_value

  # Load shader from code strings and bind default locations
  attach_function :load_shader_from_memory, :LoadShaderFromMemory, [:pointer, :pointer], Shader.by_value

  # Check if a shader is ready
  attach_function :is_shader_ready, :IsShaderReady, [Shader.by_value], :bool

  # Get shader uniform location
  attach_function :get_shader_location, :GetShaderLocation, [Shader.by_value, :pointer], :int

  # Get shader attribute location
  attach_function :get_shader_location_attrib, :GetShaderLocationAttrib, [Shader.by_value, :pointer], :int

  # Set shader uniform value
  attach_function :set_shader_value, :SetShaderValue, [Shader.by_value, :int, :pointer, :int], :void

  # Set shader uniform value vector
  attach_function :set_shader_value_v, :SetShaderValueV, [Shader.by_value, :int, :pointer, :int, :int], :void

  # Set shader uniform value (matrix 4x4)
  attach_function :set_shader_value_matrix, :SetShaderValueMatrix, [Shader.by_value, :int, Matrix.by_value], :void

  # Set shader uniform value for texture (sampler2d)
  attach_function :set_shader_value_texture, :SetShaderValueTexture, [Shader.by_value, :int, Texture2D.by_value], :void

  # Unload shader from GPU memory (VRAM)
  attach_function :unload_shader, :UnloadShader, [Shader.by_value], :void

  # Get a ray trace from mouse position
  attach_function :get_mouse_ray, :GetMouseRay, [Vector2.by_value, Camera.by_value], Ray.by_value

  # Get camera transform matrix (view matrix)
  attach_function :get_camera_matrix, :GetCameraMatrix, [Camera.by_value], Matrix.by_value

  # Get camera 2d transform matrix
  attach_function :get_camera_matrix_2d, :GetCameraMatrix2D, [Camera2D.by_value], Matrix.by_value

  # Get the screen space position for a 3d world space position
  attach_function :get_world_to_screen, :GetWorldToScreen, [Vector3.by_value, Camera.by_value], Vector2.by_value

  # Get the world space position for a 2d camera screen space position
  attach_function :get_screen_to_world_2d, :GetScreenToWorld2D, [Vector2.by_value, Camera2D.by_value], Vector2.by_value

  # Get size position for a 3d world space position
  attach_function :get_world_to_screen_ex, :GetWorldToScreenEx, [Vector3.by_value, Camera.by_value, :int, :int], Vector2.by_value

  # Get the screen space position for a 2d camera world space position
  attach_function :get_world_to_screen_2d, :GetWorldToScreen2D, [Vector2.by_value, Camera2D.by_value], Vector2.by_value

  # Set target FPS (maximum)
  attach_function :set_target_fps, :SetTargetFPS, [:int], :void

  # Get current FPS
  attach_function :get_fps, :GetFPS, [], :int

  # Get time in seconds for last frame drawn (delta time)
  attach_function :get_frame_time, :GetFrameTime, [], :float

  # Get elapsed time in seconds since InitWindow()
  attach_function :get_time, :GetTime, [], :double

  # Get a random value between min and max (both included)
  attach_function :get_random_value, :GetRandomValue, [:int, :int], :int

  # Set the seed for the random number generator
  attach_function :set_random_seed, :SetRandomSeed, [:uint], :void

  # Takes a screenshot of current screen (filename extension defines format)
  attach_function :take_screenshot, :TakeScreenshot, [:pointer], :void

  # Setup init configuration flags (view FLAGS)
  attach_function :set_config_flags, :SetConfigFlags, [:uint], :void

  # Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  attach_function :trace_log, :TraceLog, [:int, :pointer, :varargs], :void

  # Set the current threshold (minimum) log level
  attach_function :set_trace_log_level, :SetTraceLogLevel, [:int], :void

  # Internal memory allocator
  attach_function :mem_alloc, :MemAlloc, [:uint], :pointer

  # Internal memory reallocator
  attach_function :mem_realloc, :MemRealloc, [:pointer, :uint], :pointer

  # Internal memory free
  attach_function :mem_free, :MemFree, [:pointer], :void

  # Open URL with default system browser (if available)
  attach_function :open_url, :OpenURL, [:pointer], :void

  # Set custom trace log
  attach_function :set_trace_log_callback, :SetTraceLogCallback, [:TraceLogCallback], :void

  # Set custom file binary data loader
  attach_function :set_load_file_data_callback, :SetLoadFileDataCallback, [:LoadFileDataCallback], :void

  # Set custom file binary data saver
  attach_function :set_save_file_data_callback, :SetSaveFileDataCallback, [:SaveFileDataCallback], :void

  # Set custom file text data loader
  attach_function :set_load_file_text_callback, :SetLoadFileTextCallback, [:LoadFileTextCallback], :void

  # Set custom file text data saver
  attach_function :set_save_file_text_callback, :SetSaveFileTextCallback, [:SaveFileTextCallback], :void

  # Load file data as byte array (read)
  attach_function :load_file_data, :LoadFileData, [:pointer, :pointer], :pointer

  # Unload file data allocated by LoadFileData()
  attach_function :unload_file_data, :UnloadFileData, [:pointer], :void

  # Save data to file from byte array (write), returns true on success
  attach_function :save_file_data, :SaveFileData, [:pointer, :pointer, :uint], :bool

  # Export data to code (.h), returns true on success
  attach_function :export_data_as_code, :ExportDataAsCode, [:pointer, :uint, :pointer], :bool

  # Load text data from file (read), returns a '\0' terminated string
  attach_function :load_file_text, :LoadFileText, [:pointer], :pointer

  # Unload file text data allocated by LoadFileText()
  attach_function :unload_file_text, :UnloadFileText, [:pointer], :void

  # Save text data to file (write), string must be '\0' terminated, returns true on success
  attach_function :save_file_text, :SaveFileText, [:pointer, :pointer], :bool

  # Check if file exists
  attach_function :file_exists, :FileExists, [:pointer], :bool

  # Check if a directory path exists
  attach_function :directory_exists, :DirectoryExists, [:pointer], :bool

  # Check file extension (including point: .png, .wav)
  attach_function :is_file_extension, :IsFileExtension, [:pointer, :pointer], :bool

  # Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
  attach_function :get_file_length, :GetFileLength, [:pointer], :int

  # Get pointer to extension for a filename string (includes dot: '.png')
  attach_function :get_file_extension, :GetFileExtension, [:pointer], :pointer

  # Get pointer to filename for a path string
  attach_function :get_file_name, :GetFileName, [:pointer], :pointer

  # Get filename string without extension (uses static string)
  attach_function :get_file_name_without_ext, :GetFileNameWithoutExt, [:pointer], :pointer

  # Get full path for a given fileName with path (uses static string)
  attach_function :get_directory_path, :GetDirectoryPath, [:pointer], :pointer

  # Get previous directory path for a given path (uses static string)
  attach_function :get_prev_directory_path, :GetPrevDirectoryPath, [:pointer], :pointer

  # Get current working directory (uses static string)
  attach_function :get_working_directory, :GetWorkingDirectory, [], :pointer

  # Get the directory if the running application (uses static string)
  attach_function :get_application_directory, :GetApplicationDirectory, [], :pointer

  # Change working directory, return true on success
  attach_function :change_directory, :ChangeDirectory, [:pointer], :bool

  # Check if a given path is a file or a directory
  attach_function :is_path_file, :IsPathFile, [:pointer], :bool

  # Load directory filepaths
  attach_function :load_directory_files, :LoadDirectoryFiles, [:pointer], FilePathList.by_value

  # Load directory filepaths with extension filtering and recursive directory scan
  attach_function :load_directory_files_ex, :LoadDirectoryFilesEx, [:pointer, :pointer, :bool], FilePathList.by_value

  # Unload filepaths
  attach_function :unload_directory_files, :UnloadDirectoryFiles, [FilePathList.by_value], :void

  # Check if a file has been dropped into window
  attach_function :is_file_dropped, :IsFileDropped, [], :bool

  # Load dropped filepaths
  attach_function :load_dropped_files, :LoadDroppedFiles, [], FilePathList.by_value

  # Unload dropped filepaths
  attach_function :unload_dropped_files, :UnloadDroppedFiles, [FilePathList.by_value], :void

  # Get file modification time (last write time)
  attach_function :get_file_mod_time, :GetFileModTime, [:pointer], :long

  # Compress data (DEFLATE algorithm), memory must be MemFree()
  attach_function :compress_data, :CompressData, [:pointer, :int, :pointer], :pointer

  # Decompress data (DEFLATE algorithm), memory must be MemFree()
  attach_function :decompress_data, :DecompressData, [:pointer, :int, :pointer], :pointer

  # Encode data to Base64 string, memory must be MemFree()
  attach_function :encode_data_base64, :EncodeDataBase64, [:pointer, :int, :pointer], :pointer

  # Decode Base64 string data, memory must be MemFree()
  attach_function :decode_data_base64, :DecodeDataBase64, [:pointer, :pointer], :pointer

  # Check if a key has been pressed once
  attach_function :is_key_pressed, :IsKeyPressed, [:int], :bool

  # Check if a key is being pressed
  attach_function :is_key_down, :IsKeyDown, [:int], :bool

  # Check if a key has been released once
  attach_function :is_key_released, :IsKeyReleased, [:int], :bool

  # Check if a key is NOT being pressed
  attach_function :is_key_up, :IsKeyUp, [:int], :bool

  # Set a custom key to exit program (default is ESC)
  attach_function :set_exit_key, :SetExitKey, [:int], :void

  # Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  attach_function :get_key_pressed, :GetKeyPressed, [], :int

  # Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  attach_function :get_char_pressed, :GetCharPressed, [], :int

  # Check if a gamepad is available
  attach_function :is_gamepad_available, :IsGamepadAvailable, [:int], :bool

  # Get gamepad internal name id
  attach_function :get_gamepad_name, :GetGamepadName, [:int], :string

  # Check if a gamepad button has been pressed once
  attach_function :is_gamepad_button_pressed, :IsGamepadButtonPressed, [:int, :int], :bool

  # Check if a gamepad button is being pressed
  attach_function :is_gamepad_button_down, :IsGamepadButtonDown, [:int, :int], :bool

  # Check if a gamepad button has been released once
  attach_function :is_gamepad_button_released, :IsGamepadButtonReleased, [:int, :int], :bool

  # Check if a gamepad button is NOT being pressed
  attach_function :is_gamepad_button_up, :IsGamepadButtonUp, [:int, :int], :bool

  # Get the last gamepad button pressed
  attach_function :get_gamepad_button_pressed, :GetGamepadButtonPressed, [], :int

  # Get gamepad axis count for a gamepad
  attach_function :get_gamepad_axis_count, :GetGamepadAxisCount, [:int], :int

  # Get axis movement value for a gamepad axis
  attach_function :get_gamepad_axis_movement, :GetGamepadAxisMovement, [:int, :int], :float

  # Set internal gamepad mappings (SDL_GameControllerDB)
  attach_function :set_gamepad_mappings, :SetGamepadMappings, [:pointer], :int

  # Check if a mouse button has been pressed once
  attach_function :is_mouse_button_pressed, :IsMouseButtonPressed, [:int], :bool

  # Check if a mouse button is being pressed
  attach_function :is_mouse_button_down, :IsMouseButtonDown, [:int], :bool

  # Check if a mouse button has been released once
  attach_function :is_mouse_button_released, :IsMouseButtonReleased, [:int], :bool

  # Check if a mouse button is NOT being pressed
  attach_function :is_mouse_button_up, :IsMouseButtonUp, [:int], :bool

  # Get mouse position X
  attach_function :get_mouse_x, :GetMouseX, [], :int

  # Get mouse position Y
  attach_function :get_mouse_y, :GetMouseY, [], :int

  # Get mouse position XY
  attach_function :get_mouse_position, :GetMousePosition, [], Vector2.by_value

  # Get mouse delta between frames
  attach_function :get_mouse_delta, :GetMouseDelta, [], Vector2.by_value

  # Set mouse position XY
  attach_function :set_mouse_position, :SetMousePosition, [:int, :int], :void

  # Set mouse offset
  attach_function :set_mouse_offset, :SetMouseOffset, [:int, :int], :void

  # Set mouse scaling
  attach_function :set_mouse_scale, :SetMouseScale, [:float, :float], :void

  # Get mouse wheel movement for X or Y, whichever is larger
  attach_function :get_mouse_wheel_move, :GetMouseWheelMove, [], :float

  # Get mouse wheel movement for both X and Y
  attach_function :get_mouse_wheel_move_v, :GetMouseWheelMoveV, [], Vector2.by_value

  # Set mouse cursor
  attach_function :set_mouse_cursor, :SetMouseCursor, [:int], :void

  # Get touch position X for touch point 0 (relative to screen size)
  attach_function :get_touch_x, :GetTouchX, [], :int

  # Get touch position Y for touch point 0 (relative to screen size)
  attach_function :get_touch_y, :GetTouchY, [], :int

  # Get touch position XY for a touch point index (relative to screen size)
  attach_function :get_touch_position, :GetTouchPosition, [:int], Vector2.by_value

  # Get touch point identifier for given index
  attach_function :get_touch_point_id, :GetTouchPointId, [:int], :int

  # Get number of touch points
  attach_function :get_touch_point_count, :GetTouchPointCount, [], :int

  # Enable a set of gestures using flags
  attach_function :set_gestures_enabled, :SetGesturesEnabled, [:uint], :void

  # Check if a gesture have been detected
  attach_function :is_gesture_detected, :IsGestureDetected, [:int], :bool

  # Get latest detected gesture
  attach_function :get_gesture_detected, :GetGestureDetected, [], :int

  # Get gesture hold time in milliseconds
  attach_function :get_gesture_hold_duration, :GetGestureHoldDuration, [], :float

  # Get gesture drag vector
  attach_function :get_gesture_drag_vector, :GetGestureDragVector, [], Vector2.by_value

  # Get gesture drag angle
  attach_function :get_gesture_drag_angle, :GetGestureDragAngle, [], :float

  # Get gesture pinch delta
  attach_function :get_gesture_pinch_vector, :GetGesturePinchVector, [], Vector2.by_value

  # Get gesture pinch angle
  attach_function :get_gesture_pinch_angle, :GetGesturePinchAngle, [], :float

  # Update camera position for selected mode
  attach_function :update_camera, :UpdateCamera, [:pointer, :int], :void

  # Update camera movement/rotation
  attach_function :update_camera_pro, :UpdateCameraPro, [:pointer, Vector3.by_value, Vector3.by_value, :float], :void

  # Set texture and rectangle to be used on shapes drawing
  attach_function :set_shapes_texture, :SetShapesTexture, [Texture2D.by_value, Rectangle.by_value], :void

  # Draw a pixel
  attach_function :draw_pixel, :DrawPixel, [:int, :int, Color.by_value], :void

  # Draw a pixel (Vector version)
  attach_function :draw_pixel_v, :DrawPixelV, [Vector2.by_value, Color.by_value], :void

  # Draw a line
  attach_function :draw_line, :DrawLine, [:int, :int, :int, :int, Color.by_value], :void

  # Draw a line (Vector version)
  attach_function :draw_line_v, :DrawLineV, [Vector2.by_value, Vector2.by_value, Color.by_value], :void

  # Draw a line defining thickness
  attach_function :draw_line_ex, :DrawLineEx, [Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void

  # Draw a line using cubic-bezier curves in-out
  attach_function :draw_line_bezier, :DrawLineBezier, [Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void

  # Draw line using quadratic bezier curves with a control point
  attach_function :draw_line_bezier_quad, :DrawLineBezierQuad, [Vector2.by_value, Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void

  # Draw line using cubic bezier curves with 2 control points
  attach_function :draw_line_bezier_cubic, :DrawLineBezierCubic, [Vector2.by_value, Vector2.by_value, Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void

  # Draw lines sequence
  attach_function :draw_line_strip, :DrawLineStrip, [:pointer, :int, Color.by_value], :void

  # Draw a color-filled circle
  attach_function :draw_circle, :DrawCircle, [:int, :int, :float, Color.by_value], :void

  # Draw a piece of a circle
  attach_function :draw_circle_sector, :DrawCircleSector, [Vector2.by_value, :float, :float, :float, :int, Color.by_value], :void

  # Draw circle sector outline
  attach_function :draw_circle_sector_lines, :DrawCircleSectorLines, [Vector2.by_value, :float, :float, :float, :int, Color.by_value], :void

  # Draw a gradient-filled circle
  attach_function :draw_circle_gradient, :DrawCircleGradient, [:int, :int, :float, Color.by_value, Color.by_value], :void

  # Draw a color-filled circle (Vector version)
  attach_function :draw_circle_v, :DrawCircleV, [Vector2.by_value, :float, Color.by_value], :void

  # Draw circle outline
  attach_function :draw_circle_lines, :DrawCircleLines, [:int, :int, :float, Color.by_value], :void

  # Draw ellipse
  attach_function :draw_ellipse, :DrawEllipse, [:int, :int, :float, :float, Color.by_value], :void

  # Draw ellipse outline
  attach_function :draw_ellipse_lines, :DrawEllipseLines, [:int, :int, :float, :float, Color.by_value], :void

  # Draw ring
  attach_function :draw_ring, :DrawRing, [Vector2.by_value, :float, :float, :float, :float, :int, Color.by_value], :void

  # Draw ring outline
  attach_function :draw_ring_lines, :DrawRingLines, [Vector2.by_value, :float, :float, :float, :float, :int, Color.by_value], :void

  # Draw a color-filled rectangle
  attach_function :draw_rectangle, :DrawRectangle, [:int, :int, :int, :int, Color.by_value], :void

  # Draw a color-filled rectangle (Vector version)
  attach_function :draw_rectangle_v, :DrawRectangleV, [Vector2.by_value, Vector2.by_value, Color.by_value], :void

  # Draw a color-filled rectangle
  attach_function :draw_rectangle_rec, :DrawRectangleRec, [Rectangle.by_value, Color.by_value], :void

  # Draw a color-filled rectangle with pro parameters
  attach_function :draw_rectangle_pro, :DrawRectanglePro, [Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void

  # Draw a vertical-gradient-filled rectangle
  attach_function :draw_rectangle_gradient_v, :DrawRectangleGradientV, [:int, :int, :int, :int, Color.by_value, Color.by_value], :void

  # Draw a horizontal-gradient-filled rectangle
  attach_function :draw_rectangle_gradient_h, :DrawRectangleGradientH, [:int, :int, :int, :int, Color.by_value, Color.by_value], :void

  # Draw a gradient-filled rectangle with custom vertex colors
  attach_function :draw_rectangle_gradient_ex, :DrawRectangleGradientEx, [Rectangle.by_value, Color.by_value, Color.by_value, Color.by_value, Color.by_value], :void

  # Draw rectangle outline
  attach_function :draw_rectangle_lines, :DrawRectangleLines, [:int, :int, :int, :int, Color.by_value], :void

  # Draw rectangle outline with extended parameters
  attach_function :draw_rectangle_lines_ex, :DrawRectangleLinesEx, [Rectangle.by_value, :float, Color.by_value], :void

  # Draw rectangle with rounded edges
  attach_function :draw_rectangle_rounded, :DrawRectangleRounded, [Rectangle.by_value, :float, :int, Color.by_value], :void

  # Draw rectangle with rounded edges outline
  attach_function :draw_rectangle_rounded_lines, :DrawRectangleRoundedLines, [Rectangle.by_value, :float, :int, :float, Color.by_value], :void

  # Draw a color-filled triangle (vertex in counter-clockwise order!)
  attach_function :draw_triangle, :DrawTriangle, [Vector2.by_value, Vector2.by_value, Vector2.by_value, Color.by_value], :void

  # Draw triangle outline (vertex in counter-clockwise order!)
  attach_function :draw_triangle_lines, :DrawTriangleLines, [Vector2.by_value, Vector2.by_value, Vector2.by_value, Color.by_value], :void

  # Draw a triangle fan defined by points (first vertex is the center)
  attach_function :draw_triangle_fan, :DrawTriangleFan, [:pointer, :int, Color.by_value], :void

  # Draw a triangle strip defined by points
  attach_function :draw_triangle_strip, :DrawTriangleStrip, [:pointer, :int, Color.by_value], :void

  # Draw a regular polygon (Vector version)
  attach_function :draw_poly, :DrawPoly, [Vector2.by_value, :int, :float, :float, Color.by_value], :void

  # Draw a polygon outline of n sides
  attach_function :draw_poly_lines, :DrawPolyLines, [Vector2.by_value, :int, :float, :float, Color.by_value], :void

  # Draw a polygon outline of n sides with extended parameters
  attach_function :draw_poly_lines_ex, :DrawPolyLinesEx, [Vector2.by_value, :int, :float, :float, :float, Color.by_value], :void

  # Check collision between two rectangles
  attach_function :check_collision_recs, :CheckCollisionRecs, [Rectangle.by_value, Rectangle.by_value], :bool

  # Check collision between two circles
  attach_function :check_collision_circles, :CheckCollisionCircles, [Vector2.by_value, :float, Vector2.by_value, :float], :bool

  # Check collision between circle and rectangle
  attach_function :check_collision_circle_rec, :CheckCollisionCircleRec, [Vector2.by_value, :float, Rectangle.by_value], :bool

  # Check if point is inside rectangle
  attach_function :check_collision_point_rec, :CheckCollisionPointRec, [Vector2.by_value, Rectangle.by_value], :bool

  # Check if point is inside circle
  attach_function :check_collision_point_circle, :CheckCollisionPointCircle, [Vector2.by_value, Vector2.by_value, :float], :bool

  # Check if point is inside a triangle
  attach_function :check_collision_point_triangle, :CheckCollisionPointTriangle, [Vector2.by_value, Vector2.by_value, Vector2.by_value, Vector2.by_value], :bool

  # Check if point is within a polygon described by array of vertices
  attach_function :check_collision_point_poly, :CheckCollisionPointPoly, [Vector2.by_value, :pointer, :int], :bool

  # Check the collision between two lines defined by two points each, returns collision point by reference
  attach_function :check_collision_lines, :CheckCollisionLines, [Vector2.by_value, Vector2.by_value, Vector2.by_value, Vector2.by_value, :pointer], :bool

  # Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  attach_function :check_collision_point_line, :CheckCollisionPointLine, [Vector2.by_value, Vector2.by_value, Vector2.by_value, :int], :bool

  # Get collision rectangle for two rectangles collision
  attach_function :get_collision_rec, :GetCollisionRec, [Rectangle.by_value, Rectangle.by_value], Rectangle.by_value

  # Load image from file into CPU memory (RAM)
  attach_function :load_image, :LoadImage, [:pointer], Image.by_value

  # Load image from RAW file data
  attach_function :load_image_raw, :LoadImageRaw, [:pointer, :int, :int, :int, :int], Image.by_value

  # Load image sequence from file (frames appended to image.data)
  attach_function :load_image_anim, :LoadImageAnim, [:pointer, :pointer], Image.by_value

  # Load image from memory buffer, fileType refers to extension: i.e. '.png'
  attach_function :load_image_from_memory, :LoadImageFromMemory, [:pointer, :pointer, :int], Image.by_value

  # Load image from GPU texture data
  attach_function :load_image_from_texture, :LoadImageFromTexture, [Texture2D.by_value], Image.by_value

  # Load image from screen buffer and (screenshot)
  attach_function :load_image_from_screen, :LoadImageFromScreen, [], Image.by_value

  # Check if an image is ready
  attach_function :is_image_ready, :IsImageReady, [Image.by_value], :bool

  # Unload image from CPU memory (RAM)
  attach_function :unload_image, :UnloadImage, [Image.by_value], :void

  # Export image data to file, returns true on success
  attach_function :export_image, :ExportImage, [Image.by_value, :pointer], :bool

  # Export image as code file defining an array of bytes, returns true on success
  attach_function :export_image_as_code, :ExportImageAsCode, [Image.by_value, :pointer], :bool

  # Generate image: plain color
  attach_function :gen_image_color, :GenImageColor, [:int, :int, Color.by_value], Image.by_value

  # Generate image: vertical gradient
  attach_function :gen_image_gradient_v, :GenImageGradientV, [:int, :int, Color.by_value, Color.by_value], Image.by_value

  # Generate image: horizontal gradient
  attach_function :gen_image_gradient_h, :GenImageGradientH, [:int, :int, Color.by_value, Color.by_value], Image.by_value

  # Generate image: radial gradient
  attach_function :gen_image_gradient_radial, :GenImageGradientRadial, [:int, :int, :float, Color.by_value, Color.by_value], Image.by_value

  # Generate image: checked
  attach_function :gen_image_checked, :GenImageChecked, [:int, :int, :int, :int, Color.by_value, Color.by_value], Image.by_value

  # Generate image: white noise
  attach_function :gen_image_white_noise, :GenImageWhiteNoise, [:int, :int, :float], Image.by_value

  # Generate image: perlin noise
  attach_function :gen_image_perlin_noise, :GenImagePerlinNoise, [:int, :int, :int, :int, :float], Image.by_value

  # Generate image: cellular algorithm, bigger tileSize means bigger cells
  attach_function :gen_image_cellular, :GenImageCellular, [:int, :int, :int], Image.by_value

  # Generate image: grayscale image from text data
  attach_function :gen_image_text, :GenImageText, [:int, :int, :pointer], Image.by_value

  # Create an image duplicate (useful for transformations)
  attach_function :image_copy, :ImageCopy, [Image.by_value], Image.by_value

  # Create an image from another image piece
  attach_function :image_from_image, :ImageFromImage, [Image.by_value, Rectangle.by_value], Image.by_value

  # Create an image from text (default font)
  attach_function :image_text, :ImageText, [:pointer, :int, Color.by_value], Image.by_value

  # Create an image from text (custom sprite font)
  attach_function :image_text_ex, :ImageTextEx, [Font.by_value, :pointer, :float, :float, Color.by_value], Image.by_value

  # Convert image data to desired format
  attach_function :image_format, :ImageFormat, [:pointer, :int], :void

  # Convert image to POT (power-of-two)
  attach_function :image_to_pot, :ImageToPOT, [:pointer, Color.by_value], :void

  # Crop an image to a defined rectangle
  attach_function :image_crop, :ImageCrop, [:pointer, Rectangle.by_value], :void

  # Crop image depending on alpha value
  attach_function :image_alpha_crop, :ImageAlphaCrop, [:pointer, :float], :void

  # Clear alpha channel to desired color
  attach_function :image_alpha_clear, :ImageAlphaClear, [:pointer, Color.by_value, :float], :void

  # Apply alpha mask to image
  attach_function :image_alpha_mask, :ImageAlphaMask, [:pointer, Image.by_value], :void

  # Premultiply alpha channel
  attach_function :image_alpha_premultiply, :ImageAlphaPremultiply, [:pointer], :void

  # Apply Gaussian blur using a box blur approximation
  attach_function :image_blur_gaussian, :ImageBlurGaussian, [:pointer, :int], :void

  # Resize image (Bicubic scaling algorithm)
  attach_function :image_resize, :ImageResize, [:pointer, :int, :int], :void

  # Resize image (Nearest-Neighbor scaling algorithm)
  attach_function :image_resize_nn, :ImageResizeNN, [:pointer, :int, :int], :void

  # Resize canvas and fill with color
  attach_function :image_resize_canvas, :ImageResizeCanvas, [:pointer, :int, :int, :int, :int, Color.by_value], :void

  # Compute all mipmap levels for a provided image
  attach_function :image_mipmaps, :ImageMipmaps, [:pointer], :void

  # Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  attach_function :image_dither, :ImageDither, [:pointer, :int, :int, :int, :int], :void

  # Flip image vertically
  attach_function :image_flip_vertical, :ImageFlipVertical, [:pointer], :void

  # Flip image horizontally
  attach_function :image_flip_horizontal, :ImageFlipHorizontal, [:pointer], :void

  # Rotate image clockwise 90deg
  attach_function :image_rotate_cw, :ImageRotateCW, [:pointer], :void

  # Rotate image counter-clockwise 90deg
  attach_function :image_rotate_ccw, :ImageRotateCCW, [:pointer], :void

  # Modify image color: tint
  attach_function :image_color_tint, :ImageColorTint, [:pointer, Color.by_value], :void

  # Modify image color: invert
  attach_function :image_color_invert, :ImageColorInvert, [:pointer], :void

  # Modify image color: grayscale
  attach_function :image_color_grayscale, :ImageColorGrayscale, [:pointer], :void

  # Modify image color: contrast (-100 to 100)
  attach_function :image_color_contrast, :ImageColorContrast, [:pointer, :float], :void

  # Modify image color: brightness (-255 to 255)
  attach_function :image_color_brightness, :ImageColorBrightness, [:pointer, :int], :void

  # Modify image color: replace color
  attach_function :image_color_replace, :ImageColorReplace, [:pointer, Color.by_value, Color.by_value], :void

  # Load color data from image as a Color array (RGBA - 32bit)
  attach_function :load_image_colors, :LoadImageColors, [Image.by_value], :pointer

  # Load colors palette from image as a Color array (RGBA - 32bit)
  attach_function :load_image_palette, :LoadImagePalette, [Image.by_value, :int, :pointer], :pointer

  # Unload color data loaded with LoadImageColors()
  attach_function :unload_image_colors, :UnloadImageColors, [:pointer], :void

  # Unload colors palette loaded with LoadImagePalette()
  attach_function :unload_image_palette, :UnloadImagePalette, [:pointer], :void

  # Get image alpha border rectangle
  attach_function :get_image_alpha_border, :GetImageAlphaBorder, [Image.by_value, :float], Rectangle.by_value

  # Get image pixel color at (x, y) position
  attach_function :get_image_color, :GetImageColor, [Image.by_value, :int, :int], Color.by_value

  # Clear image background with given color
  attach_function :image_clear_background, :ImageClearBackground, [:pointer, Color.by_value], :void

  # Draw pixel within an image
  attach_function :image_draw_pixel, :ImageDrawPixel, [:pointer, :int, :int, Color.by_value], :void

  # Draw pixel within an image (Vector version)
  attach_function :image_draw_pixel_v, :ImageDrawPixelV, [:pointer, Vector2.by_value, Color.by_value], :void

  # Draw line within an image
  attach_function :image_draw_line, :ImageDrawLine, [:pointer, :int, :int, :int, :int, Color.by_value], :void

  # Draw line within an image (Vector version)
  attach_function :image_draw_line_v, :ImageDrawLineV, [:pointer, Vector2.by_value, Vector2.by_value, Color.by_value], :void

  # Draw a filled circle within an image
  attach_function :image_draw_circle, :ImageDrawCircle, [:pointer, :int, :int, :int, Color.by_value], :void

  # Draw a filled circle within an image (Vector version)
  attach_function :image_draw_circle_v, :ImageDrawCircleV, [:pointer, Vector2.by_value, :int, Color.by_value], :void

  # Draw circle outline within an image
  attach_function :image_draw_circle_lines, :ImageDrawCircleLines, [:pointer, :int, :int, :int, Color.by_value], :void

  # Draw circle outline within an image (Vector version)
  attach_function :image_draw_circle_lines_v, :ImageDrawCircleLinesV, [:pointer, Vector2.by_value, :int, Color.by_value], :void

  # Draw rectangle within an image
  attach_function :image_draw_rectangle, :ImageDrawRectangle, [:pointer, :int, :int, :int, :int, Color.by_value], :void

  # Draw rectangle within an image (Vector version)
  attach_function :image_draw_rectangle_v, :ImageDrawRectangleV, [:pointer, Vector2.by_value, Vector2.by_value, Color.by_value], :void

  # Draw rectangle within an image
  attach_function :image_draw_rectangle_rec, :ImageDrawRectangleRec, [:pointer, Rectangle.by_value, Color.by_value], :void

  # Draw rectangle lines within an image
  attach_function :image_draw_rectangle_lines, :ImageDrawRectangleLines, [:pointer, Rectangle.by_value, :int, Color.by_value], :void

  # Draw a source image within a destination image (tint applied to source)
  attach_function :image_draw, :ImageDraw, [:pointer, Image.by_value, Rectangle.by_value, Rectangle.by_value, Color.by_value], :void

  # Draw text (using default font) within an image (destination)
  attach_function :image_draw_text, :ImageDrawText, [:pointer, :pointer, :int, :int, :int, Color.by_value], :void

  # Draw text (custom sprite font) within an image (destination)
  attach_function :image_draw_text_ex, :ImageDrawTextEx, [:pointer, Font.by_value, :pointer, Vector2.by_value, :float, :float, Color.by_value], :void

  # Load texture from file into GPU memory (VRAM)
  attach_function :load_texture, :LoadTexture, [:pointer], Texture2D.by_value

  # Load texture from image data
  attach_function :load_texture_from_image, :LoadTextureFromImage, [Image.by_value], Texture2D.by_value

  # Load cubemap from image, multiple image cubemap layouts supported
  attach_function :load_texture_cubemap, :LoadTextureCubemap, [Image.by_value, :int], TextureCubemap.by_value

  # Load texture for rendering (framebuffer)
  attach_function :load_render_texture, :LoadRenderTexture, [:int, :int], RenderTexture2D.by_value

  # Check if a texture is ready
  attach_function :is_texture_ready, :IsTextureReady, [Texture2D.by_value], :bool

  # Unload texture from GPU memory (VRAM)
  attach_function :unload_texture, :UnloadTexture, [Texture2D.by_value], :void

  # Check if a render texture is ready
  attach_function :is_render_texture_ready, :IsRenderTextureReady, [RenderTexture2D.by_value], :bool

  # Unload render texture from GPU memory (VRAM)
  attach_function :unload_render_texture, :UnloadRenderTexture, [RenderTexture2D.by_value], :void

  # Update GPU texture with new data
  attach_function :update_texture, :UpdateTexture, [Texture2D.by_value, :pointer], :void

  # Update GPU texture rectangle with new data
  attach_function :update_texture_rec, :UpdateTextureRec, [Texture2D.by_value, Rectangle.by_value, :pointer], :void

  # Generate GPU mipmaps for a texture
  attach_function :gen_texture_mipmaps, :GenTextureMipmaps, [:pointer], :void

  # Set texture scaling filter mode
  attach_function :set_texture_filter, :SetTextureFilter, [Texture2D.by_value, :int], :void

  # Set texture wrapping mode
  attach_function :set_texture_wrap, :SetTextureWrap, [Texture2D.by_value, :int], :void

  # Draw a Texture2D
  attach_function :draw_texture, :DrawTexture, [Texture2D.by_value, :int, :int, Color.by_value], :void

  # Draw a Texture2D with position defined as Vector2
  attach_function :draw_texture_v, :DrawTextureV, [Texture2D.by_value, Vector2.by_value, Color.by_value], :void

  # Draw a Texture2D with extended parameters
  attach_function :draw_texture_ex, :DrawTextureEx, [Texture2D.by_value, Vector2.by_value, :float, :float, Color.by_value], :void

  # Draw a part of a texture defined by a rectangle
  attach_function :draw_texture_rec, :DrawTextureRec, [Texture2D.by_value, Rectangle.by_value, Vector2.by_value, Color.by_value], :void

  # Draw a part of a texture defined by a rectangle with 'pro' parameters
  attach_function :draw_texture_pro, :DrawTexturePro, [Texture2D.by_value, Rectangle.by_value, Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void

  # Draws a texture (or part of it) that stretches or shrinks nicely
  attach_function :draw_texture_n_patch, :DrawTextureNPatch, [Texture2D.by_value, NPatchInfo.by_value, Rectangle.by_value, Vector2.by_value, :float, Color.by_value], :void

  # Get color with alpha applied, alpha goes from 0.0f to 1.0f
  attach_function :fade, :Fade, [Color.by_value, :float], Color.by_value

  # Get hexadecimal value for a Color
  attach_function :color_to_int, :ColorToInt, [Color.by_value], :int

  # Get Color normalized as float [0..1]
  attach_function :color_normalize, :ColorNormalize, [Color.by_value], Vector4.by_value

  # Get Color from normalized values [0..1]
  attach_function :color_from_normalized, :ColorFromNormalized, [Vector4.by_value], Color.by_value

  # Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  attach_function :color_to_hsv, :ColorToHSV, [Color.by_value], Vector3.by_value

  # Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  attach_function :color_from_hsv, :ColorFromHSV, [:float, :float, :float], Color.by_value

  # Get color multiplied with another color
  attach_function :color_tint, :ColorTint, [Color.by_value, Color.by_value], Color.by_value

  # Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
  attach_function :color_brightness, :ColorBrightness, [Color.by_value, :float], Color.by_value

  # Get color with contrast correction, contrast values between -1.0f and 1.0f
  attach_function :color_contrast, :ColorContrast, [Color.by_value, :float], Color.by_value

  # Get color with alpha applied, alpha goes from 0.0f to 1.0f
  attach_function :color_alpha, :ColorAlpha, [Color.by_value, :float], Color.by_value

  # Get src alpha-blended into dst color with tint
  attach_function :color_alpha_blend, :ColorAlphaBlend, [Color.by_value, Color.by_value, Color.by_value], Color.by_value

  # Get Color structure from hexadecimal value
  attach_function :get_color, :GetColor, [:uint], Color.by_value

  # Get Color from a source pixel pointer of certain format
  attach_function :get_pixel_color, :GetPixelColor, [:pointer, :int], Color.by_value

  # Set color formatted into destination pixel pointer
  attach_function :set_pixel_color, :SetPixelColor, [:pointer, Color.by_value, :int], :void

  # Get pixel data size in bytes for certain format
  attach_function :get_pixel_data_size, :GetPixelDataSize, [:int, :int, :int], :int

  # Get the default Font
  attach_function :get_font_default, :GetFontDefault, [], Font.by_value

  # Load font from file into GPU memory (VRAM)
  attach_function :load_font, :LoadFont, [:pointer], Font.by_value

  # Load font from file with extended parameters, use NULL for fontChars and 0 for glyphCount to load the default character set
  attach_function :load_font_ex, :LoadFontEx, [:pointer, :int, :pointer, :int], Font.by_value

  # Load font from Image (XNA style)
  attach_function :load_font_from_image, :LoadFontFromImage, [Image.by_value, Color.by_value, :int], Font.by_value

  # Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  attach_function :load_font_from_memory, :LoadFontFromMemory, [:pointer, :pointer, :int, :int, :pointer, :int], Font.by_value

  # Check if a font is ready
  attach_function :is_font_ready, :IsFontReady, [Font.by_value], :bool

  # Load font data for further use
  attach_function :load_font_data, :LoadFontData, [:pointer, :int, :int, :pointer, :int, :int], :pointer

  # Generate image font atlas using chars info
  attach_function :gen_image_font_atlas, :GenImageFontAtlas, [:pointer, :pointer, :int, :int, :int, :int], Image.by_value

  # Unload font chars info data (RAM)
  attach_function :unload_font_data, :UnloadFontData, [:pointer, :int], :void

  # Unload font from GPU memory (VRAM)
  attach_function :unload_font, :UnloadFont, [Font.by_value], :void

  # Export font as code file, returns true on success
  attach_function :export_font_as_code, :ExportFontAsCode, [Font.by_value, :pointer], :bool

  # Draw current FPS
  attach_function :draw_fps, :DrawFPS, [:int, :int], :void

  # Draw text (using default font)
  attach_function :draw_text, :DrawText, [:pointer, :int, :int, :int, Color.by_value], :void

  # Draw text using font and additional parameters
  attach_function :draw_text_ex, :DrawTextEx, [Font.by_value, :pointer, Vector2.by_value, :float, :float, Color.by_value], :void

  # Draw text using Font and pro parameters (rotation)
  attach_function :draw_text_pro, :DrawTextPro, [Font.by_value, :pointer, Vector2.by_value, Vector2.by_value, :float, :float, :float, Color.by_value], :void

  # Draw one character (codepoint)
  attach_function :draw_text_codepoint, :DrawTextCodepoint, [Font.by_value, :int, Vector2.by_value, :float, Color.by_value], :void

  # Draw multiple character (codepoint)
  attach_function :draw_text_codepoints, :DrawTextCodepoints, [Font.by_value, :pointer, :int, Vector2.by_value, :float, :float, Color.by_value], :void

  # Measure string width for default font
  attach_function :measure_text, :MeasureText, [:pointer, :int], :int

  # Measure string size for Font
  attach_function :measure_text_ex, :MeasureTextEx, [Font.by_value, :pointer, :float, :float], Vector2.by_value

  # Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  attach_function :get_glyph_index, :GetGlyphIndex, [Font.by_value, :int], :int

  # Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  attach_function :get_glyph_info, :GetGlyphInfo, [Font.by_value, :int], GlyphInfo.by_value

  # Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  attach_function :get_glyph_atlas_rec, :GetGlyphAtlasRec, [Font.by_value, :int], Rectangle.by_value

  # Load UTF-8 text encoded from codepoints array
  attach_function :load_utf8, :LoadUTF8, [:pointer, :int], :pointer

  # Unload UTF-8 text encoded from codepoints array
  attach_function :unload_utf8, :UnloadUTF8, [:pointer], :void

  # Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  attach_function :load_codepoints, :LoadCodepoints, [:pointer, :pointer], :pointer

  # Unload codepoints data from memory
  attach_function :unload_codepoints, :UnloadCodepoints, [:pointer], :void

  # Get total number of codepoints in a UTF-8 encoded string
  attach_function :get_codepoint_count, :GetCodepointCount, [:pointer], :int

  # Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  attach_function :get_codepoint, :GetCodepoint, [:pointer, :pointer], :int

  # Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  attach_function :get_codepoint_next, :GetCodepointNext, [:pointer, :pointer], :int

  # Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  attach_function :get_codepoint_previous, :GetCodepointPrevious, [:pointer, :pointer], :int

  # Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  attach_function :codepoint_to_utf8, :CodepointToUTF8, [:int, :pointer], :pointer

  # Copy one string to another, returns bytes copied
  attach_function :text_copy, :TextCopy, [:pointer, :pointer], :int

  # Check if two text string are equal
  attach_function :text_is_equal, :TextIsEqual, [:pointer, :pointer], :bool

  # Get text length, checks for '\0' ending
  attach_function :text_length, :TextLength, [:pointer], :uint

  # Text formatting with variables (sprintf() style)
  attach_function :text_format, :TextFormat, [:pointer, :varargs], :pointer

  # Get a piece of a text string
  attach_function :text_subtext, :TextSubtext, [:pointer, :int, :int], :pointer

  # Replace text string (WARNING: memory must be freed!)
  attach_function :text_replace, :TextReplace, [:pointer, :pointer, :pointer], :pointer

  # Insert text in a position (WARNING: memory must be freed!)
  attach_function :text_insert, :TextInsert, [:pointer, :pointer, :int], :pointer

  # Join text strings with delimiter
  attach_function :text_join, :TextJoin, [:pointer, :int, :pointer], :pointer

  # Split text into multiple strings
  attach_function :text_split, :TextSplit, [:pointer, :char, :pointer], :pointer

  # Append text at specific position and move cursor!
  attach_function :text_append, :TextAppend, [:pointer, :pointer, :pointer], :void

  # Find first text occurrence within a string
  attach_function :text_find_index, :TextFindIndex, [:pointer, :pointer], :int

  # Get upper case version of provided string
  attach_function :text_to_upper, :TextToUpper, [:pointer], :pointer

  # Get lower case version of provided string
  attach_function :text_to_lower, :TextToLower, [:pointer], :pointer

  # Get Pascal case notation version of provided string
  attach_function :text_to_pascal, :TextToPascal, [:pointer], :pointer

  # Get integer value from text (negative values not supported)
  attach_function :text_to_integer, :TextToInteger, [:pointer], :int

  # Draw a line in 3D world space
  attach_function :draw_line3_d, :DrawLine3D, [Vector3.by_value, Vector3.by_value, Color.by_value], :void

  # Draw a point in 3D space, actually a small line
  attach_function :draw_point3_d, :DrawPoint3D, [Vector3.by_value, Color.by_value], :void

  # Draw a circle in 3D world space
  attach_function :draw_circle3_d, :DrawCircle3D, [Vector3.by_value, :float, Vector3.by_value, :float, Color.by_value], :void

  # Draw a color-filled triangle (vertex in counter-clockwise order!)
  attach_function :draw_triangle3_d, :DrawTriangle3D, [Vector3.by_value, Vector3.by_value, Vector3.by_value, Color.by_value], :void

  # Draw a triangle strip defined by points
  attach_function :draw_triangle_strip3_d, :DrawTriangleStrip3D, [:pointer, :int, Color.by_value], :void

  # Draw cube
  attach_function :draw_cube, :DrawCube, [Vector3.by_value, :float, :float, :float, Color.by_value], :void

  # Draw cube (Vector version)
  attach_function :draw_cube_v, :DrawCubeV, [Vector3.by_value, Vector3.by_value, Color.by_value], :void

  # Draw cube wires
  attach_function :draw_cube_wires, :DrawCubeWires, [Vector3.by_value, :float, :float, :float, Color.by_value], :void

  # Draw cube wires (Vector version)
  attach_function :draw_cube_wires_v, :DrawCubeWiresV, [Vector3.by_value, Vector3.by_value, Color.by_value], :void

  # Draw sphere
  attach_function :draw_sphere, :DrawSphere, [Vector3.by_value, :float, Color.by_value], :void

  # Draw sphere with extended parameters
  attach_function :draw_sphere_ex, :DrawSphereEx, [Vector3.by_value, :float, :int, :int, Color.by_value], :void

  # Draw sphere wires
  attach_function :draw_sphere_wires, :DrawSphereWires, [Vector3.by_value, :float, :int, :int, Color.by_value], :void

  # Draw a cylinder/cone
  attach_function :draw_cylinder, :DrawCylinder, [Vector3.by_value, :float, :float, :float, :int, Color.by_value], :void

  # Draw a cylinder with base at startPos and top at endPos
  attach_function :draw_cylinder_ex, :DrawCylinderEx, [Vector3.by_value, Vector3.by_value, :float, :float, :int, Color.by_value], :void

  # Draw a cylinder/cone wires
  attach_function :draw_cylinder_wires, :DrawCylinderWires, [Vector3.by_value, :float, :float, :float, :int, Color.by_value], :void

  # Draw a cylinder wires with base at startPos and top at endPos
  attach_function :draw_cylinder_wires_ex, :DrawCylinderWiresEx, [Vector3.by_value, Vector3.by_value, :float, :float, :int, Color.by_value], :void

  # Draw a capsule with the center of its sphere caps at startPos and endPos
  attach_function :draw_capsule, :DrawCapsule, [Vector3.by_value, Vector3.by_value, :float, :int, :int, Color.by_value], :void

  # Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  attach_function :draw_capsule_wires, :DrawCapsuleWires, [Vector3.by_value, Vector3.by_value, :float, :int, :int, Color.by_value], :void

  # Draw a plane XZ
  attach_function :draw_plane, :DrawPlane, [Vector3.by_value, Vector2.by_value, Color.by_value], :void

  # Draw a ray line
  attach_function :draw_ray, :DrawRay, [Ray.by_value, Color.by_value], :void

  # Draw a grid (centered at (0, 0, 0))
  attach_function :draw_grid, :DrawGrid, [:int, :float], :void

  # Load model from files (meshes and materials)
  attach_function :load_model, :LoadModel, [:pointer], Model.by_value

  # Load model from generated mesh (default material)
  attach_function :load_model_from_mesh, :LoadModelFromMesh, [Mesh.by_value], Model.by_value

  # Check if a model is ready
  attach_function :is_model_ready, :IsModelReady, [Model.by_value], :bool

  # Unload model (including meshes) from memory (RAM and/or VRAM)
  attach_function :unload_model, :UnloadModel, [Model.by_value], :void

  # Compute model bounding box limits (considers all meshes)
  attach_function :get_model_bounding_box, :GetModelBoundingBox, [Model.by_value], BoundingBox.by_value

  # Draw a model (with texture if set)
  attach_function :draw_model, :DrawModel, [Model.by_value, Vector3.by_value, :float, Color.by_value], :void

  # Draw a model with extended parameters
  attach_function :draw_model_ex, :DrawModelEx, [Model.by_value, Vector3.by_value, Vector3.by_value, :float, Vector3.by_value, Color.by_value], :void

  # Draw a model wires (with texture if set)
  attach_function :draw_model_wires, :DrawModelWires, [Model.by_value, Vector3.by_value, :float, Color.by_value], :void

  # Draw a model wires (with texture if set) with extended parameters
  attach_function :draw_model_wires_ex, :DrawModelWiresEx, [Model.by_value, Vector3.by_value, Vector3.by_value, :float, Vector3.by_value, Color.by_value], :void

  # Draw bounding box (wires)
  attach_function :draw_bounding_box, :DrawBoundingBox, [BoundingBox.by_value, Color.by_value], :void

  # Draw a billboard texture
  attach_function :draw_billboard, :DrawBillboard, [Camera.by_value, Texture2D.by_value, Vector3.by_value, :float, Color.by_value], :void

  # Draw a billboard texture defined by source
  attach_function :draw_billboard_rec, :DrawBillboardRec, [Camera.by_value, Texture2D.by_value, Rectangle.by_value, Vector3.by_value, Vector2.by_value, Color.by_value], :void

  # Draw a billboard texture defined by source and rotation
  attach_function :draw_billboard_pro, :DrawBillboardPro, [Camera.by_value, Texture2D.by_value, Rectangle.by_value, Vector3.by_value, Vector3.by_value, Vector2.by_value, Vector2.by_value, :float, Color.by_value], :void

  # Upload mesh vertex data in GPU and provide VAO/VBO ids
  attach_function :upload_mesh, :UploadMesh, [:pointer, :bool], :void

  # Update mesh vertex data in GPU for a specific buffer index
  attach_function :update_mesh_buffer, :UpdateMeshBuffer, [Mesh.by_value, :int, :pointer, :int, :int], :void

  # Unload mesh data from CPU and GPU
  attach_function :unload_mesh, :UnloadMesh, [Mesh.by_value], :void

  # Draw a 3d mesh with material and transform
  attach_function :draw_mesh, :DrawMesh, [Mesh.by_value, Material.by_value, Matrix.by_value], :void

  # Draw multiple mesh instances with material and different transforms
  attach_function :draw_mesh_instanced, :DrawMeshInstanced, [Mesh.by_value, Material.by_value, :pointer, :int], :void

  # Export mesh data to file, returns true on success
  attach_function :export_mesh, :ExportMesh, [Mesh.by_value, :pointer], :bool

  # Compute mesh bounding box limits
  attach_function :get_mesh_bounding_box, :GetMeshBoundingBox, [Mesh.by_value], BoundingBox.by_value

  # Compute mesh tangents
  attach_function :gen_mesh_tangents, :GenMeshTangents, [:pointer], :void

  # Generate polygonal mesh
  attach_function :gen_mesh_poly, :GenMeshPoly, [:int, :float], Mesh.by_value

  # Generate plane mesh (with subdivisions)
  attach_function :gen_mesh_plane, :GenMeshPlane, [:float, :float, :int, :int], Mesh.by_value

  # Generate cuboid mesh
  attach_function :gen_mesh_cube, :GenMeshCube, [:float, :float, :float], Mesh.by_value

  # Generate sphere mesh (standard sphere)
  attach_function :gen_mesh_sphere, :GenMeshSphere, [:float, :int, :int], Mesh.by_value

  # Generate half-sphere mesh (no bottom cap)
  attach_function :gen_mesh_hemi_sphere, :GenMeshHemiSphere, [:float, :int, :int], Mesh.by_value

  # Generate cylinder mesh
  attach_function :gen_mesh_cylinder, :GenMeshCylinder, [:float, :float, :int], Mesh.by_value

  # Generate cone/pyramid mesh
  attach_function :gen_mesh_cone, :GenMeshCone, [:float, :float, :int], Mesh.by_value

  # Generate torus mesh
  attach_function :gen_mesh_torus, :GenMeshTorus, [:float, :float, :int, :int], Mesh.by_value

  # Generate trefoil knot mesh
  attach_function :gen_mesh_knot, :GenMeshKnot, [:float, :float, :int, :int], Mesh.by_value

  # Generate heightmap mesh from image data
  attach_function :gen_mesh_heightmap, :GenMeshHeightmap, [Image.by_value, Vector3.by_value], Mesh.by_value

  # Generate cubes-based map mesh from image data
  attach_function :gen_mesh_cubicmap, :GenMeshCubicmap, [Image.by_value, Vector3.by_value], Mesh.by_value

  # Load materials from model file
  attach_function :load_materials, :LoadMaterials, [:pointer, :pointer], :pointer

  # Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  attach_function :load_material_default, :LoadMaterialDefault, [], Material.by_value

  # Check if a material is ready
  attach_function :is_material_ready, :IsMaterialReady, [Material.by_value], :bool

  # Unload material from GPU memory (VRAM)
  attach_function :unload_material, :UnloadMaterial, [Material.by_value], :void

  # Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  attach_function :set_material_texture, :SetMaterialTexture, [:pointer, :int, Texture2D.by_value], :void

  # Set material for a mesh
  attach_function :set_model_mesh_material, :SetModelMeshMaterial, [:pointer, :int, :int], :void

  # Load model animations from file
  attach_function :load_model_animations, :LoadModelAnimations, [:pointer, :pointer], :pointer

  # Update model animation pose
  attach_function :update_model_animation, :UpdateModelAnimation, [Model.by_value, ModelAnimation.by_value, :int], :void

  # Unload animation data
  attach_function :unload_model_animation, :UnloadModelAnimation, [ModelAnimation.by_value], :void

  # Unload animation array data
  attach_function :unload_model_animations, :UnloadModelAnimations, [:pointer, :uint], :void

  # Check model animation skeleton match
  attach_function :is_model_animation_valid, :IsModelAnimationValid, [Model.by_value, ModelAnimation.by_value], :bool

  # Check collision between two spheres
  attach_function :check_collision_spheres, :CheckCollisionSpheres, [Vector3.by_value, :float, Vector3.by_value, :float], :bool

  # Check collision between two bounding boxes
  attach_function :check_collision_boxes, :CheckCollisionBoxes, [BoundingBox.by_value, BoundingBox.by_value], :bool

  # Check collision between box and sphere
  attach_function :check_collision_box_sphere, :CheckCollisionBoxSphere, [BoundingBox.by_value, Vector3.by_value, :float], :bool

  # Get collision info between ray and sphere
  attach_function :get_ray_collision_sphere, :GetRayCollisionSphere, [Ray.by_value, Vector3.by_value, :float], RayCollision.by_value

  # Get collision info between ray and box
  attach_function :get_ray_collision_box, :GetRayCollisionBox, [Ray.by_value, BoundingBox.by_value], RayCollision.by_value

  # Get collision info between ray and mesh
  attach_function :get_ray_collision_mesh, :GetRayCollisionMesh, [Ray.by_value, Mesh.by_value, Matrix.by_value], RayCollision.by_value

  # Get collision info between ray and triangle
  attach_function :get_ray_collision_triangle, :GetRayCollisionTriangle, [Ray.by_value, Vector3.by_value, Vector3.by_value, Vector3.by_value], RayCollision.by_value

  # Get collision info between ray and quad
  attach_function :get_ray_collision_quad, :GetRayCollisionQuad, [Ray.by_value, Vector3.by_value, Vector3.by_value, Vector3.by_value, Vector3.by_value], RayCollision.by_value

  # Initialize audio device and context
  attach_function :init_audio_device, :InitAudioDevice, [], :void

  # Close the audio device and context
  attach_function :close_audio_device, :CloseAudioDevice, [], :void

  # Check if audio device has been initialized successfully
  attach_function :is_audio_device_ready, :IsAudioDeviceReady, [], :bool

  # Set master volume (listener)
  attach_function :set_master_volume, :SetMasterVolume, [:float], :void

  # Load wave data from file
  attach_function :load_wave, :LoadWave, [:pointer], Wave.by_value

  # Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  attach_function :load_wave_from_memory, :LoadWaveFromMemory, [:pointer, :pointer, :int], Wave.by_value

  # Checks if wave data is ready
  attach_function :is_wave_ready, :IsWaveReady, [Wave.by_value], :bool

  # Load sound from file
  attach_function :load_sound, :LoadSound, [:pointer], Sound.by_value

  # Load sound from wave data
  attach_function :load_sound_from_wave, :LoadSoundFromWave, [Wave.by_value], Sound.by_value

  # Checks if a sound is ready
  attach_function :is_sound_ready, :IsSoundReady, [Sound.by_value], :bool

  # Update sound buffer with new data
  attach_function :update_sound, :UpdateSound, [Sound.by_value, :pointer, :int], :void

  # Unload wave data
  attach_function :unload_wave, :UnloadWave, [Wave.by_value], :void

  # Unload sound
  attach_function :unload_sound, :UnloadSound, [Sound.by_value], :void

  # Export wave data to file, returns true on success
  attach_function :export_wave, :ExportWave, [Wave.by_value, :pointer], :bool

  # Export wave sample data to code (.h), returns true on success
  attach_function :export_wave_as_code, :ExportWaveAsCode, [Wave.by_value, :pointer], :bool

  # Play a sound
  attach_function :play_sound, :PlaySound, [Sound.by_value], :void

  # Stop playing a sound
  attach_function :stop_sound, :StopSound, [Sound.by_value], :void

  # Pause a sound
  attach_function :pause_sound, :PauseSound, [Sound.by_value], :void

  # Resume a paused sound
  attach_function :resume_sound, :ResumeSound, [Sound.by_value], :void

  # Check if a sound is currently playing
  attach_function :is_sound_playing, :IsSoundPlaying, [Sound.by_value], :bool

  # Set volume for a sound (1.0 is max level)
  attach_function :set_sound_volume, :SetSoundVolume, [Sound.by_value, :float], :void

  # Set pitch for a sound (1.0 is base level)
  attach_function :set_sound_pitch, :SetSoundPitch, [Sound.by_value, :float], :void

  # Set pan for a sound (0.5 is center)
  attach_function :set_sound_pan, :SetSoundPan, [Sound.by_value, :float], :void

  # Copy a wave to a new wave
  attach_function :wave_copy, :WaveCopy, [Wave.by_value], Wave.by_value

  # Crop a wave to defined samples range
  attach_function :wave_crop, :WaveCrop, [:pointer, :int, :int], :void

  # Convert wave data to desired format
  attach_function :wave_format, :WaveFormat, [:pointer, :int, :int, :int], :void

  # Load samples data from wave as a 32bit float data array
  attach_function :load_wave_samples, :LoadWaveSamples, [Wave.by_value], :pointer

  # Unload samples data loaded with LoadWaveSamples()
  attach_function :unload_wave_samples, :UnloadWaveSamples, [:pointer], :void

  # Load music stream from file
  attach_function :load_music_stream, :LoadMusicStream, [:pointer], Music.by_value

  # Load music stream from data
  attach_function :load_music_stream_from_memory, :LoadMusicStreamFromMemory, [:pointer, :pointer, :int], Music.by_value

  # Checks if a music stream is ready
  attach_function :is_music_ready, :IsMusicReady, [Music.by_value], :bool

  # Unload music stream
  attach_function :unload_music_stream, :UnloadMusicStream, [Music.by_value], :void

  # Start music playing
  attach_function :play_music_stream, :PlayMusicStream, [Music.by_value], :void

  # Check if music is playing
  attach_function :is_music_stream_playing, :IsMusicStreamPlaying, [Music.by_value], :bool

  # Updates buffers for music streaming
  attach_function :update_music_stream, :UpdateMusicStream, [Music.by_value], :void

  # Stop music playing
  attach_function :stop_music_stream, :StopMusicStream, [Music.by_value], :void

  # Pause music playing
  attach_function :pause_music_stream, :PauseMusicStream, [Music.by_value], :void

  # Resume playing paused music
  attach_function :resume_music_stream, :ResumeMusicStream, [Music.by_value], :void

  # Seek music to a position (in seconds)
  attach_function :seek_music_stream, :SeekMusicStream, [Music.by_value, :float], :void

  # Set volume for music (1.0 is max level)
  attach_function :set_music_volume, :SetMusicVolume, [Music.by_value, :float], :void

  # Set pitch for a music (1.0 is base level)
  attach_function :set_music_pitch, :SetMusicPitch, [Music.by_value, :float], :void

  # Set pan for a music (0.5 is center)
  attach_function :set_music_pan, :SetMusicPan, [Music.by_value, :float], :void

  # Get music time length (in seconds)
  attach_function :get_music_time_length, :GetMusicTimeLength, [Music.by_value], :float

  # Get current music time played (in seconds)
  attach_function :get_music_time_played, :GetMusicTimePlayed, [Music.by_value], :float

  # Load audio stream (to stream raw audio pcm data)
  attach_function :load_audio_stream, :LoadAudioStream, [:uint, :uint, :uint], AudioStream.by_value

  # Checks if an audio stream is ready
  attach_function :is_audio_stream_ready, :IsAudioStreamReady, [AudioStream.by_value], :bool

  # Unload audio stream and free memory
  attach_function :unload_audio_stream, :UnloadAudioStream, [AudioStream.by_value], :void

  # Update audio stream buffers with data
  attach_function :update_audio_stream, :UpdateAudioStream, [AudioStream.by_value, :pointer, :int], :void

  # Check if any audio stream buffers requires refill
  attach_function :is_audio_stream_processed, :IsAudioStreamProcessed, [AudioStream.by_value], :bool

  # Play audio stream
  attach_function :play_audio_stream, :PlayAudioStream, [AudioStream.by_value], :void

  # Pause audio stream
  attach_function :pause_audio_stream, :PauseAudioStream, [AudioStream.by_value], :void

  # Resume audio stream
  attach_function :resume_audio_stream, :ResumeAudioStream, [AudioStream.by_value], :void

  # Check if audio stream is playing
  attach_function :is_audio_stream_playing, :IsAudioStreamPlaying, [AudioStream.by_value], :bool

  # Stop audio stream
  attach_function :stop_audio_stream, :StopAudioStream, [AudioStream.by_value], :void

  # Set volume for audio stream (1.0 is max level)
  attach_function :set_audio_stream_volume, :SetAudioStreamVolume, [AudioStream.by_value, :float], :void

  # Set pitch for audio stream (1.0 is base level)
  attach_function :set_audio_stream_pitch, :SetAudioStreamPitch, [AudioStream.by_value, :float], :void

  # Set pan for audio stream (0.5 is centered)
  attach_function :set_audio_stream_pan, :SetAudioStreamPan, [AudioStream.by_value, :float], :void

  # Default size for new audio streams
  attach_function :set_audio_stream_buffer_size_default, :SetAudioStreamBufferSizeDefault, [:int], :void

  # Audio thread callback to request new data
  attach_function :set_audio_stream_callback, :SetAudioStreamCallback, [AudioStream.by_value, :AudioCallback], :void

  # Attach audio stream processor to stream
  attach_function :attach_audio_stream_processor, :AttachAudioStreamProcessor, [AudioStream.by_value, :AudioCallback], :void

  # Detach audio stream processor from stream
  attach_function :detach_audio_stream_processor, :DetachAudioStreamProcessor, [AudioStream.by_value, :AudioCallback], :void

  # Attach audio stream processor to the entire audio pipeline
  attach_function :attach_audio_mixed_processor, :AttachAudioMixedProcessor, [:AudioCallback], :void

  # Detach audio stream processor from the entire audio pipeline
  attach_function :detach_audio_mixed_processor, :DetachAudioMixedProcessor, [:AudioCallback], :void
end
