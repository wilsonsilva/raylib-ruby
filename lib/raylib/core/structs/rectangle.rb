module Raylib
  # Rectangle, 4 components
  class Rectangle < FFI::Struct
    layout(
      :x, :float,      # Rectangle top-left corner position x,
      :y, :float,      # Rectangle top-left corner position y,
      :width, :float,  # Rectangle width,
      :height, :float, # Rectangle height
    )

    def self.create(x, y, width, height)
      new.tap do |instance|
        instance[:x] = x
        instance[:y] = y
        instance[:width] = width
        instance[:height] = height
      end
    end

    def to_s
      "Raylib::Rectangle##{object_id} x=#{x} y=#{y} width=#{width} height=#{height}"
    end

    # Rectangle top-left corner position x
    # @return [Float] x
    def x = self[:x]

    # Sets Rectangle top-left corner position x
    def x=(new_x)
      self[:x] = new_x
    end

    # Rectangle top-left corner position y
    # @return [Float] y
    def y = self[:y]

    # Sets Rectangle top-left corner position y
    def y=(new_y)
      self[:y] = new_y
    end

    # Rectangle width
    # @return [Float] width
    def width = self[:width]

    # Sets Rectangle width
    def width=(new_width)
      self[:width] = new_width
    end

    # Rectangle height
    # @return [Float] height
    def height = self[:height]

    # Sets Rectangle height
    def height=(new_height)
      self[:height] = new_height
    end
  end
end
