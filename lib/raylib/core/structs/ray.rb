module Raylib
  # Ray, ray for raycasting
  class Ray < FFI::Struct
    layout(
      :position, Vector3,  # Ray position (origin),
      :direction, Vector3, # Ray direction
    )

    def self.create(position, direction)
      new.tap do |instance|
        instance[:position] = position
        instance[:direction] = direction
      end
    end

    def to_s
      "Raylib::Ray##{object_id} position=#{position} direction=#{direction}"
    end

    # Ray position (origin)
    # @return [Vector3] position
    def position = self[:position]

    # Sets Ray position (origin)
    def position=(new_position)
      self[:position] = new_position
    end

    # Ray direction
    # @return [Vector3] direction
    def direction = self[:direction]

    # Sets Ray direction
    def direction=(new_direction)
      self[:direction] = new_direction
    end
  end
end
