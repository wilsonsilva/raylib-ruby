# 7. Require vs include

Date: 2023-09-24

## Status

Accepted

## Context

The functions, constants and enums are globally exposed in the native library due to C limitations:

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

Ruby is an object-oriented language. The methods, classes and constants are not exposed by default in this gem:

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

Typing `Raylib` before each method or constant is tedious. We can include the methods, classes and constants in the
global namespace:

```ruby
require 'raylib'

include Raylib

screen_width = 400
screen_height = 450

init_window(screen_width, screen_height, "My Window")
set_target_fps(60)

until window_should_close
  begin_drawing
  clear_background(RAYWHITE)
  end_drawing
end
```

## Decision

Allow both `require` and `include`:

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

```ruby
require 'raylib'

include Raylib

screen_width = 400
screen_height = 450

init_window(screen_width, screen_height, "My Window")
set_target_fps(60)

until window_should_close
  begin_drawing
  clear_background(RAYWHITE)
  end_drawing
end
```

## Consequences

### Negative

- There are two ways of achieving the same result. This can be confusing for new users.

### Positive

- It is more convenient to use the gem
- It is easier to migrate from the native library to the gem
- It is easier to migrate from the gem to the native library
- Avoids name collisions
