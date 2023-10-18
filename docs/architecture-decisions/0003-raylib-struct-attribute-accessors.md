# 3. Raylib::Struct attribute accessors

Date: 2023-09-24

## Status

Rejected

## Context

Consider this massive struct:

```ruby
# Matrix, 4x4 components, column major, OpenGL style, right-handed
class Matrix < Struct
  layout :m0, :float,  :m4, :float,  :m8, :float,  :m12, :float,  # Matrix first row (4 components)
         :m1, :float,  :m5, :float,  :m9, :float,  :m13, :float,  # Matrix second row (4 components)
         :m2, :float,  :m6, :float,  :m10, :float, :m14, :float,  # Matrix third row (4 components)
         :m3, :float,  :m7, :float,  :m11, :float, :m15, :float   # Matrix fourth row (4 components)
end
```

In order to access its members via attribute accessors, we must define them manually. That requires a lot of typing:

```ruby
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

  def m0 = self[:m0]

  def m0=(new_m0)
    self[:m0] = new_m0
  end

  def m4 = self[:m4]

  def m4=(new_m4)
    self[:m4] = new_m4
  end

  def m8 = self[:m8]

  def m8=(new_m8)
    self[:m8] = new_m8
  end

  def m12 = self[:m12]

  def m12=(new_m12)
    self[:m12] = new_m12
  end

  def m1 = self[:m1]

  def m1=(new_m1)
    self[:m1] = new_m1
  end

  def m5 = self[:m5]

  def m5=(new_m5)
    self[:m5] = new_m5
  end

  def m9 = self[:m9]

  def m9=(new_m9)
    self[:m9] = new_m9
  end

  def m13 = self[:m13]

  def m13=(new_m13)
    self[:m13] = new_m13
  end

  def m2 = self[:m2]

  def m2=(new_m2)
    self[:m2] = new_m2
  end

  def m6 = self[:m6]

  def m6=(new_m6)
    self[:m6] = new_m6
  end

  def m10 = self[:m10]

  def m10=(new_m10)
    self[:m10] = new_m10
  end

  def m14 = self[:m14]

  def m14=(new_m14)
    self[:m14] = new_m14
  end

  def m3 = self[:m3]

  def m3=(new_m3)
    self[:m3] = new_m3
  end

  def m7 = self[:m7]

  def m7=(new_m7)
    self[:m7] = new_m7
  end

  def m11 = self[:m11]

  def m11=(new_m11)
    self[:m11] = new_m11
  end

  def m15 = self[:m15]

  def m15=(new_m15)
    self[:m15] = new_m15
  end
end
```

By introducing a base `Raylib::Struct` class with helper methods, we can define attribute accessors for all child
structs. A naive implementation would look like this:

```ruby
module Raylib
  class Struct < FFI::Struct
    def self.define_attribute_accessors(*attrs)
      attrs.each { |attr| attr_accessor attr }
    end
  end
end
```

This does not work because `attr_accessor` does not define attribute accessors for FFI structs:

```sh
> $ ./bin/console
irb(main):001:0> m = Raylib::Matrix.new
=> #<Raylib::Matrix:0x0000000103a5c568>
irb(main):002:0> m.m0
=> nil
irb(main):003:0> m.m0 = 'Not A Float'
=> "Not A Float"
irb(main):004:0> v.m0
=> "Not A Float"
```

Another approach is to define methods that use the square brackets syntax:

```ruby
module Raylib
  class Struct < FFI::Struct
    def self.define_attribute_accessors(*attrs)
      attrs.each do |attr|
        define_method attr do
          self[attr]
        end
    
        define_method "#{attr}=" do |value|
          self[attr] = value
        end
      end
    end
  end
end
```

This reduces substantially the amount of code we need to write:

```ruby
module Raylib
  class Matrix
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

    define_attribute_accessors(:m0, :m4, :m8, :m12,
                               :m1, :m5, :m9, :m13,
                               :m2, :m6, :m10, :m14,
                               :m3, :m7, :m11, :m15)
  end
end
```

And it is type safe:

```sh
> $ ./bin/console                                                                                                                                                                
irb(main):001:0> v = Raylib::Matrix.new
=> #<Raylib::Matrix:0x00000001078fcde0>
irb(main):002:0> m.m0
=> 0.0
irb(main):003:0> m.m0 = 'Not A Float'
/Users/wilson/projects/rb/raylib/lib/raylib/core/structs/matrix.rb:14:in `[]=': no implicit conversion to float from string (TypeError)

          self[attr] = value
               ^^^^^^^^^^^^^
	from /Users/wilson/projects/rb/raylib/lib/raylib/core/structs/matrix.rb:14:in `block (2 levels) in define_attribute_accessors'
	from (irb):3:in `<main>'
	from ./bin/console:11:in `<main>'
irb(main):004:0> m.m0
=> 0.0
```

## Decision

There's a strong chance that the code will be generated. There's no need for this additional abstraction.

## Consequences

### Negative

- Adds another abstraction
- It is likely to have performance implications

### Positive

- Reduces the amount of code
