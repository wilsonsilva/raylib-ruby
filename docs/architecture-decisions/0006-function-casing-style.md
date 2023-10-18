# 6. Function casing style

Date: 2023-09-24

## Status

Accepted

## Context

The native library functions are written in `PascalCase`:

```c
#include "raylib.h"

int main(void)
{
  const int screenWidth = 800;
  const int screenHeight = 450;

  InitWindow(screenWidth, screenHeight, "My Window");

  SetTargetFPS(60);

  while (!WindowShouldClose())
  {
    BeginDrawing();
    ClearBackground(RAYWHITE);
    EndDrawing();
  }
  
  CloseWindow();
  
  return 0;
}
```

To expose the functions in Ruby, we need to use FFI's `attach_function`. It has two syntaxes:

```ruby
# Initialize window and OpenGL context
attach_function :InitWindow, [:int, :int, :string], :void
```

This syntax exposes the functions in `PascalCase`, which is different than Ruby's convention:

```ruby
require 'raylib'

screenWidth = 400
screenHeight = 450

Raylib.InitWindow(screenWidth, screenHeight, "My Window")
Raylib.SetTargetFPS(60)

until Raylib.WindowShouldClose
  Raylib.BeginDrawing
  Raylib.ClearBackground(Raylib::RAYWHITE)
  Raylib.EndDrawing
end

Raylib.CloseWindow
```

It makes methods look like constants, which is confusing. There's a way to convert the function names to `snake_case`:

```ruby
# Initialize window and OpenGL context
attach_function :init_window, :InitWindow, [:int, :int, :string], :void
```

This is results in idiomatic Ruby:

```ruby
require 'raylib'

screen_width = 400
screen_height = 450

Raylib.init_window(screen_width, screen_height, "My Window")
Raylib.set_target_fps(60)

until Raylib.window_should_close
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.end_drawing
end
```

## Decision

Convert the function names to `snake_case`:

```ruby
# Initialize window and OpenGL context
attach_function :init_window, :InitWindow, [:int, :int, :string], :void
```

```ruby
require 'raylib'

screen_width = 400
screen_height = 450

Raylib.init_window(screen_width, screen_height, "My Window")
Raylib.set_target_fps(60)

until Raylib.window_should_close
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.end_drawing
end
```

## Consequences

### Negative

- The function names are different than the native library

### Positive

- The function names follow Ruby's convention
