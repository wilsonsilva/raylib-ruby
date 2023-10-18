module Raylib
  # rlRenderBatch type
  class RlRenderBatch < FFI::Struct
    layout(
      :bufferCount, :int,      # Number of vertex buffers (multi-buffering support),
      :currentBuffer, :int,    # Current buffer tracking in case of multi-buffering,
      :vertexBuffer, :pointer, # Dynamic buffer(s) for vertex data,
      :draws, :pointer,        # Draw calls array, depends on textureId,
      :drawCounter, :int,      # Draw calls counter,
      :currentDepth, :float,   # Current depth value for next draw
    )

    def self.create(buffer_count, current_buffer, vertex_buffer, draws, draw_counter, current_depth)
      new.tap do |instance|
        instance[:bufferCount] = buffer_count
        instance[:currentBuffer] = current_buffer
        instance[:vertexBuffer] = vertex_buffer
        instance[:draws] = draws
        instance[:drawCounter] = draw_counter
        instance[:currentDepth] = current_depth
      end
    end

    def to_s
      "Raylib::RlRenderBatch##{object_id} buffer_count=#{buffer_count} current_buffer=#{current_buffer} vertex_buffer=#{vertex_buffer} draws=#{draws} draw_counter=#{draw_counter} current_depth=#{current_depth}"
    end

    # Number of vertex buffers (multi-buffering support)
    # @return [Integer] bufferCount
    def buffer_count = self[:bufferCount]

    # Sets Number of vertex buffers (multi-buffering support)
    def buffer_count=(new_buffer_count)
      self[:bufferCount] = new_buffer_count
    end

    # Current buffer tracking in case of multi-buffering
    # @return [Integer] currentBuffer
    def current_buffer = self[:currentBuffer]

    # Sets Current buffer tracking in case of multi-buffering
    def current_buffer=(new_current_buffer)
      self[:currentBuffer] = new_current_buffer
    end

    # Dynamic buffer(s) for vertex data
    # @return [rlVertexBuffer *] vertexBuffer
    def vertex_buffer = self[:vertexBuffer]

    # Sets Dynamic buffer(s) for vertex data
    def vertex_buffer=(new_vertex_buffer)
      self[:vertexBuffer] = new_vertex_buffer
    end

    # Draw calls array, depends on textureId
    # @return [rlDrawCall *] draws
    def draws = self[:draws]

    # Sets Draw calls array, depends on textureId
    def draws=(new_draws)
      self[:draws] = new_draws
    end

    # Draw calls counter
    # @return [Integer] drawCounter
    def draw_counter = self[:drawCounter]

    # Sets Draw calls counter
    def draw_counter=(new_draw_counter)
      self[:drawCounter] = new_draw_counter
    end

    # Current depth value for next draw
    # @return [Float] currentDepth
    def current_depth = self[:currentDepth]

    # Sets Current depth value for next draw
    def current_depth=(new_current_depth)
      self[:currentDepth] = new_current_depth
    end
  end
end
