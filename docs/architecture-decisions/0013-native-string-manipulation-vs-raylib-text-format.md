# 13. Native string manipulation vs `Raylib.text_format`

Date: 2023-10-25

## Status

Accepted

## Context

Our project involves frequent use of string formatting for display purposes. We were initially using Raylib's
`TextFormat`/`Raylib.text_format` C function, bound through FFI, for this task. However, as our project primarily relies
on Ruby, we have to decide whether to continue using Raylib.text_format or switch to native Ruby string manipulation
methods, like string interpolation, `sprintf`, and `String#%`.

Here's the C implementation of `TextFormat` from Raylib which our Ruby `binding Raylib.text_format` was based on:

```c
// Formatting of text with variables to 'embed'
// WARNING: String returned will expire after this function is called MAX_TEXTFORMAT_BUFFERS times
const char *TextFormat(const char *text, ...)
{
#ifndef MAX_TEXTFORMAT_BUFFERS
    #define MAX_TEXTFORMAT_BUFFERS 4        // Maximum number of static buffers for text formatting
#endif

    // We create an array of buffers so strings don't expire until MAX_TEXTFORMAT_BUFFERS invocations
    static char buffers[MAX_TEXTFORMAT_BUFFERS][MAX_TEXT_BUFFER_LENGTH] = { 0 };
    static int index = 0;

    char *currentBuffer = buffers[index];
    memset(currentBuffer, 0, MAX_TEXT_BUFFER_LENGTH);   // Clear buffer before using

    va_list args;
    va_start(args, text);
    int requiredByteCount = vsnprintf(currentBuffer, MAX_TEXT_BUFFER_LENGTH, text, args);
    va_end(args);

    // If requiredByteCount is larger than the MAX_TEXT_BUFFER_LENGTH, then overflow occured
    if (requiredByteCount >= MAX_TEXT_BUFFER_LENGTH)
    {
        // Inserting "..." at the end of the string to mark as truncated
        char *truncBuffer = buffers[index] + MAX_TEXT_BUFFER_LENGTH - 4; // Adding 4 bytes = "...\0"
        sprintf(truncBuffer, "...");
    }

    index += 1;     // Move to next buffer for next function call
    if (index >= MAX_TEXTFORMAT_BUFFERS) index = 0;

    return currentBuffer;
}
```

__Considerations__: Consistency and Maintainability: Our project predominantly uses Ruby as the programming language.
Utilizing native Ruby methods for string manipulation promotes codebase consistency, making it more straightforward for
developers to maintain and extend the project.

__Platform Independence__: Native Ruby string manipulation is part of the Ruby standard library and ensures
cross-platform consistency, eliminating dependency on Raylib's C libraries for this specific feature.

__Ruby Community and Ecosystem__: Using native Ruby methods for string formatting allows us to tap into the
extensive Ruby community and ecosystem for guidance and best practices, thereby enriching our codebase.

__Performance__: While the difference may not be significant, using native Ruby methods can result in faster
execution time as it avoids the overhead of FFI calls to C libraries.

__Ease of Use__: Ruby’s native string manipulation methods are expressive, readable, and align well with the
language's philosophy.

## Decision

We will use native Ruby methods for string formatting. This approach not only aligns with our language choice but
also promotes code readability and maintainability.

Here are real examples that demonstrate the replacement of `Raylib.text_format` with Ruby’s native string manipulation:

```diff
- Raylib.text_format("%i", :int, rand_value)
+ rand_value.to_s

- Raylib.text_format("GP1: %s", :string, Raylib.get_gamepad_name(0))
+ "GP1: #{Raylib.get_gamepad_name(0)}"

- Raylib.draw_text(Raylib.text_format('Text size: [%02.02f, %02.02f]', :float, text_size.x, :float, text_size.y)
+ 'Text size: [%02.02f, %02.02f]' % [text_size.x, text_size.y]
```

## Consequences

### Negative

- Developers accustomed to Raylib's C-style string formatting may require time to adapt to Ruby's native methods.

### Positive

- Enhanced code readability and maintainability.
- Improved performance by eliminating FFI overhead.
- Alignment with Ruby's best practices and programming philosophy.
