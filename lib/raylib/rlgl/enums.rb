module Raylib
  # ----------------------------------------------------------------------------------------------------
  # rlGlVersion - OpenGL version
  # ----------------------------------------------------------------------------------------------------

  # OpenGL 1.1
  RL_OPENGL_11 = 1
  # OpenGL 2.1 (GLSL 120)
  RL_OPENGL_21 = 2
  # OpenGL 3.3 (GLSL 330)
  RL_OPENGL_33 = 3
  # OpenGL 4.3 (using GLSL 330)
  RL_OPENGL_43 = 4
  # OpenGL ES 2.0 (GLSL 100)
  RL_OPENGL_ES_20 = 5

  # ----------------------------------------------------------------------------------------------------
  # rlTraceLogLevel - Trace log level
  # ----------------------------------------------------------------------------------------------------

  # Display all logs
  RL_LOG_ALL = 0
  # Trace logging, intended for internal use only
  RL_LOG_TRACE = 1
  # Debug logging, used for internal debugging, it should be disabled on release builds
  RL_LOG_DEBUG = 2
  # Info logging, used for program execution info
  RL_LOG_INFO = 3
  # Warning logging, used on recoverable failures
  RL_LOG_WARNING = 4
  # Error logging, used on unrecoverable failures
  RL_LOG_ERROR = 5
  # Fatal logging, used to abort program: exit(EXIT_FAILURE)
  RL_LOG_FATAL = 6
  # Disable logging
  RL_LOG_NONE = 7

  # ----------------------------------------------------------------------------------------------------
  # rlPixelFormat - Texture pixel formats
  # ----------------------------------------------------------------------------------------------------

  # 8 bit per pixel (no alpha)
  RL_PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1
  # 8*2 bpp (2 channels)
  RL_PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2
  # 16 bpp
  RL_PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3
  # 24 bpp
  RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4
  # 16 bpp (1 bit alpha)
  RL_PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5
  # 16 bpp (4 bit alpha)
  RL_PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6
  # 32 bpp
  RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7
  # 32 bpp (1 channel - float)
  RL_PIXELFORMAT_UNCOMPRESSED_R32 = 8
  # 32*3 bpp (3 channels - float)
  RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9
  # 32*4 bpp (4 channels - float)
  RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10
  # 4 bpp (no alpha)
  RL_PIXELFORMAT_COMPRESSED_DXT1_RGB = 11
  # 4 bpp (1 bit alpha)
  RL_PIXELFORMAT_COMPRESSED_DXT1_RGBA = 12
  # 8 bpp
  RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA = 13
  # 8 bpp
  RL_PIXELFORMAT_COMPRESSED_DXT5_RGBA = 14
  # 4 bpp
  RL_PIXELFORMAT_COMPRESSED_ETC1_RGB = 15
  # 4 bpp
  RL_PIXELFORMAT_COMPRESSED_ETC2_RGB = 16
  # 8 bpp
  RL_PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 17
  # 4 bpp
  RL_PIXELFORMAT_COMPRESSED_PVRT_RGB = 18
  # 4 bpp
  RL_PIXELFORMAT_COMPRESSED_PVRT_RGBA = 19
  # 8 bpp
  RL_PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 20
  # 2 bpp
  RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 21

  # ----------------------------------------------------------------------------------------------------
  # rlTextureFilter - Texture parameters: filter mode
  # ----------------------------------------------------------------------------------------------------

  # No filter, just pixel approximation
  RL_TEXTURE_FILTER_POINT = 0
  # Linear filtering
  RL_TEXTURE_FILTER_BILINEAR = 1
  # Trilinear filtering (linear with mipmaps)
  RL_TEXTURE_FILTER_TRILINEAR = 2
  # Anisotropic filtering 4x
  RL_TEXTURE_FILTER_ANISOTROPIC_4X = 3
  # Anisotropic filtering 8x
  RL_TEXTURE_FILTER_ANISOTROPIC_8X = 4
  # Anisotropic filtering 16x
  RL_TEXTURE_FILTER_ANISOTROPIC_16X = 5

  # ----------------------------------------------------------------------------------------------------
  # rlBlendMode - Color blending modes (pre-defined)
  # ----------------------------------------------------------------------------------------------------

  # Blend textures considering alpha (default)
  RL_BLEND_ALPHA = 0
  # Blend textures adding colors
  RL_BLEND_ADDITIVE = 1
  # Blend textures multiplying colors
  RL_BLEND_MULTIPLIED = 2
  # Blend textures adding colors (alternative)
  RL_BLEND_ADD_COLORS = 3
  # Blend textures subtracting colors (alternative)
  RL_BLEND_SUBTRACT_COLORS = 4
  # Blend premultiplied textures considering alpha
  RL_BLEND_ALPHA_PREMULTIPLY = 5
  # Blend textures using custom src/dst factors (use rlSetBlendFactors())
  RL_BLEND_CUSTOM = 6
  # Blend textures using custom src/dst factors (use rlSetBlendFactorsSeparate())
  RL_BLEND_CUSTOM_SEPARATE = 7

  # ----------------------------------------------------------------------------------------------------
  # rlShaderLocationIndex - Shader location point type
  # ----------------------------------------------------------------------------------------------------

  # Shader location: vertex attribute: position
  RL_SHADER_LOC_VERTEX_POSITION = 0
  # Shader location: vertex attribute: texcoord01
  RL_SHADER_LOC_VERTEX_TEXCOORD01 = 1
  # Shader location: vertex attribute: texcoord02
  RL_SHADER_LOC_VERTEX_TEXCOORD02 = 2
  # Shader location: vertex attribute: normal
  RL_SHADER_LOC_VERTEX_NORMAL = 3
  # Shader location: vertex attribute: tangent
  RL_SHADER_LOC_VERTEX_TANGENT = 4
  # Shader location: vertex attribute: color
  RL_SHADER_LOC_VERTEX_COLOR = 5
  # Shader location: matrix uniform: model-view-projection
  RL_SHADER_LOC_MATRIX_MVP = 6
  # Shader location: matrix uniform: view (camera transform)
  RL_SHADER_LOC_MATRIX_VIEW = 7
  # Shader location: matrix uniform: projection
  RL_SHADER_LOC_MATRIX_PROJECTION = 8
  # Shader location: matrix uniform: model (transform)
  RL_SHADER_LOC_MATRIX_MODEL = 9
  # Shader location: matrix uniform: normal
  RL_SHADER_LOC_MATRIX_NORMAL = 10
  # Shader location: vector uniform: view
  RL_SHADER_LOC_VECTOR_VIEW = 11
  # Shader location: vector uniform: diffuse color
  RL_SHADER_LOC_COLOR_DIFFUSE = 12
  # Shader location: vector uniform: specular color
  RL_SHADER_LOC_COLOR_SPECULAR = 13
  # Shader location: vector uniform: ambient color
  RL_SHADER_LOC_COLOR_AMBIENT = 14
  # Shader location: sampler2d texture: albedo (same as: RL_SHADER_LOC_MAP_DIFFUSE)
  RL_SHADER_LOC_MAP_ALBEDO = 15
  # Shader location: sampler2d texture: metalness (same as: RL_SHADER_LOC_MAP_SPECULAR)
  RL_SHADER_LOC_MAP_METALNESS = 16
  # Shader location: sampler2d texture: normal
  RL_SHADER_LOC_MAP_NORMAL = 17
  # Shader location: sampler2d texture: roughness
  RL_SHADER_LOC_MAP_ROUGHNESS = 18
  # Shader location: sampler2d texture: occlusion
  RL_SHADER_LOC_MAP_OCCLUSION = 19
  # Shader location: sampler2d texture: emission
  RL_SHADER_LOC_MAP_EMISSION = 20
  # Shader location: sampler2d texture: height
  RL_SHADER_LOC_MAP_HEIGHT = 21
  # Shader location: samplerCube texture: cubemap
  RL_SHADER_LOC_MAP_CUBEMAP = 22
  # Shader location: samplerCube texture: irradiance
  RL_SHADER_LOC_MAP_IRRADIANCE = 23
  # Shader location: samplerCube texture: prefilter
  RL_SHADER_LOC_MAP_PREFILTER = 24
  # Shader location: sampler2d texture: brdf
  RL_SHADER_LOC_MAP_BRDF = 25

  # ----------------------------------------------------------------------------------------------------
  # rlShaderUniformDataType - Shader uniform data type
  # ----------------------------------------------------------------------------------------------------

  # Shader uniform type: float
  RL_SHADER_UNIFORM_FLOAT = 0
  # Shader uniform type: vec2 (2 float)
  RL_SHADER_UNIFORM_VEC2 = 1
  # Shader uniform type: vec3 (3 float)
  RL_SHADER_UNIFORM_VEC3 = 2
  # Shader uniform type: vec4 (4 float)
  RL_SHADER_UNIFORM_VEC4 = 3
  # Shader uniform type: int
  RL_SHADER_UNIFORM_INT = 4
  # Shader uniform type: ivec2 (2 int)
  RL_SHADER_UNIFORM_IVEC2 = 5
  # Shader uniform type: ivec3 (3 int)
  RL_SHADER_UNIFORM_IVEC3 = 6
  # Shader uniform type: ivec4 (4 int)
  RL_SHADER_UNIFORM_IVEC4 = 7
  # Shader uniform type: sampler2d
  RL_SHADER_UNIFORM_SAMPLER2D = 8

  # ----------------------------------------------------------------------------------------------------
  # rlShaderAttributeDataType - Shader attribute data types
  # ----------------------------------------------------------------------------------------------------

  # Shader attribute type: float
  RL_SHADER_ATTRIB_FLOAT = 0
  # Shader attribute type: vec2 (2 float)
  RL_SHADER_ATTRIB_VEC2 = 1
  # Shader attribute type: vec3 (3 float)
  RL_SHADER_ATTRIB_VEC3 = 2
  # Shader attribute type: vec4 (4 float)
  RL_SHADER_ATTRIB_VEC4 = 3

  # ----------------------------------------------------------------------------------------------------
  # rlFramebufferAttachType - Framebuffer attachment type
  # ----------------------------------------------------------------------------------------------------

  # Framebuffer attachment type: color 0
  RL_ATTACHMENT_COLOR_CHANNEL0 = 0
  # Framebuffer attachment type: color 1
  RL_ATTACHMENT_COLOR_CHANNEL1 = 1
  # Framebuffer attachment type: color 2
  RL_ATTACHMENT_COLOR_CHANNEL2 = 2
  # Framebuffer attachment type: color 3
  RL_ATTACHMENT_COLOR_CHANNEL3 = 3
  # Framebuffer attachment type: color 4
  RL_ATTACHMENT_COLOR_CHANNEL4 = 4
  # Framebuffer attachment type: color 5
  RL_ATTACHMENT_COLOR_CHANNEL5 = 5
  # Framebuffer attachment type: color 6
  RL_ATTACHMENT_COLOR_CHANNEL6 = 6
  # Framebuffer attachment type: color 7
  RL_ATTACHMENT_COLOR_CHANNEL7 = 7
  # Framebuffer attachment type: depth
  RL_ATTACHMENT_DEPTH = 100
  # Framebuffer attachment type: stencil
  RL_ATTACHMENT_STENCIL = 200

  # ----------------------------------------------------------------------------------------------------
  # rlFramebufferAttachTextureType - Framebuffer texture attachment type
  # ----------------------------------------------------------------------------------------------------

  # Framebuffer texture attachment type: cubemap, +X side
  RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0
  # Framebuffer texture attachment type: cubemap, -X side
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = 1
  # Framebuffer texture attachment type: cubemap, +Y side
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = 2
  # Framebuffer texture attachment type: cubemap, -Y side
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = 3
  # Framebuffer texture attachment type: cubemap, +Z side
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = 4
  # Framebuffer texture attachment type: cubemap, -Z side
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = 5
  # Framebuffer texture attachment type: texture2d
  RL_ATTACHMENT_TEXTURE2D = 100
  # Framebuffer texture attachment type: renderbuffer
  RL_ATTACHMENT_RENDERBUFFER = 200

  # ----------------------------------------------------------------------------------------------------
  # rlCullMode - Face culling mode
  # ----------------------------------------------------------------------------------------------------

  # TODO
  RL_CULL_FACE_FRONT = 0
  # TODO
  RL_CULL_FACE_BACK = 1
end
