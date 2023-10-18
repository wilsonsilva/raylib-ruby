module Raylib
  # Font, font texture and GlyphInfo array data
  class Font < FFI::Struct
    layout(
      :baseSize, :int,     # Base size (default chars height),
      :glyphCount, :int,   # Number of glyph characters,
      :glyphPadding, :int, # Padding around the glyph characters,
      :texture, Texture2D, # Texture atlas containing the glyphs,
      :recs, :pointer,     # Rectangles in texture for the glyphs,
      :glyphs, :pointer,   # Glyphs info data
    )

    def self.create(base_size, glyph_count, glyph_padding, texture, recs, glyphs)
      new.tap do |instance|
        instance[:baseSize] = base_size
        instance[:glyphCount] = glyph_count
        instance[:glyphPadding] = glyph_padding
        instance[:texture] = texture
        instance[:recs] = recs
        instance[:glyphs] = glyphs
      end
    end

    def to_s
      "Raylib::Font##{object_id} base_size=#{base_size} glyph_count=#{glyph_count} glyph_padding=#{glyph_padding} texture=#{texture} recs=#{recs} glyphs=#{glyphs}"
    end

    # Base size (default chars height)
    # @return [Integer] baseSize
    def base_size = self[:baseSize]

    # Sets Base size (default chars height)
    def base_size=(new_base_size)
      self[:baseSize] = new_base_size
    end

    # Number of glyph characters
    # @return [Integer] glyphCount
    def glyph_count = self[:glyphCount]

    # Sets Number of glyph characters
    def glyph_count=(new_glyph_count)
      self[:glyphCount] = new_glyph_count
    end

    # Padding around the glyph characters
    # @return [Integer] glyphPadding
    def glyph_padding = self[:glyphPadding]

    # Sets Padding around the glyph characters
    def glyph_padding=(new_glyph_padding)
      self[:glyphPadding] = new_glyph_padding
    end

    # Texture atlas containing the glyphs
    # @return [Texture2D] texture
    def texture = self[:texture]

    # Sets Texture atlas containing the glyphs
    def texture=(new_texture)
      self[:texture] = new_texture
    end

    # Rectangles in texture for the glyphs
    # @return [Rectangle *] recs
    def recs = self[:recs]

    # Sets Rectangles in texture for the glyphs
    def recs=(new_recs)
      self[:recs] = new_recs
    end

    # Glyphs info data
    # @return [GlyphInfo *] glyphs
    def glyphs = self[:glyphs]

    # Sets Glyphs info data
    def glyphs=(new_glyphs)
      self[:glyphs] = new_glyphs
    end
  end
end
