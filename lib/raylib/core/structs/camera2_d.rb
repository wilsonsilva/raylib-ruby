module Raylib
  # Camera2D, defines position/orientation in 2d space
  class Camera2D < FFI::Struct
    layout(
      :offset, Vector2,  # Camera offset (displacement from target),
      :target, Vector2,  # Camera target (rotation and zoom origin),
      :rotation, :float, # Camera rotation in degrees,
      :zoom, :float,     # Camera zoom (scaling), should be 1.0f by default
    )

    def self.create(offset, target, rotation, zoom)
      new.tap do |instance|
        instance[:offset] = offset
        instance[:target] = target
        instance[:rotation] = rotation
        instance[:zoom] = zoom
      end
    end

    def to_s
      "Raylib::Camera2D##{object_id} offset=#{offset} target=#{target} rotation=#{rotation} zoom=#{zoom}"
    end

    # Camera offset (displacement from target)
    # @return [Vector2] offset
    def offset = self[:offset]

    # Sets Camera offset (displacement from target)
    def offset=(new_offset)
      self[:offset] = new_offset
    end

    # Camera target (rotation and zoom origin)
    # @return [Vector2] target
    def target = self[:target]

    # Sets Camera target (rotation and zoom origin)
    def target=(new_target)
      self[:target] = new_target
    end

    # Camera rotation in degrees
    # @return [Float] rotation
    def rotation = self[:rotation]

    # Sets Camera rotation in degrees
    def rotation=(new_rotation)
      self[:rotation] = new_rotation
    end

    # Camera zoom (scaling), should be 1.0f by default
    # @return [Float] zoom
    def zoom = self[:zoom]

    # Sets Camera zoom (scaling), should be 1.0f by default
    def zoom=(new_zoom)
      self[:zoom] = new_zoom
    end
  end
end
