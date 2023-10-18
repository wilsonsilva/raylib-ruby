module Raylib
  # BoundingBox
  class BoundingBox < FFI::Struct
    layout(
      :min, Vector3, # Minimum vertex box-corner,
      :max, Vector3, # Maximum vertex box-corner
    )

    def self.create(min, max)
      new.tap do |instance|
        instance[:min] = min
        instance[:max] = max
      end
    end

    def to_s
      "Raylib::BoundingBox##{object_id} min=#{min} max=#{max}"
    end

    # Minimum vertex box-corner
    # @return [Vector3] min
    def min = self[:min]

    # Sets Minimum vertex box-corner
    def min=(new_min)
      self[:min] = new_min
    end

    # Maximum vertex box-corner
    # @return [Vector3] max
    def max = self[:max]

    # Sets Maximum vertex box-corner
    def max=(new_max)
      self[:max] = new_max
    end
  end
end
