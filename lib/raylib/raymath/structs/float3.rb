module Raylib
  # NOTE: Helper types to be used instead of array return types for *ToFloat functions
  class Float3 < FFI::Struct
    layout(
      :v, [:float, 3], # 
    )

    def self.create(v)
      new.tap do |instance|
        instance[:v] = v
      end
    end

    def to_s
      "Raylib::Float3##{object_id} v=#{v}"
    end

    # 
    # @return [float[3]] v
    def v = self[:v]

    # Sets 
    def v=(new_v)
      self[:v] = new_v
    end
  end
end
