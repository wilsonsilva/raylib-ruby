module Raylib
  # AudioStream, custom audio stream
  class AudioStream < FFI::Struct
    layout(
      :buffer, :pointer,    # Pointer to internal data used by the audio system,
      :processor, :pointer, # Pointer to internal data processor, useful for audio effects,
      :sampleRate, :uint,   # Frequency (samples per second),
      :sampleSize, :uint,   # Bit depth (bits per sample): 8, 16, 32 (24 not supported),
      :channels, :uint,     # Number of channels (1-mono, 2-stereo, ...)
    )

    def self.create(buffer, processor, sample_rate, sample_size, channels)
      new.tap do |instance|
        instance[:buffer] = buffer
        instance[:processor] = processor
        instance[:sampleRate] = sample_rate
        instance[:sampleSize] = sample_size
        instance[:channels] = channels
      end
    end

    def to_s
      "Raylib::AudioStream##{object_id} buffer=#{buffer} processor=#{processor} sample_rate=#{sample_rate} sample_size=#{sample_size} channels=#{channels}"
    end

    # Pointer to internal data used by the audio system
    # @return [rAudioBuffer *] buffer
    def buffer = self[:buffer]

    # Sets Pointer to internal data used by the audio system
    def buffer=(new_buffer)
      self[:buffer] = new_buffer
    end

    # Pointer to internal data processor, useful for audio effects
    # @return [rAudioProcessor *] processor
    def processor = self[:processor]

    # Sets Pointer to internal data processor, useful for audio effects
    def processor=(new_processor)
      self[:processor] = new_processor
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
  end
end
