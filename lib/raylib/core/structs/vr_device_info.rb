module Raylib
  # VrDeviceInfo, Head-Mounted-Display device parameters
  class VrDeviceInfo < FFI::Struct
    layout(
      :hResolution, :int,                 # Horizontal resolution in pixels,
      :vResolution, :int,                 # Vertical resolution in pixels,
      :hScreenSize, :float,               # Horizontal size in meters,
      :vScreenSize, :float,               # Vertical size in meters,
      :vScreenCenter, :float,             # Screen center in meters,
      :eyeToScreenDistance, :float,       # Distance between eye and display in meters,
      :lensSeparationDistance, :float,    # Lens separation distance in meters,
      :interpupillaryDistance, :float,    # IPD (distance between pupils) in meters,
      :lensDistortionValues, [:float, 4], # Lens distortion constant parameters,
      :chromaAbCorrection, [:float, 4],   # Chromatic aberration correction parameters
    )

    def self.create(h_resolution, v_resolution, h_screen_size, v_screen_size, v_screen_center, eye_to_screen_distance, lens_separation_distance, interpupillary_distance, lens_distortion_values, chroma_ab_correction)
      new.tap do |instance|
        instance[:hResolution] = h_resolution
        instance[:vResolution] = v_resolution
        instance[:hScreenSize] = h_screen_size
        instance[:vScreenSize] = v_screen_size
        instance[:vScreenCenter] = v_screen_center
        instance[:eyeToScreenDistance] = eye_to_screen_distance
        instance[:lensSeparationDistance] = lens_separation_distance
        instance[:interpupillaryDistance] = interpupillary_distance
        instance[:lensDistortionValues] = lens_distortion_values
        instance[:chromaAbCorrection] = chroma_ab_correction
      end
    end

    def to_s
      "Raylib::VrDeviceInfo##{object_id} h_resolution=#{h_resolution} v_resolution=#{v_resolution} h_screen_size=#{h_screen_size} v_screen_size=#{v_screen_size} v_screen_center=#{v_screen_center} eye_to_screen_distance=#{eye_to_screen_distance} lens_separation_distance=#{lens_separation_distance} interpupillary_distance=#{interpupillary_distance} lens_distortion_values=#{lens_distortion_values} chroma_ab_correction=#{chroma_ab_correction}"
    end

    # Horizontal resolution in pixels
    # @return [Integer] hResolution
    def h_resolution = self[:hResolution]

    # Sets Horizontal resolution in pixels
    def h_resolution=(new_h_resolution)
      self[:hResolution] = new_h_resolution
    end

    # Vertical resolution in pixels
    # @return [Integer] vResolution
    def v_resolution = self[:vResolution]

    # Sets Vertical resolution in pixels
    def v_resolution=(new_v_resolution)
      self[:vResolution] = new_v_resolution
    end

    # Horizontal size in meters
    # @return [Float] hScreenSize
    def h_screen_size = self[:hScreenSize]

    # Sets Horizontal size in meters
    def h_screen_size=(new_h_screen_size)
      self[:hScreenSize] = new_h_screen_size
    end

    # Vertical size in meters
    # @return [Float] vScreenSize
    def v_screen_size = self[:vScreenSize]

    # Sets Vertical size in meters
    def v_screen_size=(new_v_screen_size)
      self[:vScreenSize] = new_v_screen_size
    end

    # Screen center in meters
    # @return [Float] vScreenCenter
    def v_screen_center = self[:vScreenCenter]

    # Sets Screen center in meters
    def v_screen_center=(new_v_screen_center)
      self[:vScreenCenter] = new_v_screen_center
    end

    # Distance between eye and display in meters
    # @return [Float] eyeToScreenDistance
    def eye_to_screen_distance = self[:eyeToScreenDistance]

    # Sets Distance between eye and display in meters
    def eye_to_screen_distance=(new_eye_to_screen_distance)
      self[:eyeToScreenDistance] = new_eye_to_screen_distance
    end

    # Lens separation distance in meters
    # @return [Float] lensSeparationDistance
    def lens_separation_distance = self[:lensSeparationDistance]

    # Sets Lens separation distance in meters
    def lens_separation_distance=(new_lens_separation_distance)
      self[:lensSeparationDistance] = new_lens_separation_distance
    end

    # IPD (distance between pupils) in meters
    # @return [Float] interpupillaryDistance
    def interpupillary_distance = self[:interpupillaryDistance]

    # Sets IPD (distance between pupils) in meters
    def interpupillary_distance=(new_interpupillary_distance)
      self[:interpupillaryDistance] = new_interpupillary_distance
    end

    # Lens distortion constant parameters
    # @return [float[4]] lensDistortionValues
    def lens_distortion_values = self[:lensDistortionValues]

    # Sets Lens distortion constant parameters
    def lens_distortion_values=(new_lens_distortion_values)
      self[:lensDistortionValues] = new_lens_distortion_values
    end

    # Chromatic aberration correction parameters
    # @return [float[4]] chromaAbCorrection
    def chroma_ab_correction = self[:chromaAbCorrection]

    # Sets Chromatic aberration correction parameters
    def chroma_ab_correction=(new_chroma_ab_correction)
      self[:chromaAbCorrection] = new_chroma_ab_correction
    end
  end
end
