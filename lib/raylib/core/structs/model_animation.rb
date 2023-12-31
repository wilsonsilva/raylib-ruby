module Raylib
  # ModelAnimation
  class ModelAnimation < FFI::Struct
    layout(
      :boneCount, :int,      # Number of bones,
      :frameCount, :int,     # Number of animation frames,
      :bones, :pointer,      # Bones information (skeleton),
      :framePoses, :pointer, # Poses array by frame
    )

    def self.create(bone_count, frame_count, bones, frame_poses)
      new.tap do |instance|
        instance[:boneCount] = bone_count
        instance[:frameCount] = frame_count
        instance[:bones] = bones
        instance[:framePoses] = frame_poses
      end
    end

    def to_s
      "Raylib::ModelAnimation##{object_id} bone_count=#{bone_count} frame_count=#{frame_count} bones=#{bones} frame_poses=#{frame_poses}"
    end

    # Number of bones
    # @return [Integer] boneCount
    def bone_count = self[:boneCount]

    # Sets Number of bones
    def bone_count=(new_bone_count)
      self[:boneCount] = new_bone_count
    end

    # Number of animation frames
    # @return [Integer] frameCount
    def frame_count = self[:frameCount]

    # Sets Number of animation frames
    def frame_count=(new_frame_count)
      self[:frameCount] = new_frame_count
    end

    # Bones information (skeleton)
    # @return [BoneInfo *] bones
    def bones = self[:bones]

    # Sets Bones information (skeleton)
    def bones=(new_bones)
      self[:bones] = new_bones
    end

    # Poses array by frame
    # @return [Transform **] framePoses
    def frame_poses = self[:framePoses]

    # Sets Poses array by frame
    def frame_poses=(new_frame_poses)
      self[:framePoses] = new_frame_poses
    end
  end
end
