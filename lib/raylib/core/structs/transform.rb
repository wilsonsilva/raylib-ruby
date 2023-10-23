module Raylib
  # Transform, vertex transformation data
  class Transform < FFI::Struct
    layout(
      :translation, Vector3, # Translation,
      :rotation, Quaternion, # Rotation,
      :scale, Vector3,       # Scale
    )

    def self.create(translation, rotation, scale)
      new.tap do |instance|
        instance[:translation] = translation
        instance[:rotation] = rotation
        instance[:scale] = scale
      end
    end

    def to_s
      "Raylib::Transform##{object_id} translation=#{translation} rotation=#{rotation} scale=#{scale}"
    end

    # Translation
    # @return [Vector3] translation
    def translation = self[:translation]

    # Sets Translation
    def translation=(new_translation)
      self[:translation] = new_translation
    end

    # Rotation
    # @return [Quaternion] rotation
    def rotation = self[:rotation]

    # Sets Rotation
    def rotation=(new_rotation)
      self[:rotation] = new_rotation
    end

    # Scale
    # @return [Vector3] scale
    def scale = self[:scale]

    # Sets Scale
    def scale=(new_scale)
      self[:scale] = new_scale
    end
  end

  # Registering custom types with FFI
  # FFI.typedef :pointer, :transform_pointer
  # FFI::TypeDefs[:transform_pointer].instance_variable_set(:@type_size, Transform.size)
end
