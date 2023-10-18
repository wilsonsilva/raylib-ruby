module Raylib
  # Choose the current matrix to be transformed
  attach_function :rl_matrix_mode, :rlMatrixMode, [:int], :void

  # Push the current matrix to stack
  attach_function :rl_push_matrix, :rlPushMatrix, [], :void

  # Pop latest inserted matrix from stack
  attach_function :rl_pop_matrix, :rlPopMatrix, [], :void

  # Reset current matrix to identity matrix
  attach_function :rl_load_identity, :rlLoadIdentity, [], :void

  # Multiply the current matrix by a translation matrix
  attach_function :rl_translatef, :rlTranslatef, [:float, :float, :float], :void

  # Multiply the current matrix by a rotation matrix
  attach_function :rl_rotatef, :rlRotatef, [:float, :float, :float, :float], :void

  # Multiply the current matrix by a scaling matrix
  attach_function :rl_scalef, :rlScalef, [:float, :float, :float], :void

  # Multiply the current matrix by another matrix
  attach_function :rl_mult_matrixf, :rlMultMatrixf, [:pointer], :void

  # TODO
  attach_function :rl_frustum, :rlFrustum, [:double, :double, :double, :double, :double, :double], :void

  # TODO
  attach_function :rl_ortho, :rlOrtho, [:double, :double, :double, :double, :double, :double], :void

  # Set the viewport area
  attach_function :rl_viewport, :rlViewport, [:int, :int, :int, :int], :void

  # Initialize drawing mode (how to organize vertex)
  attach_function :rl_begin, :rlBegin, [:int], :void

  # Finish vertex providing
  attach_function :rl_end, :rlEnd, [], :void

  # Define one vertex (position) - 2 int
  attach_function :rl_vertex2i, :rlVertex2i, [:int, :int], :void

  # Define one vertex (position) - 2 float
  attach_function :rl_vertex2f, :rlVertex2f, [:float, :float], :void

  # Define one vertex (position) - 3 float
  attach_function :rl_vertex3f, :rlVertex3f, [:float, :float, :float], :void

  # Define one vertex (texture coordinate) - 2 float
  attach_function :rl_tex_coord2f, :rlTexCoord2f, [:float, :float], :void

  # Define one vertex (normal) - 3 float
  attach_function :rl_normal3f, :rlNormal3f, [:float, :float, :float], :void

  # Define one vertex (color) - 4 byte
  attach_function :rl_color4ub, :rlColor4ub, [:uchar, :uchar, :uchar, :uchar], :void

  # Define one vertex (color) - 3 float
  attach_function :rl_color3f, :rlColor3f, [:float, :float, :float], :void

  # Define one vertex (color) - 4 float
  attach_function :rl_color4f, :rlColor4f, [:float, :float, :float, :float], :void

  # Enable vertex array (VAO, if supported)
  attach_function :rl_enable_vertex_array, :rlEnableVertexArray, [:uint], :bool

  # Disable vertex array (VAO, if supported)
  attach_function :rl_disable_vertex_array, :rlDisableVertexArray, [], :void

  # Enable vertex buffer (VBO)
  attach_function :rl_enable_vertex_buffer, :rlEnableVertexBuffer, [:uint], :void

  # Disable vertex buffer (VBO)
  attach_function :rl_disable_vertex_buffer, :rlDisableVertexBuffer, [], :void

  # Enable vertex buffer element (VBO element)
  attach_function :rl_enable_vertex_buffer_element, :rlEnableVertexBufferElement, [:uint], :void

  # Disable vertex buffer element (VBO element)
  attach_function :rl_disable_vertex_buffer_element, :rlDisableVertexBufferElement, [], :void

  # Enable vertex attribute index
  attach_function :rl_enable_vertex_attribute, :rlEnableVertexAttribute, [:uint], :void

  # Disable vertex attribute index
  attach_function :rl_disable_vertex_attribute, :rlDisableVertexAttribute, [:uint], :void

  # Enable attribute state pointer
  # attach_function :rl_enable_state_pointer, :rlEnableStatePointer, [:int, :pointer], :void

  # Disable attribute state pointer
  # attach_function :rl_disable_state_pointer, :rlDisableStatePointer, [:int], :void

  # Select and active a texture slot
  attach_function :rl_active_texture_slot, :rlActiveTextureSlot, [:int], :void

  # Enable texture
  attach_function :rl_enable_texture, :rlEnableTexture, [:uint], :void

  # Disable texture
  attach_function :rl_disable_texture, :rlDisableTexture, [], :void

  # Enable texture cubemap
  attach_function :rl_enable_texture_cubemap, :rlEnableTextureCubemap, [:uint], :void

  # Disable texture cubemap
  attach_function :rl_disable_texture_cubemap, :rlDisableTextureCubemap, [], :void

  # Set texture parameters (filter, wrap)
  attach_function :rl_texture_parameters, :rlTextureParameters, [:uint, :int, :int], :void

  # Set cubemap parameters (filter, wrap)
  attach_function :rl_cubemap_parameters, :rlCubemapParameters, [:uint, :int, :int], :void

  # Enable shader program
  attach_function :rl_enable_shader, :rlEnableShader, [:uint], :void

  # Disable shader program
  attach_function :rl_disable_shader, :rlDisableShader, [], :void

  # Enable render texture (fbo)
  attach_function :rl_enable_framebuffer, :rlEnableFramebuffer, [:uint], :void

  # Disable render texture (fbo), return to default framebuffer
  attach_function :rl_disable_framebuffer, :rlDisableFramebuffer, [], :void

  # Activate multiple draw color buffers
  attach_function :rl_active_draw_buffers, :rlActiveDrawBuffers, [:int], :void

  # Enable color blending
  attach_function :rl_enable_color_blend, :rlEnableColorBlend, [], :void

  # Disable color blending
  attach_function :rl_disable_color_blend, :rlDisableColorBlend, [], :void

  # Enable depth test
  attach_function :rl_enable_depth_test, :rlEnableDepthTest, [], :void

  # Disable depth test
  attach_function :rl_disable_depth_test, :rlDisableDepthTest, [], :void

  # Enable depth write
  attach_function :rl_enable_depth_mask, :rlEnableDepthMask, [], :void

  # Disable depth write
  attach_function :rl_disable_depth_mask, :rlDisableDepthMask, [], :void

  # Enable backface culling
  attach_function :rl_enable_backface_culling, :rlEnableBackfaceCulling, [], :void

  # Disable backface culling
  attach_function :rl_disable_backface_culling, :rlDisableBackfaceCulling, [], :void

  # Set face culling mode
  attach_function :rl_set_cull_face, :rlSetCullFace, [:int], :void

  # Enable scissor test
  attach_function :rl_enable_scissor_test, :rlEnableScissorTest, [], :void

  # Disable scissor test
  attach_function :rl_disable_scissor_test, :rlDisableScissorTest, [], :void

  # Scissor test
  attach_function :rl_scissor, :rlScissor, [:int, :int, :int, :int], :void

  # Enable wire mode
  attach_function :rl_enable_wire_mode, :rlEnableWireMode, [], :void

  # Disable wire mode
  attach_function :rl_disable_wire_mode, :rlDisableWireMode, [], :void

  # Set the line drawing width
  attach_function :rl_set_line_width, :rlSetLineWidth, [:float], :void

  # Get the line drawing width
  attach_function :rl_get_line_width, :rlGetLineWidth, [], :float

  # Enable line aliasing
  attach_function :rl_enable_smooth_lines, :rlEnableSmoothLines, [], :void

  # Disable line aliasing
  attach_function :rl_disable_smooth_lines, :rlDisableSmoothLines, [], :void

  # Enable stereo rendering
  attach_function :rl_enable_stereo_render, :rlEnableStereoRender, [], :void

  # Disable stereo rendering
  attach_function :rl_disable_stereo_render, :rlDisableStereoRender, [], :void

  # Check if stereo render is enabled
  attach_function :rl_is_stereo_render_enabled, :rlIsStereoRenderEnabled, [], :bool

  # Clear color buffer with color
  attach_function :rl_clear_color, :rlClearColor, [:uchar, :uchar, :uchar, :uchar], :void

  # Clear used screen buffers (color and depth)
  attach_function :rl_clear_screen_buffers, :rlClearScreenBuffers, [], :void

  # Check and log OpenGL error codes
  attach_function :rl_check_errors, :rlCheckErrors, [], :void

  # Set blending mode
  attach_function :rl_set_blend_mode, :rlSetBlendMode, [:int], :void

  # Set blending mode factor and equation (using OpenGL factors)
  attach_function :rl_set_blend_factors, :rlSetBlendFactors, [:int, :int, :int], :void

  # Set blending mode factors and equations separately (using OpenGL factors)
  attach_function :rl_set_blend_factors_separate, :rlSetBlendFactorsSeparate, [:int, :int, :int, :int, :int, :int], :void

  # Initialize rlgl (buffers, shaders, textures, states)
  attach_function :rlgl_init, :rlglInit, [:int, :int], :void

  # De-initialize rlgl (buffers, shaders, textures)
  attach_function :rlgl_close, :rlglClose, [], :void

  # Load OpenGL extensions (loader function required)
  attach_function :rl_load_extensions, :rlLoadExtensions, [:pointer], :void

  # Get current OpenGL version
  attach_function :rl_get_version, :rlGetVersion, [], :int

  # Set current framebuffer width
  attach_function :rl_set_framebuffer_width, :rlSetFramebufferWidth, [:int], :void

  # Get default framebuffer width
  attach_function :rl_get_framebuffer_width, :rlGetFramebufferWidth, [], :int

  # Set current framebuffer height
  attach_function :rl_set_framebuffer_height, :rlSetFramebufferHeight, [:int], :void

  # Get default framebuffer height
  attach_function :rl_get_framebuffer_height, :rlGetFramebufferHeight, [], :int

  # Get default texture id
  attach_function :rl_get_texture_id_default, :rlGetTextureIdDefault, [], :uint

  # Get default shader id
  attach_function :rl_get_shader_id_default, :rlGetShaderIdDefault, [], :uint

  # Get default shader locations
  attach_function :rl_get_shader_locs_default, :rlGetShaderLocsDefault, [], :pointer

  # Load a render batch system
  attach_function :rl_load_render_batch, :rlLoadRenderBatch, [:int, :int], RlRenderBatch.by_value

  # Unload render batch system
  attach_function :rl_unload_render_batch, :rlUnloadRenderBatch, [RlRenderBatch.by_value], :void

  # Draw render batch data (Update->Draw->Reset)
  attach_function :rl_draw_render_batch, :rlDrawRenderBatch, [:pointer], :void

  # Set the active render batch for rlgl (NULL for default internal)
  attach_function :rl_set_render_batch_active, :rlSetRenderBatchActive, [:pointer], :void

  # Update and draw internal render batch
  attach_function :rl_draw_render_batch_active, :rlDrawRenderBatchActive, [], :void

  # Check internal buffer overflow for a given number of vertex
  attach_function :rl_check_render_batch_limit, :rlCheckRenderBatchLimit, [:int], :bool

  # Set current texture for render batch and check buffers limits
  attach_function :rl_set_texture, :rlSetTexture, [:uint], :void

  # Load vertex array (vao) if supported
  attach_function :rl_load_vertex_array, :rlLoadVertexArray, [], :uint

  # Load a vertex buffer attribute
  attach_function :rl_load_vertex_buffer, :rlLoadVertexBuffer, [:pointer, :int, :bool], :uint

  # Load a new attributes element buffer
  attach_function :rl_load_vertex_buffer_element, :rlLoadVertexBufferElement, [:pointer, :int, :bool], :uint

  # Update GPU buffer with new data
  attach_function :rl_update_vertex_buffer, :rlUpdateVertexBuffer, [:uint, :pointer, :int, :int], :void

  # Update vertex buffer elements with new data
  attach_function :rl_update_vertex_buffer_elements, :rlUpdateVertexBufferElements, [:uint, :pointer, :int, :int], :void

  # TODO
  attach_function :rl_unload_vertex_array, :rlUnloadVertexArray, [:uint], :void

  # TODO
  attach_function :rl_unload_vertex_buffer, :rlUnloadVertexBuffer, [:uint], :void

  # TODO
  attach_function :rl_set_vertex_attribute, :rlSetVertexAttribute, [:uint, :int, :int, :bool, :int, :pointer], :void

  # TODO
  attach_function :rl_set_vertex_attribute_divisor, :rlSetVertexAttributeDivisor, [:uint, :int], :void

  # Set vertex attribute default value
  attach_function :rl_set_vertex_attribute_default, :rlSetVertexAttributeDefault, [:int, :pointer, :int, :int], :void

  # TODO
  attach_function :rl_draw_vertex_array, :rlDrawVertexArray, [:int, :int], :void

  # TODO
  attach_function :rl_draw_vertex_array_elements, :rlDrawVertexArrayElements, [:int, :int, :pointer], :void

  # TODO
  attach_function :rl_draw_vertex_array_instanced, :rlDrawVertexArrayInstanced, [:int, :int, :int], :void

  # TODO
  attach_function :rl_draw_vertex_array_elements_instanced, :rlDrawVertexArrayElementsInstanced, [:int, :int, :pointer, :int], :void

  # Load texture in GPU
  attach_function :rl_load_texture, :rlLoadTexture, [:pointer, :int, :int, :int, :int], :uint

  # Load depth texture/renderbuffer (to be attached to fbo)
  attach_function :rl_load_texture_depth, :rlLoadTextureDepth, [:int, :int, :bool], :uint

  # Load texture cubemap
  attach_function :rl_load_texture_cubemap, :rlLoadTextureCubemap, [:pointer, :int, :int], :uint

  # Update GPU texture with new data
  attach_function :rl_update_texture, :rlUpdateTexture, [:uint, :int, :int, :int, :int, :int, :pointer], :void

  # Get OpenGL internal formats
  attach_function :rl_get_gl_texture_formats, :rlGetGlTextureFormats, [:int, :pointer, :pointer, :pointer], :void

  # Get name string for pixel format
  attach_function :rl_get_pixel_format_name, :rlGetPixelFormatName, [:uint], :pointer

  # Unload texture from GPU memory
  attach_function :rl_unload_texture, :rlUnloadTexture, [:uint], :void

  # Generate mipmap data for selected texture
  attach_function :rl_gen_texture_mipmaps, :rlGenTextureMipmaps, [:uint, :int, :int, :int, :pointer], :void

  # Read texture pixel data
  attach_function :rl_read_texture_pixels, :rlReadTexturePixels, [:uint, :int, :int, :int], :pointer

  # Read screen pixel data (color buffer)
  attach_function :rl_read_screen_pixels, :rlReadScreenPixels, [:int, :int], :pointer

  # Load an empty framebuffer
  attach_function :rl_load_framebuffer, :rlLoadFramebuffer, [:int, :int], :uint

  # Attach texture/renderbuffer to a framebuffer
  attach_function :rl_framebuffer_attach, :rlFramebufferAttach, [:uint, :uint, :int, :int, :int], :void

  # Verify framebuffer is complete
  attach_function :rl_framebuffer_complete, :rlFramebufferComplete, [:uint], :bool

  # Delete framebuffer from GPU
  attach_function :rl_unload_framebuffer, :rlUnloadFramebuffer, [:uint], :void

  # Load shader from code strings
  attach_function :rl_load_shader_code, :rlLoadShaderCode, [:pointer, :pointer], :uint

  # Compile custom shader and return shader id (type: RL_VERTEX_SHADER, RL_FRAGMENT_SHADER, RL_COMPUTE_SHADER)
  attach_function :rl_compile_shader, :rlCompileShader, [:pointer, :int], :uint

  # Load custom shader program
  attach_function :rl_load_shader_program, :rlLoadShaderProgram, [:uint, :uint], :uint

  # Unload shader program
  attach_function :rl_unload_shader_program, :rlUnloadShaderProgram, [:uint], :void

  # Get shader location uniform
  attach_function :rl_get_location_uniform, :rlGetLocationUniform, [:uint, :pointer], :int

  # Get shader location attribute
  attach_function :rl_get_location_attrib, :rlGetLocationAttrib, [:uint, :pointer], :int

  # Set shader value uniform
  attach_function :rl_set_uniform, :rlSetUniform, [:int, :pointer, :int, :int], :void

  # Set shader value matrix
  attach_function :rl_set_uniform_matrix, :rlSetUniformMatrix, [:int, Matrix.by_value], :void

  # Set shader value sampler
  attach_function :rl_set_uniform_sampler, :rlSetUniformSampler, [:int, :uint], :void

  # Set shader currently active (id and locations)
  attach_function :rl_set_shader, :rlSetShader, [:uint, :pointer], :void

  # Load compute shader program
  attach_function :rl_load_compute_shader_program, :rlLoadComputeShaderProgram, [:uint], :uint

  # Dispatch compute shader (equivalent to *draw* for graphics pipeline)
  attach_function :rl_compute_shader_dispatch, :rlComputeShaderDispatch, [:uint, :uint, :uint], :void

  # Load shader storage buffer object (SSBO)
  attach_function :rl_load_shader_buffer, :rlLoadShaderBuffer, [:uint, :pointer, :int], :uint

  # Unload shader storage buffer object (SSBO)
  attach_function :rl_unload_shader_buffer, :rlUnloadShaderBuffer, [:uint], :void

  # Update SSBO buffer data
  attach_function :rl_update_shader_buffer, :rlUpdateShaderBuffer, [:uint, :pointer, :uint, :uint], :void

  # Bind SSBO buffer
  attach_function :rl_bind_shader_buffer, :rlBindShaderBuffer, [:uint, :uint], :void

  # Read SSBO buffer data (GPU->CPU)
  attach_function :rl_read_shader_buffer, :rlReadShaderBuffer, [:uint, :pointer, :uint, :uint], :void

  # Copy SSBO data between buffers
  attach_function :rl_copy_shader_buffer, :rlCopyShaderBuffer, [:uint, :uint, :uint, :uint, :uint], :void

  # Get SSBO buffer size
  attach_function :rl_get_shader_buffer_size, :rlGetShaderBufferSize, [:uint], :uint

  # Bind image texture
  attach_function :rl_bind_image_texture, :rlBindImageTexture, [:uint, :uint, :int, :bool], :void

  # Get internal modelview matrix
  attach_function :rl_get_matrix_modelview, :rlGetMatrixModelview, [], Matrix.by_value

  # Get internal projection matrix
  attach_function :rl_get_matrix_projection, :rlGetMatrixProjection, [], Matrix.by_value

  # Get internal accumulated transform matrix
  attach_function :rl_get_matrix_transform, :rlGetMatrixTransform, [], Matrix.by_value

  # Get internal projection matrix for stereo render (selected eye)
  attach_function :rl_get_matrix_projection_stereo, :rlGetMatrixProjectionStereo, [:int], Matrix.by_value

  # Get internal view offset matrix for stereo render (selected eye)
  attach_function :rl_get_matrix_view_offset_stereo, :rlGetMatrixViewOffsetStereo, [:int], Matrix.by_value

  # Set a custom projection matrix (replaces internal projection matrix)
  attach_function :rl_set_matrix_projection, :rlSetMatrixProjection, [Matrix.by_value], :void

  # Set a custom modelview matrix (replaces internal modelview matrix)
  attach_function :rl_set_matrix_modelview, :rlSetMatrixModelview, [Matrix.by_value], :void

  # Set eyes projection matrices for stereo rendering
  attach_function :rl_set_matrix_projection_stereo, :rlSetMatrixProjectionStereo, [Matrix.by_value, Matrix.by_value], :void

  # Set eyes view offsets matrices for stereo rendering
  attach_function :rl_set_matrix_view_offset_stereo, :rlSetMatrixViewOffsetStereo, [Matrix.by_value, Matrix.by_value], :void

  # Load and draw a cube
  attach_function :rl_load_draw_cube, :rlLoadDrawCube, [], :void

  # Load and draw a quad
  attach_function :rl_load_draw_quad, :rlLoadDrawQuad, [], :void

  # TODO
  attach_function :rl_get_matrix_projection_stereo, :rlGetMatrixProjectionStereo, [:int], Matrix.by_value

  # TODO
  attach_function :rl_get_matrix_view_offset_stereo, :rlGetMatrixViewOffsetStereo, [:int], Matrix.by_value
end
