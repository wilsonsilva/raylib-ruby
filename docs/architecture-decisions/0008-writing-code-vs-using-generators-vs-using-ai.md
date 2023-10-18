# 8. Writing code vs using generators vs using AI

Date: 2023-09-24

## Status

Accepted

## Context

The native library exposes about 800 functions, 40 enums and 400 of enums.

In order to establish feature parity with the native library, we need to convert all the functions, enums and structs.

It is a lot of work to manually convert all of them to Ruby than to use a generator.

I tried a couple of different approaches to generate the code manually. Namely, using the `cast` gem, `ffi_gen` gem,
`ffi-clang` gem, `clang` CLI and asking ChatGPT to do it for me. They all have their own shortcomings.

Fortunately, the C repo has a `parser` folder with `raylib_api.json` which is a JSON representation of the API.
I created another game called `raylib-generator` to generate the code from that API.

## Decision

Use a generator to generate the code. The generator will be written in Ruby. It will be a separate gem.

Clarify in the main repo that the code is generated.

## Consequences

### Negative

- The generator will be a separate gem. It will be a dependency of the main gem
- Maintainers will need to maintain two gems instead of one
- Maintainers may mistakenly attempt to submit PRs to modify the generated code instead of the generator
- Not all the code can be generated. Some code will need to be written manually, introducing another layer of complexity

### Positive

- Easier to establish feature parity with the native library
- Easier to maintain
- Other maintainers can use the generator to generate their bindings for their own gems
- The generator can be used to generate bindings for other languages
