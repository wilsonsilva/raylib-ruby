module Raylib
  # GlyphInfo, font characters glyphs info
  class GlyphInfo < FFI::Struct
    layout(
      :value, :int,    # Character value (Unicode),
      :offsetX, :int,  # Character offset X when drawing,
      :offsetY, :int,  # Character offset Y when drawing,
      :advanceX, :int, # Character advance position X,
      :image, Image,   # Character image data
    )

    def self.create(value, offset_x, offset_y, advance_x, image)
      new.tap do |instance|
        instance[:value] = value
        instance[:offsetX] = offset_x
        instance[:offsetY] = offset_y
        instance[:advanceX] = advance_x
        instance[:image] = image
      end
    end

    def to_s
      "Raylib::GlyphInfo##{object_id} value=#{value} offset_x=#{offset_x} offset_y=#{offset_y} advance_x=#{advance_x} image=#{image}"
    end

    # Character value (Unicode)
    # @return [Integer] value
    def value = self[:value]

    # Sets Character value (Unicode)
    def value=(new_value)
      self[:value] = new_value
    end

    # Character offset X when drawing
    # @return [Integer] offsetX
    def offset_x = self[:offsetX]

    # Sets Character offset X when drawing
    def offset_x=(new_offset_x)
      self[:offsetX] = new_offset_x
    end

    # Character offset Y when drawing
    # @return [Integer] offsetY
    def offset_y = self[:offsetY]

    # Sets Character offset Y when drawing
    def offset_y=(new_offset_y)
      self[:offsetY] = new_offset_y
    end

    # Character advance position X
    # @return [Integer] advanceX
    def advance_x = self[:advanceX]

    # Sets Character advance position X
    def advance_x=(new_advance_x)
      self[:advanceX] = new_advance_x
    end

    # Character image data
    # @return [Image] image
    def image = self[:image]

    # Sets Character image data
    def image=(new_image)
      self[:image] = new_image
    end
  end
end
