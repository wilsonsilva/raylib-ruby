module Raylib
  # Sound
  class Sound < FFI::Struct
    layout(
      :stream, AudioStream, # Audio stream,
      :frameCount, :uint,   # Total number of frames (considering channels)
    )

    def self.create(stream, frame_count)
      new.tap do |instance|
        instance[:stream] = stream
        instance[:frameCount] = frame_count
      end
    end

    def to_s
      "Raylib::Sound##{object_id} stream=#{stream} frame_count=#{frame_count}"
    end

    # Audio stream
    # @return [AudioStream] stream
    def stream = self[:stream]

    # Sets Audio stream
    def stream=(new_stream)
      self[:stream] = new_stream
    end

    # Total number of frames (considering channels)
    # @return [Integer] frameCount
    def frame_count = self[:frameCount]

    # Sets Total number of frames (considering channels)
    def frame_count=(new_frame_count)
      self[:frameCount] = new_frame_count
    end
  end
end
