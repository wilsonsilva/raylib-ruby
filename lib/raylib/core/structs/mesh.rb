module Raylib
  # Mesh, vertex data and vao/vbo
  class Mesh < FFI::Struct
    layout(
      :vertexCount, :int,      # Number of vertices stored in arrays,
      :triangleCount, :int,    # Number of triangles stored (indexed or not),
      :vertices, :pointer,     # Vertex position (XYZ - 3 components per vertex) (shader-location = 0),
      :texcoords, :pointer,    # Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1),
      :texcoords2, :pointer,   # Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5),
      :normals, :pointer,      # Vertex normals (XYZ - 3 components per vertex) (shader-location = 2),
      :tangents, :pointer,     # Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4),
      :colors, :pointer,       # Vertex colors (RGBA - 4 components per vertex) (shader-location = 3),
      :indices, :pointer,      # Vertex indices (in case vertex data comes indexed),
      :animVertices, :pointer, # Animated vertex positions (after bones transformations),
      :animNormals, :pointer,  # Animated normals (after bones transformations),
      :boneIds, :pointer,      # Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning),
      :boneWeights, :pointer,  # Vertex bone weight, up to 4 bones influence by vertex (skinning),
      :vaoId, :uint,           # OpenGL Vertex Array Object id,
      :vboId, :pointer,        # OpenGL Vertex Buffer Objects id (default vertex data)
    )

    def self.create(vertex_count, triangle_count, vertices, texcoords, texcoords2, normals, tangents, colors, indices, anim_vertices, anim_normals, bone_ids, bone_weights, vao_id, vbo_id)
      new.tap do |instance|
        instance[:vertexCount] = vertex_count
        instance[:triangleCount] = triangle_count
        instance[:vertices] = vertices
        instance[:texcoords] = texcoords
        instance[:texcoords2] = texcoords2
        instance[:normals] = normals
        instance[:tangents] = tangents
        instance[:colors] = colors
        instance[:indices] = indices
        instance[:animVertices] = anim_vertices
        instance[:animNormals] = anim_normals
        instance[:boneIds] = bone_ids
        instance[:boneWeights] = bone_weights
        instance[:vaoId] = vao_id
        instance[:vboId] = vbo_id
      end
    end

    def to_s
      "Raylib::Mesh##{object_id} vertex_count=#{vertex_count} triangle_count=#{triangle_count} vertices=#{vertices} texcoords=#{texcoords} texcoords2=#{texcoords2} normals=#{normals} tangents=#{tangents} colors=#{colors} indices=#{indices} anim_vertices=#{anim_vertices} anim_normals=#{anim_normals} bone_ids=#{bone_ids} bone_weights=#{bone_weights} vao_id=#{vao_id} vbo_id=#{vbo_id}"
    end

    # Number of vertices stored in arrays
    # @return [Integer] vertexCount
    def vertex_count = self[:vertexCount]

    # Sets Number of vertices stored in arrays
    def vertex_count=(new_vertex_count)
      self[:vertexCount] = new_vertex_count
    end

    # Number of triangles stored (indexed or not)
    # @return [Integer] triangleCount
    def triangle_count = self[:triangleCount]

    # Sets Number of triangles stored (indexed or not)
    def triangle_count=(new_triangle_count)
      self[:triangleCount] = new_triangle_count
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

    # Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    # @return [float *] texcoords2
    def texcoords2 = self[:texcoords2]

    # Sets Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    def texcoords2=(new_texcoords2)
      self[:texcoords2] = new_texcoords2
    end

    # Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    # @return [float *] normals
    def normals = self[:normals]

    # Sets Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    def normals=(new_normals)
      self[:normals] = new_normals
    end

    # Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    # @return [float *] tangents
    def tangents = self[:tangents]

    # Sets Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    def tangents=(new_tangents)
      self[:tangents] = new_tangents
    end

    # Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    # @return [unsigned char *] colors
    def colors = self[:colors]

    # Sets Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    def colors=(new_colors)
      self[:colors] = new_colors
    end

    # Vertex indices (in case vertex data comes indexed)
    # @return [unsigned short *] indices
    def indices = self[:indices]

    # Sets Vertex indices (in case vertex data comes indexed)
    def indices=(new_indices)
      self[:indices] = new_indices
    end

    # Animated vertex positions (after bones transformations)
    # @return [float *] animVertices
    def anim_vertices = self[:animVertices]

    # Sets Animated vertex positions (after bones transformations)
    def anim_vertices=(new_anim_vertices)
      self[:animVertices] = new_anim_vertices
    end

    # Animated normals (after bones transformations)
    # @return [float *] animNormals
    def anim_normals = self[:animNormals]

    # Sets Animated normals (after bones transformations)
    def anim_normals=(new_anim_normals)
      self[:animNormals] = new_anim_normals
    end

    # Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
    # @return [unsigned char *] boneIds
    def bone_ids = self[:boneIds]

    # Sets Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
    def bone_ids=(new_bone_ids)
      self[:boneIds] = new_bone_ids
    end

    # Vertex bone weight, up to 4 bones influence by vertex (skinning)
    # @return [float *] boneWeights
    def bone_weights = self[:boneWeights]

    # Sets Vertex bone weight, up to 4 bones influence by vertex (skinning)
    def bone_weights=(new_bone_weights)
      self[:boneWeights] = new_bone_weights
    end

    # OpenGL Vertex Array Object id
    # @return [Integer] vaoId
    def vao_id = self[:vaoId]

    # Sets OpenGL Vertex Array Object id
    def vao_id=(new_vao_id)
      self[:vaoId] = new_vao_id
    end

    # OpenGL Vertex Buffer Objects id (default vertex data)
    # @return [unsigned int *] vboId
    def vbo_id = self[:vboId]

    # Sets OpenGL Vertex Buffer Objects id (default vertex data)
    def vbo_id=(new_vbo_id)
      self[:vboId] = new_vbo_id
    end
  end
end
