module Raylib
  # NPatchInfo, n-patch layout info
  class NPatchInfo < FFI::Struct
    layout(
      :source, Rectangle, # Texture source rectangle,
      :left, :int,        # Left border offset,
      :top, :int,         # Top border offset,
      :right, :int,       # Right border offset,
      :bottom, :int,      # Bottom border offset,
      :layout, :int,      # Layout of the n-patch: 3x3, 1x3 or 3x1
    )

    def self.create(source, left, top, right, bottom, layout)
      new.tap do |instance|
        instance[:source] = source
        instance[:left] = left
        instance[:top] = top
        instance[:right] = right
        instance[:bottom] = bottom
        instance[:layout] = layout
      end
    end

    def to_s
      "Raylib::NPatchInfo##{object_id} source=#{source} left=#{left} top=#{top} right=#{right} bottom=#{bottom} layout=#{layout}"
    end

    # Texture source rectangle
    # @return [Rectangle] source
    def source = self[:source]

    # Sets Texture source rectangle
    def source=(new_source)
      self[:source] = new_source
    end

    # Left border offset
    # @return [Integer] left
    def left = self[:left]

    # Sets Left border offset
    def left=(new_left)
      self[:left] = new_left
    end

    # Top border offset
    # @return [Integer] top
    def top = self[:top]

    # Sets Top border offset
    def top=(new_top)
      self[:top] = new_top
    end

    # Right border offset
    # @return [Integer] right
    def right = self[:right]

    # Sets Right border offset
    def right=(new_right)
      self[:right] = new_right
    end

    # Bottom border offset
    # @return [Integer] bottom
    def bottom = self[:bottom]

    # Sets Bottom border offset
    def bottom=(new_bottom)
      self[:bottom] = new_bottom
    end

    # Layout of the n-patch: 3x3, 1x3 or 3x1
    # @return [Integer] layout
    def layout = self[:layout]

    # Sets Layout of the n-patch: 3x3, 1x3 or 3x1
    def layout=(new_layout)
      self[:layout] = new_layout
    end
  end
end
