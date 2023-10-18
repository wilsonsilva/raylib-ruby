module Raylib
  # Bone, skeletal animation bone
  class BoneInfo < FFI::Struct
    layout(
      :name, [:char, 32], # Bone name,
      :parent, :int,      # Bone parent
    )

    def self.create(name, parent)
      new.tap do |instance|
        instance[:name] = name
        instance[:parent] = parent
      end
    end

    def to_s
      "Raylib::BoneInfo##{object_id} name=#{name} parent=#{parent}"
    end

    # Bone name
    # @return [char[32]] name
    def name = self[:name]

    # Sets Bone name
    def name=(new_name)
      self[:name] = new_name
    end

    # Bone parent
    # @return [Integer] parent
    def parent = self[:parent]

    # Sets Bone parent
    def parent=(new_parent)
      self[:parent] = new_parent
    end
  end
end
