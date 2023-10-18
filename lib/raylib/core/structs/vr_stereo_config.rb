module Raylib
  # VrStereoConfig, VR stereo rendering configuration for simulator
  class VrStereoConfig < FFI::Struct
    layout(
      :projection, [Matrix, 2],        # VR projection matrices (per eye),
      :viewOffset, [Matrix, 2],        # VR view offset matrices (per eye),
      :leftLensCenter, [:float, 2],    # VR left lens center,
      :rightLensCenter, [:float, 2],   # VR right lens center,
      :leftScreenCenter, [:float, 2],  # VR left screen center,
      :rightScreenCenter, [:float, 2], # VR right screen center,
      :scale, [:float, 2],             # VR distortion scale,
      :scaleIn, [:float, 2],           # VR distortion scale in
    )

    def self.create(projection, view_offset, left_lens_center, right_lens_center, left_screen_center, right_screen_center, scale, scale_in)
      new.tap do |instance|
        instance[:projection] = projection
        instance[:viewOffset] = view_offset
        instance[:leftLensCenter] = left_lens_center
        instance[:rightLensCenter] = right_lens_center
        instance[:leftScreenCenter] = left_screen_center
        instance[:rightScreenCenter] = right_screen_center
        instance[:scale] = scale
        instance[:scaleIn] = scale_in
      end
    end

    def to_s
      "Raylib::VrStereoConfig##{object_id} projection=#{projection} view_offset=#{view_offset} left_lens_center=#{left_lens_center} right_lens_center=#{right_lens_center} left_screen_center=#{left_screen_center} right_screen_center=#{right_screen_center} scale=#{scale} scale_in=#{scale_in}"
    end

    # VR projection matrices (per eye)
    # @return [Matrix[2]] projection
    def projection = self[:projection]

    # Sets VR projection matrices (per eye)
    def projection=(new_projection)
      self[:projection] = new_projection
    end

    # VR view offset matrices (per eye)
    # @return [Matrix[2]] viewOffset
    def view_offset = self[:viewOffset]

    # Sets VR view offset matrices (per eye)
    def view_offset=(new_view_offset)
      self[:viewOffset] = new_view_offset
    end

    # VR left lens center
    # @return [float[2]] leftLensCenter
    def left_lens_center = self[:leftLensCenter]

    # Sets VR left lens center
    def left_lens_center=(new_left_lens_center)
      self[:leftLensCenter] = new_left_lens_center
    end

    # VR right lens center
    # @return [float[2]] rightLensCenter
    def right_lens_center = self[:rightLensCenter]

    # Sets VR right lens center
    def right_lens_center=(new_right_lens_center)
      self[:rightLensCenter] = new_right_lens_center
    end

    # VR left screen center
    # @return [float[2]] leftScreenCenter
    def left_screen_center = self[:leftScreenCenter]

    # Sets VR left screen center
    def left_screen_center=(new_left_screen_center)
      self[:leftScreenCenter] = new_left_screen_center
    end

    # VR right screen center
    # @return [float[2]] rightScreenCenter
    def right_screen_center = self[:rightScreenCenter]

    # Sets VR right screen center
    def right_screen_center=(new_right_screen_center)
      self[:rightScreenCenter] = new_right_screen_center
    end

    # VR distortion scale
    # @return [float[2]] scale
    def scale = self[:scale]

    # Sets VR distortion scale
    def scale=(new_scale)
      self[:scale] = new_scale
    end

    # VR distortion scale in
    # @return [float[2]] scaleIn
    def scale_in = self[:scaleIn]

    # Sets VR distortion scale in
    def scale_in=(new_scale_in)
      self[:scaleIn] = new_scale_in
    end
  end
end
