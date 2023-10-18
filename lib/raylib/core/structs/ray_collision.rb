module Raylib
  # RayCollision, ray hit information
  class RayCollision < FFI::Struct
    layout(
      :hit, :bool,       # Did the ray hit something?,
      :distance, :float, # Distance to the nearest hit,
      :point, Vector3,   # Point of the nearest hit,
      :normal, Vector3,  # Surface normal of hit
    )

    def self.create(hit, distance, point, normal)
      new.tap do |instance|
        instance[:hit] = hit
        instance[:distance] = distance
        instance[:point] = point
        instance[:normal] = normal
      end
    end

    def to_s
      "Raylib::RayCollision##{object_id} hit=#{hit} distance=#{distance} point=#{point} normal=#{normal}"
    end

    # Did the ray hit something?
    # @return [bool] hit
    def hit = self[:hit]

    # Sets Did the ray hit something?
    def hit=(new_hit)
      self[:hit] = new_hit
    end

    # Distance to the nearest hit
    # @return [Float] distance
    def distance = self[:distance]

    # Sets Distance to the nearest hit
    def distance=(new_distance)
      self[:distance] = new_distance
    end

    # Point of the nearest hit
    # @return [Vector3] point
    def point = self[:point]

    # Sets Point of the nearest hit
    def point=(new_point)
      self[:point] = new_point
    end

    # Surface normal of hit
    # @return [Vector3] normal
    def normal = self[:normal]

    # Sets Surface normal of hit
    def normal=(new_normal)
      self[:normal] = new_normal
    end
  end
end
