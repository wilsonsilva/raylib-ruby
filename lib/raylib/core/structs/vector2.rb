module Raylib
  # Vector2, 2 components
  class Vector2 < FFI::Struct
    layout(
      :x, :float, # Vector x component,
      :y, :float, # Vector y component
    )

    def self.create(x, y)
      new.tap do |instance|
        instance[:x] = x
        instance[:y] = y
      end
    end

    def to_s
      "Raylib::Vector2##{object_id} x=#{x} y=#{y}"
    end

    # Vector x component
    # @return [Float] x
    def x = self[:x]

    # Sets Vector x component
    def x=(new_x)
      self[:x] = new_x
    end

    # Vector y component
    # @return [Float] y
    def y = self[:y]

    # Sets Vector y component
    def y=(new_y)
      self[:y] = new_y
    end
  end
end
