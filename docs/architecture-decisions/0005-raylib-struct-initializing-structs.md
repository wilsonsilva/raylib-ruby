# 5. Raylib::Struct initializing structs

Date: 2023-09-24

## Status

Rejected

## Context

Consider this struct:

```ruby
require 'ffi'

module Raylib
  # Vector2, 2 components
  class Vector2 < FFI::Struct
    layout :x, :float, # Vector x component
           :y, :float  # Vector y component
  end
end
```

In order to initialize the struct, we must instantiate it first and then assign its attributes:

```ruby
position = Raylib::Vector2.new
position[:x] = 10
position[:y] = 20
```

Wouldn't it be nice if we could instantiate it with arguments?

```ruby
position = Raylib::Vector2.new(10, 20)
```

A naive approach would be to override the `initialize` method:

```ruby
require 'ffi'

module Raylib
  # Vector2, 2 components
  class Vector2 < FFI::Struct
    layout :x, :float, # Vector x component
           :y, :float  # Vector y component
  
    def initialize(x, y)
      self[:x] = x
      self[:y] = y
    end
  end
end
```

But that leads to verbose code. Especially in structs with many members such as `Vector3`.

Building on top of [Raylib::Struct define attribute accessors upon class definition](0004-raylib-struct-define-attribute-accessors-upon-class-definition.md),
we can define an `initialize` method that takes the same number of arguments as the struct has attributes and sets them
accordingly:

```ruby
require 'ffi'

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

     def self.define_attribute_interface(*attrs)
      define_attribute_accessors(*attrs)

      define_singleton_method :initialize do |*args|
        raise "Expected #{members.count} arguments, got #{args.count} #{args} #{self}" unless members.count == args.count

        new.tap do |instance|
          args.each_with_index do |arg, index|
            instance[attrs[index]] = arg
          end
        end
      end
    end

    def self.layout(*args)
      super

      # Infer attributes from the layout arguments
      attributes = args.each_slice(2).map(&:first)
      define_attribute_interface(*attributes)
    end
  end
end
```

```ruby
module Raylib
  # Vector2, 2 components
  class Vector2 < Struct
    layout :x, :float, # Vector x component
           :y, :float  # Vector y component
  end
end

position = Raylib::Vector2.create(10, 20)
```

## Decision

There's a strong chance that the code will be generated. There's no need for this additional abstraction.

## Consequences

### Negative

- Adds another abstraction
- Always performs assignments, even if the struct is instantiated with no arguments.

### Positive

- Reduces the amount of code
