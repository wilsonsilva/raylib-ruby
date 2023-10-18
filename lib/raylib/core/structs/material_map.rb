module Raylib
  # MaterialMap
  class MaterialMap < FFI::Struct
    layout(
      :texture, Texture2D, # Material map texture,
      :color, Color,       # Material map color,
      :value, :float,      # Material map value
    )

    def self.create(texture, color, value)
      new.tap do |instance|
        instance[:texture] = texture
        instance[:color] = color
        instance[:value] = value
      end
    end

    def to_s
      "Raylib::MaterialMap##{object_id} texture=#{texture} color=#{color} value=#{value}"
    end

    # Material map texture
    # @return [Texture2D] texture
    def texture = self[:texture]

    # Sets Material map texture
    def texture=(new_texture)
      self[:texture] = new_texture
    end

    # Material map color
    # @return [Color] color
    def color = self[:color]

    # Sets Material map color
    def color=(new_color)
      self[:color] = new_color
    end

    # Material map value
    # @return [Float] value
    def value = self[:value]

    # Sets Material map value
    def value=(new_value)
      self[:value] = new_value
    end
  end
end
