-- | This is the top-level entry point into Neon. Typically to use Neon you
-- | would simply import this unqualified.
-- |
-- | ``` purescript
-- | import Neon
-- | ```
-- |
-- | If you want to avoid namespace collisions, you can import Neon qualified.
-- | It is a good idea to still import the operators unqualified, otherwise it
-- | will be annoying to use.
-- |
-- | ``` purescript
-- | import Neon as N
-- | import Neon.Operator
-- | ```
-- |
-- | Here is an overview of the re-exported modules:
-- |
-- | - Primitive: Functions for stuff built into PureScript, like `Number`.
-- |   This is for basics like converting between numeric types.
-- | - Data: Re-exports from other libraries. Neon does not define any of its
-- |   own data types.
-- | - Effect: More re-exports. Neon also does not define any of its own effect
-- |   types.
-- | - Class: This is why Neon exists. These classes are what separate Neon
-- |   from the `Prelude`.
-- | - Helper: Things built on top of everything else. These are all nice to
-- |   have but can be derived from simpler things.
-- | - Operator: A handful of operators for doing common tasks. Neon doesn't go
-- |   overboard with operators like many other PureScript libraries.
-- |
-- | All of Neon's documentation assumes you are familiar with the `:`
-- | operator. If you aren't, you should start by reading its documentation.
module Neon
  ( module Neon.Class
  , module Neon.Data
  , module Neon.Effect
  , module Neon.Helper
  , module Neon.Operator
  , module Neon.Primitive
  ) where

import Neon.Class as Neon.Class
import Neon.Data as Neon.Data
import Neon.Effect as Neon.Effect
import Neon.Helper as Neon.Helper
import Neon.Operator as Neon.Operator
import Neon.Primitive as Neon.Primitive
