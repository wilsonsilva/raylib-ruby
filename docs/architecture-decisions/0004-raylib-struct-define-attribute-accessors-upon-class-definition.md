# 4. Raylib::Struct define attribute accessors upon class definition

Date: 2023-09-24

## Status

Rejected

## Context

Building on top of [Raylib::Struct attribute accessors](0003-raylib-struct-attribute-accessors.md), we can define
attribute accessors upon class definition and avoid having to define them manually:

```ruby
module Raylib
  extend FFI::Library

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
    
    def self.layout(*args)
      super

      # Infer attributes from the layout arguments
      attributes = args.each_slice(2).map(&:first)
      define_attribute_accessors(*attributes)
    end
  end
end
```

So we go from this:

```ruby
module Raylib
  # Vector2, 2 components
  class Vector2 < Struct
    layout :x, :float, # Vector x component
           :y, :float  # Vector y component
    
    def x
      self[:x]
    end
    
    def x=(value)
      self[:x] = value
    end
    
    def y
      self[:y]
    end
    
    def y=(value)
      self[:y] = value
    end
  end
end
```

To this:

```ruby
module Raylib
  # Vector2, 2 components
  class Vector2 < Struct
    layout :x, :float, # Vector x component
           :y, :float  # Vector y component
    
    attributes :x, :y
  end
end
```

To this:

```ruby
module Raylib
  # Vector2, 2 components
  class Vector2 < Struct
    layout :x, :float, # Vector x component
           :y, :float  # Vector y component
  end
end
```

## Decision

There's a strong chance that the code will be generated. There's no need for this additional abstraction.

## Consequences

### Negative

- Adds another abstraction
- It is likely to have performance implications

### Positive

- Reduces the amount of code
