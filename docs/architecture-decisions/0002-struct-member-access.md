# 2. Struct member access

Date: 2023-09-24

## Status

Accepted

## Context

Consider the following FFI Struct:

```ruby
# Vector2, 2 components
class Vector2 < FFI::Struct
  layout :x, :float, # Vector x component
         :y, :float  # Vector y component
end
```

In order to access its members we must use the square brackets syntax:

```ruby
position = Vector2.new 
position[:x] = 1.0
position[:y] = 1.0
```

The square brackets syntax is not very ruby-like. It would be more idiomatic if we could access the members like this:

```ruby
position = Vector2.new 
position.x = 1.0
position.y = 1.0
```

But we can't do that because `FFI::Struct` doesn't define attribute accessors. We need to define them ourselves like
this:

```ruby
# Vector2, 2 components
class Vector2 < FFI::Struct
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
```

Another reason to define attribute accessors is that the native library functions require structs as arguments.
Those structs should follow the the `PascalCase` naming convention:

```ruby
# AudioStream, custom audio stream
class AudioStream < FFI::Struct
  layout(
    :buffer, :pointer,    # Pointer to internal data used by the audio system,
    :processor, :pointer, # Pointer to internal data processor, useful for audio effects,
    :sampleRate, :uint,   # Frequency (samples per second),
    :sampleSize, :uint,   # Bit depth (bits per sample): 8, 16, 32 (24 not supported),
    :channels, :uint,     # Number of channels (1-mono, 2-stereo, ...)
  )
end
```

But the `snake_case` naming convention is more idiomatic in Ruby. Thus, we can change the casing style of the struct
members when defining attribute accessors:

```ruby
# AudioStream, custom audio stream
class AudioStream < FFI::Struct
  layout(
    :buffer, :pointer,    # Pointer to internal data used by the audio system,
    :processor, :pointer, # Pointer to internal data processor, useful for audio effects,
    :sampleRate, :uint,   # Frequency (samples per second),
    :sampleSize, :uint,   # Bit depth (bits per sample): 8, 16, 32 (24 not supported),
    :channels, :uint,     # Number of channels (1-mono, 2-stereo, ...)
  )

  # ... other attribute accessors

  def sample_rate = self[:sampleRate]

  def sample_rate=(new_sample_rate)
    self[:sampleRate] = new_sample_rate
  end

  def sample_size = self[:sampleSize]

  # Sets Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  def sample_size=(new_sample_size)
    self[:sampleSize] = new_sample_size
  end
  
  # ... other attribute accessors
end
```

## Decision

We will define attribute accessors for `FFI::Struct` subclasses.

```ruby
# Vector2, 2 components
class Vector2 < FFI::Struct
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
```

## Consequences

### Negative

- Structs become verbose
- Declaring structs requires more typing

### Positive

- Structs members can be accessed with attribute accessors
- Structs members can be accessed in `snake_case` style
- IDE's can autocomplete struct members
