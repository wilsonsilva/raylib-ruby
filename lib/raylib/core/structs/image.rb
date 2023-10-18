module Raylib
  # Image, pixel data stored in CPU memory (RAM)
  class Image < FFI::Struct
    layout(
      :data, :pointer, # Image raw data,
      :width, :int,    # Image base width,
      :height, :int,   # Image base height,
      :mipmaps, :int,  # Mipmap levels, 1 by default,
      :format, :int,   # Data format (PixelFormat type)
    )

    def self.create(data, width, height, mipmaps, format)
      new.tap do |instance|
        instance[:data] = data
        instance[:width] = width
        instance[:height] = height
        instance[:mipmaps] = mipmaps
        instance[:format] = format
      end
    end

    def to_s
      "Raylib::Image##{object_id} data=#{data} width=#{width} height=#{height} mipmaps=#{mipmaps} format=#{format}"
    end

    # Image raw data
    # @return [void *] data
    def data = self[:data]

    # Sets Image raw data
    def data=(new_data)
      self[:data] = new_data
    end

    # Image base width
    # @return [Integer] width
    def width = self[:width]

    # Sets Image base width
    def width=(new_width)
      self[:width] = new_width
    end

    # Image base height
    # @return [Integer] height
    def height = self[:height]

    # Sets Image base height
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
end
