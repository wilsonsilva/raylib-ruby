module Raylib
  # Vector3, 3 components
  class Vector3 < FFI::Struct
    layout(
      :x, :float, # Vector x component,
      :y, :float, # Vector y component,
      :z, :float, # Vector z component
    )

    def self.create(x, y, z)
      new.tap do |instance|
        instance[:x] = x
        instance[:y] = y
        instance[:z] = z
      end
    end

    def to_s
      "Raylib::Vector3##{object_id} x=#{x} y=#{y} z=#{z}"
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

    # Vector z component
    # @return [Float] z
    def z = self[:z]

    # Sets Vector z component
    def z=(new_z)
      self[:z] = new_z
    end
  end
end
