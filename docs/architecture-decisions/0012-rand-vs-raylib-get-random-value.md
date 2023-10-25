# 12. rand vs Raylib.get_random_value

Date: 2023-10-25

## Status

Accepted

## Context

In the context of our project, we need to decide whether to use Ruby's `rand` function or Raylib's C
counterpart (`getRandomValue()`/`Raylib.get_random_value`) to generate random numbers.

Here's the C implementation of `getRandomValue()` from raylib:
```c
// Get a random value between min and max (both included)
// WARNING: Ranges higher than RAND_MAX will return invalid results
// More specifically, if (max - min) > INT_MAX there will be an overflow,
// and otherwise if (max - min) > RAND_MAX the random value will incorrectly never exceed a certain threshold
int GetRandomValue(int min, int max)
{
    if (min > max)
    {
        int tmp = max;
        max = min;
        min = tmp;
    }

    if ((unsigned int)(max - min) > (unsigned int)RAND_MAX)
    {
        TRACELOG(LOG_WARNING, "Invalid GetRandomValue() arguments, range should not be higher than %i", RAND_MAX);
    }

    return (rand()%(abs(max - min) + 1) + min);
}
```

__Consistency and Maintainability__: Our project primarily uses Ruby as the programming language. By using Ruby's
built-in rand function, we maintain code consistency, making it easier for developers to understand and maintain the
codebase. Using C's rand() function would introduce a different paradigm and potentially increase cognitive load for
the development team.

__Platform Independence__: Ruby's rand function is part of the Ruby standard library and is available across different
platforms and Ruby implementations. This ensures that our random number generation code will work consistently
regardless of the environment.

__Ruby Community and Ecosystem__: Leveraging Ruby's rand function allows us to take advantage of the extensive Ruby
community and ecosystem. There are a wealth of libraries and resources available for working with random numbers in
Ruby, which can save development time and effort.

__Ease of Use__: Ruby's rand function is straightforward to use and provides a clean and intuitive API for generating
random numbers within specified ranges. This ease of use aligns with Ruby's philosophy of developer friendliness.

## Decision

Use Ruby's `rand` function for generating random numbers in our project. Here is an example of using Ruby's `rand`
function to generate a random number between 1 and 10:

```ruby
random_number = rand(1..10)
```
This code is concise, readable, and integrates seamlessly with the Ruby codebase.

## Consequences

### Negative

- The specific behavior of the rand function may vary slightly between Ruby versions and implementations. Developers
  should be aware of these variations when working with random numbers in Ruby.

### Positive

- Ensure code consistency, maintainability, and platform independence.
- Align with the conventions and philosophy of the Ruby language.
