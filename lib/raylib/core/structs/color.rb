module Raylib
  # Color, 4 components, R8G8B8A8 (32bit)
  class Color < FFI::Struct
    layout(
      :r, :uchar, # Color red value,
      :g, :uchar, # Color green value,
      :b, :uchar, # Color blue value,
      :a, :uchar, # Color alpha value
    )

    def self.create(r, g, b, a)
      new.tap do |instance|
        instance[:r] = r
        instance[:g] = g
        instance[:b] = b
        instance[:a] = a
      end
    end

    def to_s
      "Raylib::Color##{object_id} r=#{r} g=#{g} b=#{b} a=#{a}"
    end

    # Color red value
    # @return [unsigned char] r
    def r = self[:r]

    # Sets Color red value
    def r=(new_r)
      self[:r] = new_r
    end

    # Color green value
    # @return [unsigned char] g
    def g = self[:g]

    # Sets Color green value
    def g=(new_g)
      self[:g] = new_g
    end

    # Color blue value
    # @return [unsigned char] b
    def b = self[:b]

    # Sets Color blue value
    def b=(new_b)
      self[:b] = new_b
    end

    # Color alpha value
    # @return [unsigned char] a
    def a = self[:a]

    # Sets Color alpha value
    def a=(new_a)
      self[:a] = new_a
    end
  end
end
