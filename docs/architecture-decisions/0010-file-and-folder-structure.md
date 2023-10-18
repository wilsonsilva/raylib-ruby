# 10. File and folder structure

Date: 2023-10-14

## Status

Accepted

## Context

Native raylib uses header files to include functions, structs and callbacks. It has a flat file structure. This is
partially due to raylib's maintainers architectural preferences and partially due to C limitations.

In Ruby, we can use modules and classes to organize our code. We can also use folders to organize our files:

```
lib/raylib
├── core
│   ├── callbacks.rb
│   ├── colors.rb
│   ├── enums.rb
│   ├── functions.rb
│   ├── structs
│   │   ├── my_struct.rb
│   │   └── my_other_struct.rb
│   └── structs.rb
├── core.rb
├── raymath
│   ├── callbacks.rb
│   ├── enums.rb
│   ├── functions.rb
│   ├── structs
│   │   ├── my_struct.rb
│   │   └── my_other_struct.rb
│   └── structs.rb
├── raymath.rb
├── rlgl
│   ├── callbacks.rb
│   ├── enums.rb
│   ├── functions.rb
│   ├── structs
│   │   ├── my_struct.rb
│   │   └── my_other_struct.rb
│   └── structs.rb
├── rlgl.rb
└── version.rb
```

## Decision

Organize classes and modules in folders:

```
lib/raylib
├── core
│   ├── callbacks.rb
│   ├── colors.rb
│   ├── enums.rb
│   ├── functions.rb
│   ├── structs
│   │   ├── my_struct.rb
│   │   └── my_other_struct.rb
│   └── structs.rb
├── core.rb
├── raymath
│   ├── callbacks.rb
│   ├── enums.rb
│   ├── functions.rb
│   ├── structs
│   │   ├── my_struct.rb
│   │   └── my_other_struct.rb
│   └── structs.rb
├── raymath.rb
├── rlgl
│   ├── callbacks.rb
│   ├── enums.rb
│   ├── functions.rb
│   ├── structs
│   │   ├── my_struct.rb
│   │   └── my_other_struct.rb
│   └── structs.rb
├── rlgl.rb
└── version.rb
```

## Consequences

## Negative

- There's no file parity between the native C source code and the Ruby code

## Positive

- It is easier to locate the source of a method or struct
