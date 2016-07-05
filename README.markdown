# [Neon][]

[![Package version][]][version]
[![Build status][]][build]

Neon is a practical standard library for [PureScript][].

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

- If something is possible in JavaScript (and not a terrible idea), it should
  be possible in Neon. This means you can do `"ab" + "cd"`, but you can't do
  `"ab" + 3`.

- Functions should take their subject last. This means `add x y` is really
  `y + x`. Consider calling functions with `:`, like `y :add x`.

- Everything should be documented with examples. Type signatures are not a
  substitute for documentation.

- Laws should not prohibit useful instances. This means you can use `or` on
  booleans and arrays.

- There should be no type class hierarchy. This means `HasZero` does not imply
  `HasAdd`. If you need both, add both to your type signature.

- There should be as few operators as possible. This means `<$>` does not
  exist. Use `map` instead.

- There should be one obvious way to do things. This means `return` is not an
  alias for `pure`. In fact, it doesn't exist at all.

- Functions should be defined in type classes. This means `add` can be used for
  both numbers and strings.

- Type classes should be as small as possible. This means the `Bounded` type
  class is split into `HasBottom` and `HasTop`.

- Type classes should be designed for programmers, not mathematicians. This
  means `HasAdd` is a semigroup, but it's not called `Semigroup`.

- Neon should not define its own data types. That means you can use `Maybe`
  from `Data.Maybe` without translation.

- Pure functions should not throw exceptions. This means `fromInt` returns a
  `Maybe` value. Pure functions that throw exceptions should be marked unsafe.

- Qualified imports are annoying, and fewer imports are better. This mean
  `import Neon` is enough. No need for tens of lines of imports.

[Neon]: https://github.com/tfausak/purescript-neon
[Package version]: https://pursuit.purescript.org/packages/purescript-neon/badge
[version]: https://pursuit.purescript.org/packages/purescript-neon
[Build status]: https://travis-ci.org/tfausak/purescript-neon.svg?branch=master
[build]: https://travis-ci.org/tfausak/purescript-neon
[PureScript]: https://github.com/purescript/purescript
