module Raylib
  # Vector4, 4 components
  class Vector4 < FFI::Struct
    layout(
      :x, :float, # Vector x component,
      :y, :float, # Vector y component,
      :z, :float, # Vector z component,
      :w, :float, # Vector w component
    )

    def self.create(x, y, z, w)
      new.tap do |instance|
        instance[:x] = x
        instance[:y] = y
        instance[:z] = z
        instance[:w] = w
      end
    end

    def to_s
      "Raylib::Vector4##{object_id} x=#{x} y=#{y} z=#{z} w=#{w}"
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

    # Vector w component
    # @return [Float] w
    def w = self[:w]

    # Sets Vector w component
    def w=(new_w)
      self[:w] = new_w
    end
  end

  # Quaternion, 4 components (Vector4 alias)
  Quaternion = Vector4
end
