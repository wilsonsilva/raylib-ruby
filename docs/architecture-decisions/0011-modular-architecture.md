# 11. Modular architecture

Date: 2023-10-14

## Status

Accepted

## Context

The raylib native library uses header files to include functions, structs and callbacks. It has a flat file structure.
This is partially due to native library's maintainers architectural preferences and partially due to C limitations.

In the native library, we include `raylib.h`, `raymath.h`, `rlgl.h` and other components explicitly:

```c
#include "raylib.h"
#include "raymath.h"
#include "rlgl.h"
```

In order to save memory, we don't want to require all modules. We only want to require the modules that we need:

```ruby
require 'raylib'
require 'raylib/raymath'
require 'raylib/rlgl'
```

## Decision

Require each module explicitly:

```ruby
require 'raylib'
require 'raylib/raymath'
require 'raylib/rlgl'
```

## Consequences

### Negative

- Requires typing each module explicitly

### Positive

- Follows the same standard as native raylib
- It is memory-efficient
- It is less error-prone because we don't have to worry about name collisions
