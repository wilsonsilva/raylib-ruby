module Raylib
  # of those state-change happens (this is done in core module)
  class RlDrawCall < FFI::Struct
    layout(
      :mode, :int,            # Drawing mode: LINES, TRIANGLES, QUADS,
      :vertexCount, :int,     # Number of vertex of the draw,
      :vertexAlignment, :int, # Number of vertex required for index alignment (LINES, TRIANGLES),
      :textureId, :uint,      # Texture id to be used on the draw -> Use to create new draw call if changes
    )

    def self.create(mode, vertex_count, vertex_alignment, texture_id)
      new.tap do |instance|
        instance[:mode] = mode
        instance[:vertexCount] = vertex_count
        instance[:vertexAlignment] = vertex_alignment
        instance[:textureId] = texture_id
      end
    end

    def to_s
      "Raylib::RlDrawCall##{object_id} mode=#{mode} vertex_count=#{vertex_count} vertex_alignment=#{vertex_alignment} texture_id=#{texture_id}"
    end

    # Drawing mode: LINES, TRIANGLES, QUADS
    # @return [Integer] mode
    def mode = self[:mode]

    # Sets Drawing mode: LINES, TRIANGLES, QUADS
    def mode=(new_mode)
      self[:mode] = new_mode
    end

    # Number of vertex of the draw
    # @return [Integer] vertexCount
    def vertex_count = self[:vertexCount]

    # Sets Number of vertex of the draw
    def vertex_count=(new_vertex_count)
      self[:vertexCount] = new_vertex_count
    end

    # Number of vertex required for index alignment (LINES, TRIANGLES)
    # @return [Integer] vertexAlignment
    def vertex_alignment = self[:vertexAlignment]

    # Sets Number of vertex required for index alignment (LINES, TRIANGLES)
    def vertex_alignment=(new_vertex_alignment)
      self[:vertexAlignment] = new_vertex_alignment
    end

    # Texture id to be used on the draw -> Use to create new draw call if changes
    # @return [Integer] textureId
    def texture_id = self[:textureId]

    # Sets Texture id to be used on the draw -> Use to create new draw call if changes
    def texture_id=(new_texture_id)
      self[:textureId] = new_texture_id
    end
  end
end
