module Raylib
  # Shader
  class Shader < FFI::Struct
    layout(
      :id, :uint,      # Shader program id,
      :locs, :pointer, # Shader locations array (RL_MAX_SHADER_LOCATIONS)
    )

    def self.create(id, locs)
      new.tap do |instance|
        instance[:id] = id
        instance[:locs] = locs
      end
    end

    def to_s
      "Raylib::Shader##{object_id} id=#{id} locs=#{locs}"
    end

    # Shader program id
    # @return [Integer] id
    def id = self[:id]

    # Sets Shader program id
    def id=(new_id)
      self[:id] = new_id
    end

    # Shader locations array (RL_MAX_SHADER_LOCATIONS)
    # @return [int *] locs
    def locs = self[:locs]

    # Sets Shader locations array (RL_MAX_SHADER_LOCATIONS)
    def locs=(new_locs)
      self[:locs] = new_locs
    end
  end
end
