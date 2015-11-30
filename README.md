# [Neon][]

[![Package version][version badge]][version]
[![Build status][build badge]][build]

:zap: Neon is an experimental PureScript prelude.

---

Neon is a standard library for PureScript. It is written from the ground up to
be useful and coherent. It has a some guiding principles:

- There should be one obvious way to do things. This means `return` is not an
  alias for `pure`. In fact, it doesn't exist at all. Use `pure`.

- Functions should be defined in type classes. This means `plus` can be used
  for both numbers and strings. Type classes should have laws so the behavior
  of their functions is known.

- Type classes should be as small as possible. This means the `Bounded` type
  class is split into `HasBottom` and `HasTop`.

- Design type classes for programmers, not mathematicians. This means `HasAdd`
  is a semigroup, but it's not called `Semigroup`.

- Pure functions should not throw exceptions. This means `toEnum` returns a
  `Maybe a` value. Pure functions that do throw exceptions should be marked as
  "unsafe".

- Qualified imports are annoying, and fewer imports are better. This mean
  `import Neon` is enough. No need for tens of lines of imports.

Since Neon is written from scratch to follow these principles, it is not
compatible with any of the existing PureScript ecosystem.

[neon]: https://github.com/tfausak/purescript-neon
[version badge]: https://img.shields.io/bower/v/purescript-neon.svg?label=version
[version]: https://github.com/tfausak/purescript-neon/releases
[build badge]: https://img.shields.io/travis/tfausak/purescript-neon/master.svg
[build]: https://travis-ci.org/tfausak/purescript-neon
