module Raylib
  # Dynamic vertex buffers (position + texcoords + colors + indices arrays)
  class RlVertexBuffer < FFI::Struct
    layout(
      :elementCount, :int,  # Number of elements in the buffer (QUADS),
      :vertices, :pointer,  # Vertex position (XYZ - 3 components per vertex) (shader-location = 0),
      :texcoords, :pointer, # Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1),
      :colors, :pointer,    # Vertex colors (RGBA - 4 components per vertex) (shader-location = 3),
      :indices, :pointer,   # Vertex indices (in case vertex data comes indexed) (6 indices per quad),
      :vaoId, :uint,        # OpenGL Vertex Array Object id,
      :vboId, [:uint, 4],   # OpenGL Vertex Buffer Objects id (4 types of vertex data)
    )

    def self.create(element_count, vertices, texcoords, colors, indices, vao_id, vbo_id)
      new.tap do |instance|
        instance[:elementCount] = element_count
        instance[:vertices] = vertices
        instance[:texcoords] = texcoords
        instance[:colors] = colors
        instance[:indices] = indices
        instance[:vaoId] = vao_id
        instance[:vboId] = vbo_id
      end
    end

    def to_s
      "Raylib::RlVertexBuffer##{object_id} element_count=#{element_count} vertices=#{vertices} texcoords=#{texcoords} colors=#{colors} indices=#{indices} vao_id=#{vao_id} vbo_id=#{vbo_id}"
    end

    # Number of elements in the buffer (QUADS)
    # @return [Integer] elementCount
    def element_count = self[:elementCount]

    # Sets Number of elements in the buffer (QUADS)
    def element_count=(new_element_count)
      self[:elementCount] = new_element_count
    end

    # Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    # @return [float *] vertices
    def vertices = self[:vertices]

    # Sets Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    def vertices=(new_vertices)
      self[:vertices] = new_vertices
    end

    # Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    # @return [float *] texcoords
    def texcoords = self[:texcoords]

    # Sets Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    def texcoords=(new_texcoords)
      self[:texcoords] = new_texcoords
    end

    # Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    # @return [unsigned char *] colors
    def colors = self[:colors]

    # Sets Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    def colors=(new_colors)
      self[:colors] = new_colors
    end

    # Vertex indices (in case vertex data comes indexed) (6 indices per quad)
    # @return [unsigned int *] indices
    def indices = self[:indices]

    # Sets Vertex indices (in case vertex data comes indexed) (6 indices per quad)
    def indices=(new_indices)
      self[:indices] = new_indices
    end

    # OpenGL Vertex Array Object id
    # @return [Integer] vaoId
    def vao_id = self[:vaoId]

    # Sets OpenGL Vertex Array Object id
    def vao_id=(new_vao_id)
      self[:vaoId] = new_vao_id
    end

    # OpenGL Vertex Buffer Objects id (4 types of vertex data)
    # @return [unsigned int[4]] vboId
    def vbo_id = self[:vboId]

    # Sets OpenGL Vertex Buffer Objects id (4 types of vertex data)
    def vbo_id=(new_vbo_id)
      self[:vboId] = new_vbo_id
    end
  end
end
