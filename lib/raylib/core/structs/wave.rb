module Raylib
  # Wave, audio wave data
  class Wave < FFI::Struct
    layout(
      :frameCount, :uint, # Total number of frames (considering channels),
      :sampleRate, :uint, # Frequency (samples per second),
      :sampleSize, :uint, # Bit depth (bits per sample): 8, 16, 32 (24 not supported),
      :channels, :uint,   # Number of channels (1-mono, 2-stereo, ...),
      :data, :pointer,    # Buffer data pointer
    )

    def self.create(frame_count, sample_rate, sample_size, channels, data)
      new.tap do |instance|
        instance[:frameCount] = frame_count
        instance[:sampleRate] = sample_rate
        instance[:sampleSize] = sample_size
        instance[:channels] = channels
        instance[:data] = data
      end
    end

    def to_s
      "Raylib::Wave##{object_id} frame_count=#{frame_count} sample_rate=#{sample_rate} sample_size=#{sample_size} channels=#{channels} data=#{data}"
    end

    # Total number of frames (considering channels)
    # @return [Integer] frameCount
    def frame_count = self[:frameCount]

    # Sets Total number of frames (considering channels)
    def frame_count=(new_frame_count)
      self[:frameCount] = new_frame_count
    end

    # Frequency (samples per second)
    # @return [Integer] sampleRate
    def sample_rate = self[:sampleRate]

    # Sets Frequency (samples per second)
    def sample_rate=(new_sample_rate)
      self[:sampleRate] = new_sample_rate
    end

    # Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    # @return [Integer] sampleSize
    def sample_size = self[:sampleSize]

    # Sets Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    def sample_size=(new_sample_size)
      self[:sampleSize] = new_sample_size
    end

    # Number of channels (1-mono, 2-stereo, ...)
    # @return [Integer] channels
    def channels = self[:channels]

    # Sets Number of channels (1-mono, 2-stereo, ...)
    def channels=(new_channels)
      self[:channels] = new_channels
    end

    # Buffer data pointer
    # @return [void *] data
    def data = self[:data]

    # Sets Buffer data pointer
    def data=(new_data)
      self[:data] = new_data
    end
  end
end
