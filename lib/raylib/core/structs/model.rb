module Raylib
  # Model, meshes, materials and animation data
  class Model < FFI::Struct
    layout(
      :transform, Matrix,      # Local transform matrix,
      :meshCount, :int,        # Number of meshes,
      :materialCount, :int,    # Number of materials,
      :meshes, :pointer,       # Meshes array,
      :materials, :pointer,    # Materials array,
      :meshMaterial, :pointer, # Mesh material number,
      :boneCount, :int,        # Number of bones,
      :bones, :pointer,        # Bones information (skeleton),
      :bindPose, :pointer,     # Bones base transformation (pose)
    )

    def self.create(transform, mesh_count, material_count, meshes, materials, mesh_material, bone_count, bones, bind_pose)
      new.tap do |instance|
        instance[:transform] = transform
        instance[:meshCount] = mesh_count
        instance[:materialCount] = material_count
        instance[:meshes] = meshes
        instance[:materials] = materials
        instance[:meshMaterial] = mesh_material
        instance[:boneCount] = bone_count
        instance[:bones] = bones
        instance[:bindPose] = bind_pose
      end
    end

    def to_s
      "Raylib::Model##{object_id} transform=#{transform} mesh_count=#{mesh_count} material_count=#{material_count} meshes=#{meshes} materials=#{materials} mesh_material=#{mesh_material} bone_count=#{bone_count} bones=#{bones} bind_pose=#{bind_pose}"
    end

    # Local transform matrix
    # @return [Matrix] transform
    def transform = self[:transform]

    # Sets Local transform matrix
    def transform=(new_transform)
      self[:transform] = new_transform
    end

    # Number of meshes
    # @return [Integer] meshCount
    def mesh_count = self[:meshCount]

    # Sets Number of meshes
    def mesh_count=(new_mesh_count)
      self[:meshCount] = new_mesh_count
    end

    # Number of materials
    # @return [Integer] materialCount
    def material_count = self[:materialCount]

    # Sets Number of materials
    def material_count=(new_material_count)
      self[:materialCount] = new_material_count
    end

    # Meshes array
    # @return [Mesh *] meshes
    def meshes = self[:meshes]

    # Sets Meshes array
    def meshes=(new_meshes)
      self[:meshes] = new_meshes
    end

    # Materials array
    # @return [Material *] materials
    def materials = self[:materials]

    # Sets Materials array
    def materials=(new_materials)
      self[:materials] = new_materials
    end

    # Mesh material number
    # @return [int *] meshMaterial
    def mesh_material = self[:meshMaterial]

    # Sets Mesh material number
    def mesh_material=(new_mesh_material)
      self[:meshMaterial] = new_mesh_material
    end

    # Number of bones
    # @return [Integer] boneCount
    def bone_count = self[:boneCount]

    # Sets Number of bones
    def bone_count=(new_bone_count)
      self[:boneCount] = new_bone_count
    end

    # Bones information (skeleton)
    # @return [BoneInfo *] bones
    def bones = self[:bones]

    # Sets Bones information (skeleton)
    def bones=(new_bones)
      self[:bones] = new_bones
    end

    # Bones base transformation (pose)
    # @return [Transform *] bindPose
    def bind_pose = self[:bindPose]

    # Sets Bones base transformation (pose)
    def bind_pose=(new_bind_pose)
      self[:bindPose] = new_bind_pose
    end
  end
end
