module Raylib
  # 
  class Float16 < FFI::Struct
    layout(
      :v, [:float, 16], # 
    )

    def self.create(v)
      new.tap do |instance|
        instance[:v] = v
      end
    end

    def to_s
      "Raylib::Float16##{object_id} v=#{v}"
    end

    # 
    # @return [float[16]] v
    def v = self[:v]

    # Sets 
    def v=(new_v)
      self[:v] = new_v
    end
  end
end
