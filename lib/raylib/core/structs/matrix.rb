module Raylib
  # Matrix, 4x4 components, column major, OpenGL style, right-handed
  class Matrix < FFI::Struct
    layout(
      :m0, :float,  # Matrix first row (4 components),
      :m4, :float,  # Matrix first row (4 components),
      :m8, :float,  # Matrix first row (4 components),
      :m12, :float, # Matrix first row (4 components),
      :m1, :float,  # Matrix second row (4 components),
      :m5, :float,  # Matrix second row (4 components),
      :m9, :float,  # Matrix second row (4 components),
      :m13, :float, # Matrix second row (4 components),
      :m2, :float,  # Matrix third row (4 components),
      :m6, :float,  # Matrix third row (4 components),
      :m10, :float, # Matrix third row (4 components),
      :m14, :float, # Matrix third row (4 components),
      :m3, :float,  # Matrix fourth row (4 components),
      :m7, :float,  # Matrix fourth row (4 components),
      :m11, :float, # Matrix fourth row (4 components),
      :m15, :float, # Matrix fourth row (4 components)
    )

    def self.create(m0, m4, m8, m12, m1, m5, m9, m13, m2, m6, m10, m14, m3, m7, m11, m15)
      new.tap do |instance|
        instance[:m0] = m0
        instance[:m4] = m4
        instance[:m8] = m8
        instance[:m12] = m12
        instance[:m1] = m1
        instance[:m5] = m5
        instance[:m9] = m9
        instance[:m13] = m13
        instance[:m2] = m2
        instance[:m6] = m6
        instance[:m10] = m10
        instance[:m14] = m14
        instance[:m3] = m3
        instance[:m7] = m7
        instance[:m11] = m11
        instance[:m15] = m15
      end
    end

    def to_s
      "Raylib::Matrix##{object_id} m0=#{m0} m4=#{m4} m8=#{m8} m12=#{m12} m1=#{m1} m5=#{m5} m9=#{m9} m13=#{m13} m2=#{m2} m6=#{m6} m10=#{m10} m14=#{m14} m3=#{m3} m7=#{m7} m11=#{m11} m15=#{m15}"
    end

    # Matrix first row (4 components)
    # @return [Float] m0
    def m0 = self[:m0]

    # Sets Matrix first row (4 components)
    def m0=(new_m0)
      self[:m0] = new_m0
    end

    # Matrix first row (4 components)
    # @return [Float] m4
    def m4 = self[:m4]

    # Sets Matrix first row (4 components)
    def m4=(new_m4)
      self[:m4] = new_m4
    end

    # Matrix first row (4 components)
    # @return [Float] m8
    def m8 = self[:m8]

    # Sets Matrix first row (4 components)
    def m8=(new_m8)
      self[:m8] = new_m8
    end

    # Matrix first row (4 components)
    # @return [Float] m12
    def m12 = self[:m12]

    # Sets Matrix first row (4 components)
    def m12=(new_m12)
      self[:m12] = new_m12
    end

    # Matrix second row (4 components)
    # @return [Float] m1
    def m1 = self[:m1]

    # Sets Matrix second row (4 components)
    def m1=(new_m1)
      self[:m1] = new_m1
    end

    # Matrix second row (4 components)
    # @return [Float] m5
    def m5 = self[:m5]

    # Sets Matrix second row (4 components)
    def m5=(new_m5)
      self[:m5] = new_m5
    end

    # Matrix second row (4 components)
    # @return [Float] m9
    def m9 = self[:m9]

    # Sets Matrix second row (4 components)
    def m9=(new_m9)
      self[:m9] = new_m9
    end

    # Matrix second row (4 components)
    # @return [Float] m13
    def m13 = self[:m13]

    # Sets Matrix second row (4 components)
    def m13=(new_m13)
      self[:m13] = new_m13
    end

    # Matrix third row (4 components)
    # @return [Float] m2
    def m2 = self[:m2]

    # Sets Matrix third row (4 components)
    def m2=(new_m2)
      self[:m2] = new_m2
    end

    # Matrix third row (4 components)
    # @return [Float] m6
    def m6 = self[:m6]

    # Sets Matrix third row (4 components)
    def m6=(new_m6)
      self[:m6] = new_m6
    end

    # Matrix third row (4 components)
    # @return [Float] m10
    def m10 = self[:m10]

    # Sets Matrix third row (4 components)
    def m10=(new_m10)
      self[:m10] = new_m10
    end

    # Matrix third row (4 components)
    # @return [Float] m14
    def m14 = self[:m14]

    # Sets Matrix third row (4 components)
    def m14=(new_m14)
      self[:m14] = new_m14
    end

    # Matrix fourth row (4 components)
    # @return [Float] m3
    def m3 = self[:m3]

    # Sets Matrix fourth row (4 components)
    def m3=(new_m3)
      self[:m3] = new_m3
    end

    # Matrix fourth row (4 components)
    # @return [Float] m7
    def m7 = self[:m7]

    # Sets Matrix fourth row (4 components)
    def m7=(new_m7)
      self[:m7] = new_m7
    end

    # Matrix fourth row (4 components)
    # @return [Float] m11
    def m11 = self[:m11]

    # Sets Matrix fourth row (4 components)
    def m11=(new_m11)
      self[:m11] = new_m11
    end

    # Matrix fourth row (4 components)
    # @return [Float] m15
    def m15 = self[:m15]

    # Sets Matrix fourth row (4 components)
    def m15=(new_m15)
      self[:m15] = new_m15
    end
  end
end
