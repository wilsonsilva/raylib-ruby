module Raylib
  # Material, includes shader and maps
  class Material < FFI::Struct
    layout(
      :shader, Shader,      # Material shader,
      :maps, :pointer,      # Material maps array (MAX_MATERIAL_MAPS),
      :params, [:float, 4], # Material generic parameters (if required)
    )

    def self.create(shader, maps, params)
      new.tap do |instance|
        instance[:shader] = shader
        instance[:maps] = maps
        instance[:params] = params
      end
    end

    def to_s
      "Raylib::Material##{object_id} shader=#{shader} maps=#{maps} params=#{params}"
    end

    # Material shader
    # @return [Shader] shader
    def shader = self[:shader]

    # Sets Material shader
    def shader=(new_shader)
      self[:shader] = new_shader
    end

    # Material maps array (MAX_MATERIAL_MAPS)
    # @return [MaterialMap *] maps
    def maps = self[:maps]

    # Sets Material maps array (MAX_MATERIAL_MAPS)
    def maps=(new_maps)
      self[:maps] = new_maps
    end

    # Material generic parameters (if required)
    # @return [float[4]] params
    def params = self[:params]

    # Sets Material generic parameters (if required)
    def params=(new_params)
      self[:params] = new_params
    end
  end
end
