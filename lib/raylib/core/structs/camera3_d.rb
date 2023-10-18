module Raylib
  # Camera, defines position/orientation in 3d space
  class Camera3D < FFI::Struct
    layout(
      :position, Vector3, # Camera position,
      :target, Vector3,   # Camera target it looks-at,
      :up, Vector3,       # Camera up vector (rotation over its axis),
      :fovy, :float,      # Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic,
      :projection, :int,  # Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    )

    def self.create(position, target, up, fovy, projection)
      new.tap do |instance|
        instance[:position] = position
        instance[:target] = target
        instance[:up] = up
        instance[:fovy] = fovy
        instance[:projection] = projection
      end
    end

    def to_s
      "Raylib::Camera3D##{object_id} position=#{position} target=#{target} up=#{up} fovy=#{fovy} projection=#{projection}"
    end

    # Camera position
    # @return [Vector3] position
    def position = self[:position]

    # Sets Camera position
    def position=(new_position)
      self[:position] = new_position
    end

    # Camera target it looks-at
    # @return [Vector3] target
    def target = self[:target]

    # Sets Camera target it looks-at
    def target=(new_target)
      self[:target] = new_target
    end

    # Camera up vector (rotation over its axis)
    # @return [Vector3] up
    def up = self[:up]

    # Sets Camera up vector (rotation over its axis)
    def up=(new_up)
      self[:up] = new_up
    end

    # Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
    # @return [Float] fovy
    def fovy = self[:fovy]

    # Sets Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
    def fovy=(new_fovy)
      self[:fovy] = new_fovy
    end

    # Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    # @return [Integer] projection
    def projection = self[:projection]

    # Sets Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
    def projection=(new_projection)
      self[:projection] = new_projection
    end
  end

  # Camera type fallback, defaults to Camera3D
  Camera = Camera3D
end
