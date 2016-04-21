# [Neon][]

[![Package version][]][version]
[![Build status][]][build]

Neon is an experimental standard library for [PureScript][].

``` purescript
-- Find the sum of all the multiples of 3 or 5 below 1000.
-- <https://projecteuler.net/problem=1>
import Neon
main :: Eff (console :: CONSOLE) Unit
main = 1
  :upTo 999
  :filter (divisibleBy 3 || divisibleBy 5)
  :sum
  :print
```

Neon is written from the ground up to be useful and coherent. It has some
guiding principles:

- Functions should take their subject last. This means `add x y` is really
  `y + x`. Consider calling functions with `:`, like `y :add x`.

- Type classes should be lawless. This means `zero` doesn't have to be the
  additive identity. That's recommended, but not necessary.

- There should be no type class hierarchy. This means `Zero` does not imply
  `HasAdd`. If you need both, add both to your type signature.

- There should be as few operators as possible. This means `<$>` does not
  exist. Use `map` instead.

- There should be one obvious way to do things. This means `return` is not an
  alias for `pure`. In fact, it doesn't exist at all.

- Functions should be defined in type classes. This means `add` can be used for
  both numbers and strings.

- Type classes should be as small as possible. This means the `Bounded` type
  class is split into `Bottom` and `Top`.

- Type classes should be designed for programmers, not mathematicians. This
  means `HasAdd` is a semigroup, but it's not called `Semigroup`.

- Pure functions should not throw exceptions. This means `fromInt` returns a
  `Maybe` value. Pure functions that throw exceptions should be marked unsafe.

- Qualified imports are annoying, and fewer imports are better. This mean
  `import Neon` is enough. No need for tens of lines of imports.

[Neon]: https://github.com/tfausak/purescript-neon
[Package version]: https://img.shields.io/bower/v/purescript-neon.svg?label=version
[version]: https://pursuit.purescript.org/packages/purescript-neon
[Build status]: https://img.shields.io/travis/tfausak/purescript-neon/master.svg
[build]: https://travis-ci.org/tfausak/purescript-neon
[PureScript]: https://github.com/purescript/purescript
