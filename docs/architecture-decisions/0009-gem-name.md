# 9. Gem name

Date: 2023-10-13

## Status

Accepted

## Context

The gem name should be short, memorable and easy to type. It should also be unique. The gem should be easy to find on
rubygems.org.

Most Ruby gems are named after the library they wrap. For example, `ffi` wraps the `ffi` library. Another example is
`fiddle`, which wraps the `fiddle` library.

Given that the gem exposes raylib native library API in a 1:1 fashion, it should be named after raylib.

Besides, `Ray` is taken.

## Decision

Name the gem `raylib`. Ensure that the gem's `description`, `summary`, `README.md` and Github repository's `About`
section are clear about the fact that the gem wraps the native library.

## Consequences

### Negative

- It is harder to distinguish between the gem and the native library

### Positive

- It is easy to find on rubygems.org
- Extensions to the gem can be named using Rubygem's convention (e.g. `raylib-dsl`, `raylib-generator`, etc)
