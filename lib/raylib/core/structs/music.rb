module Raylib
  # Music, audio stream, anything longer than ~10 seconds should be streamed
  class Music < FFI::Struct
    layout(
      :stream, AudioStream, # Audio stream,
      :frameCount, :uint,   # Total number of frames (considering channels),
      :looping, :bool,      # Music looping enable,
      :ctxType, :int,       # Type of music context (audio filetype),
      :ctxData, :pointer,   # Audio context data, depends on type
    )

    def self.create(stream, frame_count, looping, ctx_type, ctx_data)
      new.tap do |instance|
        instance[:stream] = stream
        instance[:frameCount] = frame_count
        instance[:looping] = looping
        instance[:ctxType] = ctx_type
        instance[:ctxData] = ctx_data
      end
    end

    def to_s
      "Raylib::Music##{object_id} stream=#{stream} frame_count=#{frame_count} looping=#{looping} ctx_type=#{ctx_type} ctx_data=#{ctx_data}"
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

    # Music looping enable
    # @return [bool] looping
    def looping = self[:looping]

    # Sets Music looping enable
    def looping=(new_looping)
      self[:looping] = new_looping
    end

    # Type of music context (audio filetype)
    # @return [Integer] ctxType
    def ctx_type = self[:ctxType]

    # Sets Type of music context (audio filetype)
    def ctx_type=(new_ctx_type)
      self[:ctxType] = new_ctx_type
    end

    # Audio context data, depends on type
    # @return [void *] ctxData
    def ctx_data = self[:ctxData]

    # Sets Audio context data, depends on type
    def ctx_data=(new_ctx_data)
      self[:ctxData] = new_ctx_data
    end
  end
end
