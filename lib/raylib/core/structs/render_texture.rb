module Raylib
  # RenderTexture, fbo for texture rendering
  class RenderTexture < FFI::Struct
    layout(
      :id, :uint,        # OpenGL framebuffer object id,
      :texture, Texture, # Color buffer attachment texture,
      :depth, Texture,   # Depth buffer attachment texture
    )

    def self.create(id, texture, depth)
      new.tap do |instance|
        instance[:id] = id
        instance[:texture] = texture
        instance[:depth] = depth
      end
    end

    def to_s
      "Raylib::RenderTexture##{object_id} id=#{id} texture=#{texture} depth=#{depth}"
    end

    # OpenGL framebuffer object id
    # @return [Integer] id
    def id = self[:id]

    # Sets OpenGL framebuffer object id
    def id=(new_id)
      self[:id] = new_id
    end

    # Color buffer attachment texture
    # @return [Texture] texture
    def texture = self[:texture]

    # Sets Color buffer attachment texture
    def texture=(new_texture)
      self[:texture] = new_texture
    end

    # Depth buffer attachment texture
    # @return [Texture] depth
    def depth = self[:depth]

    # Sets Depth buffer attachment texture
    def depth=(new_depth)
      self[:depth] = new_depth
    end
  end

  # RenderTexture2D, same as RenderTexture
  RenderTexture2D = RenderTexture
end
