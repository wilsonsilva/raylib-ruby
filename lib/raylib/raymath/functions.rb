module Raylib
  # Clamp float value
  attach_function :clamp, :Clamp, [:float, :float, :float], :float

  # Calculate linear interpolation between two floats
  attach_function :lerp, :Lerp, [:float, :float, :float], :float

  # Normalize input value within input range
  attach_function :normalize, :Normalize, [:float, :float, :float], :float

  # Remap input value within input range to output range
  attach_function :remap, :Remap, [:float, :float, :float, :float, :float], :float

  # Wrap input value from min to max
  attach_function :wrap, :Wrap, [:float, :float, :float], :float

  # Check whether two given floats are almost equal
  attach_function :float_equals, :FloatEquals, [:float, :float], :int

  # Vector with components value 0.0f
  attach_function :vector2_zero, :Vector2Zero, [], Vector2.by_value

  # Vector with components value 1.0f
  attach_function :vector2_one, :Vector2One, [], Vector2.by_value

  # Add two vectors (v1 + v2)
  attach_function :vector2_add, :Vector2Add, [Vector2.by_value, Vector2.by_value], Vector2.by_value

  # Add vector and float value
  attach_function :vector2_add_value, :Vector2AddValue, [Vector2.by_value, :float], Vector2.by_value

  # Subtract two vectors (v1 - v2)
  attach_function :vector2_subtract, :Vector2Subtract, [Vector2.by_value, Vector2.by_value], Vector2.by_value

  # Subtract vector by float value
  attach_function :vector2_subtract_value, :Vector2SubtractValue, [Vector2.by_value, :float], Vector2.by_value

  # Calculate vector length
  attach_function :vector2_length, :Vector2Length, [Vector2.by_value], :float

  # Calculate vector square length
  attach_function :vector2_length_sqr, :Vector2LengthSqr, [Vector2.by_value], :float

  # Calculate two vectors dot product
  attach_function :vector2_dot_product, :Vector2DotProduct, [Vector2.by_value, Vector2.by_value], :float

  # Calculate distance between two vectors
  attach_function :vector2_distance, :Vector2Distance, [Vector2.by_value, Vector2.by_value], :float

  # Calculate square distance between two vectors
  attach_function :vector2_distance_sqr, :Vector2DistanceSqr, [Vector2.by_value, Vector2.by_value], :float

  # Calculate angle between two vectors
  attach_function :vector2_angle, :Vector2Angle, [Vector2.by_value, Vector2.by_value], :float

  # Calculate angle defined by a two vectors line
  attach_function :vector2_line_angle, :Vector2LineAngle, [Vector2.by_value, Vector2.by_value], :float

  # Scale vector (multiply by value)
  attach_function :vector2_scale, :Vector2Scale, [Vector2.by_value, :float], Vector2.by_value

  # Multiply vector by vector
  attach_function :vector2_multiply, :Vector2Multiply, [Vector2.by_value, Vector2.by_value], Vector2.by_value

  # Negate vector
  attach_function :vector2_negate, :Vector2Negate, [Vector2.by_value], Vector2.by_value

  # Divide vector by vector
  attach_function :vector2_divide, :Vector2Divide, [Vector2.by_value, Vector2.by_value], Vector2.by_value

  # Normalize provided vector
  attach_function :vector2_normalize, :Vector2Normalize, [Vector2.by_value], Vector2.by_value

  # Transforms a Vector2 by a given Matrix
  attach_function :vector2_transform, :Vector2Transform, [Vector2.by_value, Matrix.by_value], Vector2.by_value

  # Calculate linear interpolation between two vectors
  attach_function :vector2_lerp, :Vector2Lerp, [Vector2.by_value, Vector2.by_value, :float], Vector2.by_value

  # Calculate reflected vector to normal
  attach_function :vector2_reflect, :Vector2Reflect, [Vector2.by_value, Vector2.by_value], Vector2.by_value

  # Rotate vector by angle
  attach_function :vector2_rotate, :Vector2Rotate, [Vector2.by_value, :float], Vector2.by_value

  # Move Vector towards target
  attach_function :vector2_move_towards, :Vector2MoveTowards, [Vector2.by_value, Vector2.by_value, :float], Vector2.by_value

  # Invert the given vector
  attach_function :vector2_invert, :Vector2Invert, [Vector2.by_value], Vector2.by_value

  # Clamp the components of the vector between min and max values specified by the given vectors
  attach_function :vector2_clamp, :Vector2Clamp, [Vector2.by_value, Vector2.by_value, Vector2.by_value], Vector2.by_value

  # Clamp the magnitude of the vector between two values
  attach_function :vector2_clamp_value, :Vector2ClampValue, [Vector2.by_value, :float, :float], Vector2.by_value

  # Check whether two given vectors are almost equal
  attach_function :vector2_equals, :Vector2Equals, [Vector2.by_value, Vector2.by_value], :int

  # Vector with components value 0.0f
  attach_function :vector3_zero, :Vector3Zero, [], Vector3.by_value

  # Vector with components value 1.0f
  attach_function :vector3_one, :Vector3One, [], Vector3.by_value

  # Add two vectors
  attach_function :vector3_add, :Vector3Add, [Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Add vector and float value
  attach_function :vector3_add_value, :Vector3AddValue, [Vector3.by_value, :float], Vector3.by_value

  # Subtract two vectors
  attach_function :vector3_subtract, :Vector3Subtract, [Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Subtract vector by float value
  attach_function :vector3_subtract_value, :Vector3SubtractValue, [Vector3.by_value, :float], Vector3.by_value

  # Multiply vector by scalar
  attach_function :vector3_scale, :Vector3Scale, [Vector3.by_value, :float], Vector3.by_value

  # Multiply vector by vector
  attach_function :vector3_multiply, :Vector3Multiply, [Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Calculate two vectors cross product
  attach_function :vector3_cross_product, :Vector3CrossProduct, [Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Calculate one vector perpendicular vector
  attach_function :vector3_perpendicular, :Vector3Perpendicular, [Vector3.by_value], Vector3.by_value

  # Calculate vector length
  attach_function :vector3_length, :Vector3Length, [Vector3], :float

  # Calculate vector square length
  attach_function :vector3_length_sqr, :Vector3LengthSqr, [Vector3], :float

  # Calculate two vectors dot product
  attach_function :vector3_dot_product, :Vector3DotProduct, [Vector3.by_value, Vector3.by_value], :float

  # Calculate distance between two vectors
  attach_function :vector3_distance, :Vector3Distance, [Vector3.by_value, Vector3.by_value], :float

  # Calculate square distance between two vectors
  attach_function :vector3_distance_sqr, :Vector3DistanceSqr, [Vector3.by_value, Vector3.by_value], :float

  # Calculate angle between two vectors
  attach_function :vector3_angle, :Vector3Angle, [Vector3.by_value, Vector3.by_value], :float

  # Negate provided vector (invert direction)
  attach_function :vector3_negate, :Vector3Negate, [Vector3.by_value], Vector3.by_value

  # Divide vector by vector
  attach_function :vector3_divide, :Vector3Divide, [Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Normalize provided vector
  attach_function :vector3_normalize, :Vector3Normalize, [Vector3.by_value], Vector3.by_value

  # Orthonormalize provided vectors
  attach_function :vector3_ortho_normalize, :Vector3OrthoNormalize, [:pointer, :pointer], :void

  # Transforms a Vector3 by a given Matrix
  attach_function :vector3_transform, :Vector3Transform, [Vector3.by_value, Matrix.by_value], Vector3.by_value

  # Transform a vector by quaternion rotation
  attach_function :vector3_rotate_by_quaternion, :Vector3RotateByQuaternion, [Vector3.by_value, Quaternion.by_value], Vector3.by_value

  # Rotates a vector around an axis
  attach_function :vector3_rotate_by_axis_angle, :Vector3RotateByAxisAngle, [Vector3.by_value, Vector3.by_value, :float], Vector3.by_value

  # Calculate linear interpolation between two vectors
  attach_function :vector3_lerp, :Vector3Lerp, [Vector3.by_value, Vector3.by_value, :float], Vector3.by_value

  # Calculate reflected vector to normal
  attach_function :vector3_reflect, :Vector3Reflect, [Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Get min value for each pair of components
  attach_function :vector3_min, :Vector3Min, [Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Get max value for each pair of components
  attach_function :vector3_max, :Vector3Max, [Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
  attach_function :vector3_barycenter, :Vector3Barycenter, [Vector3.by_value, Vector3.by_value, Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Projects a Vector3 from screen space into object space
  attach_function :vector3_unproject, :Vector3Unproject, [Vector3.by_value, Matrix.by_value, Matrix.by_value], Vector3.by_value

  # Get Vector3 as float array
  attach_function :vector3_to_float_v, :Vector3ToFloatV, [Vector3.by_value], Float3.by_value

  # Invert the given vector
  attach_function :vector3_invert, :Vector3Invert, [Vector3.by_value], Vector3.by_value

  # Clamp the components of the vector between min and max values specified by the given vectors
  attach_function :vector3_clamp, :Vector3Clamp, [Vector3.by_value, Vector3.by_value, Vector3.by_value], Vector3.by_value

  # Clamp the magnitude of the vector between two values
  attach_function :vector3_clamp_value, :Vector3ClampValue, [Vector3.by_value, :float, :float], Vector3.by_value

  # Check whether two given vectors are almost equal
  attach_function :vector3_equals, :Vector3Equals, [Vector3.by_value, Vector3.by_value], :int

  # Compute the direction of a refracted ray where v specifies the normalized direction of the incoming ray, n specifies the normalized normal vector of the interface of two optical media, and r specifies the ratio of the refractive index of the medium from where the ray comes to the refractive index of the medium on the other side of the surface
  attach_function :vector3_refract, :Vector3Refract, [Vector3.by_value, Vector3.by_value, :float], Vector3.by_value

  # Compute matrix determinant
  attach_function :matrix_determinant, :MatrixDeterminant, [Matrix.by_value], :float

  # Get the trace of the matrix (sum of the values along the diagonal)
  attach_function :matrix_trace, :MatrixTrace, [Matrix.by_value], :float

  # Transposes provided matrix
  attach_function :matrix_transpose, :MatrixTranspose, [Matrix.by_value], Matrix.by_value

  # Invert provided matrix
  attach_function :matrix_invert, :MatrixInvert, [Matrix.by_value], Matrix.by_value

  # Get identity matrix
  attach_function :matrix_identity, :MatrixIdentity, [], Matrix.by_value

  # Add two matrices
  attach_function :matrix_add, :MatrixAdd, [Matrix.by_value, Matrix.by_value], Matrix.by_value

  # Subtract two matrices (left - right)
  attach_function :matrix_subtract, :MatrixSubtract, [Matrix.by_value, Matrix.by_value], Matrix.by_value

  # Get two matrix multiplication
  attach_function :matrix_multiply, :MatrixMultiply, [Matrix.by_value, Matrix.by_value], Matrix.by_value

  # Get translation matrix
  attach_function :matrix_translate, :MatrixTranslate, [:float, :float, :float], Matrix.by_value

  # Create rotation matrix from axis and angle
  attach_function :matrix_rotate, :MatrixRotate, [Vector3.by_value, :float], Matrix.by_value

  # Get x-rotation matrix
  attach_function :matrix_rotate_x, :MatrixRotateX, [:float], Matrix.by_value

  # Get y-rotation matrix
  attach_function :matrix_rotate_y, :MatrixRotateY, [:float], Matrix.by_value

  # Get z-rotation matrix
  attach_function :matrix_rotate_z, :MatrixRotateZ, [:float], Matrix.by_value

  # Get xyz-rotation matrix
  attach_function :matrix_rotate_xyz, :MatrixRotateXYZ, [Vector3.by_value], Matrix.by_value

  # Get zyx-rotation matrix
  attach_function :matrix_rotate_zyx, :MatrixRotateZYX, [Vector3.by_value], Matrix.by_value

  # Get scaling matrix
  attach_function :matrix_scale, :MatrixScale, [:float, :float, :float], Matrix.by_value

  # Get perspective projection matrix
  attach_function :matrix_frustum, :MatrixFrustum, [:double, :double, :double, :double, :double, :double], Matrix.by_value

  # Get perspective projection matrix
  attach_function :matrix_perspective, :MatrixPerspective, [:double, :double, :double, :double], Matrix.by_value

  # Get orthographic projection matrix
  attach_function :matrix_ortho, :MatrixOrtho, [:double, :double, :double, :double, :double, :double], Matrix.by_value

  # Get camera look-at matrix (view matrix)
  attach_function :matrix_look_at, :MatrixLookAt, [Vector3.by_value, Vector3.by_value, Vector3.by_value], Matrix.by_value

  # Get float array of matrix data
  attach_function :matrix_to_float_v, :MatrixToFloatV, [Matrix.by_value], Float16.by_value

  # Add two quaternions
  attach_function :quaternion_add, :QuaternionAdd, [Quaternion.by_value, Quaternion.by_value], Quaternion.by_value

  # Add quaternion and float value
  attach_function :quaternion_add_value, :QuaternionAddValue, [Quaternion.by_value, :float], Quaternion.by_value

  # Subtract two quaternions
  attach_function :quaternion_subtract, :QuaternionSubtract, [Quaternion.by_value, Quaternion.by_value], Quaternion.by_value

  # Subtract quaternion and float value
  attach_function :quaternion_subtract_value, :QuaternionSubtractValue, [Quaternion.by_value, :float], Quaternion.by_value

  # Get identity quaternion
  attach_function :quaternion_identity, :QuaternionIdentity, [], Quaternion.by_value

  # Computes the length of a quaternion
  attach_function :quaternion_length, :QuaternionLength, [Quaternion.by_value], :float

  # Normalize provided quaternion
  attach_function :quaternion_normalize, :QuaternionNormalize, [Quaternion.by_value], Quaternion.by_value

  # Invert provided quaternion
  attach_function :quaternion_invert, :QuaternionInvert, [Quaternion.by_value], Quaternion.by_value

  # Calculate two quaternion multiplication
  attach_function :quaternion_multiply, :QuaternionMultiply, [Quaternion.by_value, Quaternion.by_value], Quaternion.by_value

  # Scale quaternion by float value
  attach_function :quaternion_scale, :QuaternionScale, [Quaternion.by_value, :float], Quaternion.by_value

  # Divide two quaternions
  attach_function :quaternion_divide, :QuaternionDivide, [Quaternion.by_value, Quaternion.by_value], Quaternion.by_value

  # Calculate linear interpolation between two quaternions
  attach_function :quaternion_lerp, :QuaternionLerp, [Quaternion.by_value, Quaternion.by_value, :float], Quaternion.by_value

  # Calculate slerp-optimized interpolation between two quaternions
  attach_function :quaternion_nlerp, :QuaternionNlerp, [Quaternion.by_value, Quaternion.by_value, :float], Quaternion.by_value

  # Calculates spherical linear interpolation between two quaternions
  attach_function :quaternion_slerp, :QuaternionSlerp, [Quaternion.by_value, Quaternion.by_value, :float], Quaternion.by_value

  # Calculate quaternion based on the rotation from one vector to another
  attach_function :quaternion_from_vector3_to_vector3, :QuaternionFromVector3ToVector3, [Vector3.by_value, Vector3.by_value], Quaternion.by_value

  # Get a quaternion for a given rotation matrix
  attach_function :quaternion_from_matrix, :QuaternionFromMatrix, [Matrix.by_value], Quaternion.by_value

  # Get a matrix for a given quaternion
  attach_function :quaternion_to_matrix, :QuaternionToMatrix, [Quaternion.by_value], Matrix.by_value

  # Get rotation quaternion for an angle and axis
  attach_function :quaternion_from_axis_angle, :QuaternionFromAxisAngle, [Vector3.by_value, :float], Quaternion.by_value

  # Get the rotation angle and axis for a given quaternion
  attach_function :quaternion_to_axis_angle, :QuaternionToAxisAngle, [Quaternion.by_value, :pointer, :pointer], :void

  # Get the quaternion equivalent to Euler angles
  attach_function :quaternion_from_euler, :QuaternionFromEuler, [:float, :float, :float], Quaternion.by_value

  # Get the Euler angles equivalent to quaternion (roll, pitch, yaw)
  attach_function :quaternion_to_euler, :QuaternionToEuler, [Quaternion.by_value], Vector3.by_value

  # Transform a quaternion given a transformation matrix
  attach_function :quaternion_transform, :QuaternionTransform, [Quaternion.by_value, Matrix.by_value], Quaternion.by_value

  # Check whether two given quaternions are almost equal
  attach_function :quaternion_equals, :QuaternionEquals, [Quaternion.by_value, Quaternion.by_value], :int
end
