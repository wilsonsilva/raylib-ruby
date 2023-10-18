module Raylib
  # Texture, tex data stored in GPU memory (VRAM)
  class Texture < FFI::Struct
    layout(
      :id, :uint,     # OpenGL texture id,
      :width, :int,   # Texture base width,
      :height, :int,  # Texture base height,
      :mipmaps, :int, # Mipmap levels, 1 by default,
      :format, :int,  # Data format (PixelFormat type)
    )

    def self.create(id, width, height, mipmaps, format)
      new.tap do |instance|
        instance[:id] = id
        instance[:width] = width
        instance[:height] = height
        instance[:mipmaps] = mipmaps
        instance[:format] = format
      end
    end

    def to_s
      "Raylib::Texture##{object_id} id=#{id} width=#{width} height=#{height} mipmaps=#{mipmaps} format=#{format}"
    end

    # OpenGL texture id
    # @return [Integer] id
    def id = self[:id]

    # Sets OpenGL texture id
    def id=(new_id)
      self[:id] = new_id
    end

    # Texture base width
    # @return [Integer] width
    def width = self[:width]

    # Sets Texture base width
    def width=(new_width)
      self[:width] = new_width
    end

    # Texture base height
    # @return [Integer] height
    def height = self[:height]

    # Sets Texture base height
    def height=(new_height)
      self[:height] = new_height
    end

    # Mipmap levels, 1 by default
    # @return [Integer] mipmaps
    def mipmaps = self[:mipmaps]

    # Sets Mipmap levels, 1 by default
    def mipmaps=(new_mipmaps)
      self[:mipmaps] = new_mipmaps
    end

    # Data format (PixelFormat type)
    # @return [Integer] format
    def format = self[:format]

    # Sets Data format (PixelFormat type)
    def format=(new_format)
      self[:format] = new_format
    end
  end

  # Texture2D, same as Texture
  Texture2D = Texture

  # TextureCubemap, same as Texture
  TextureCubemap = Texture
end
