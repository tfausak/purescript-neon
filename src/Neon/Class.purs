-- | Every type class in Neon starts with "Has". There are two reasons for
-- | this:
-- |
-- | - It avoids collisions with data types. The `HasMap` type class is
-- |   distinct from the `Map` data type.
-- |
-- | - Each type class has one function, so naming the class after that
-- |   function results in better error messages.
-- |
-- |   ``` purescript
-- |   newtype MyArray a = MyArray (Array a)
-- |   MyArray [1, 2, 3] :map (_ + 1)
-- |   -- Error found:
-- |   --   No type class instance was found for
-- |   --     Neon.Class.HasMap.HasMap MyArray
-- |   ```
module Neon.Class
  ( module Neon.Class.HasAdd
  , module Neon.Class.HasAnd
  , module Neon.Class.HasApply
  , module Neon.Class.HasBottom
  , module Neon.Class.HasChain
  , module Neon.Class.HasCompare
  , module Neon.Class.HasDivide
  , module Neon.Class.HasEqual
  , module Neon.Class.HasFilter
  , module Neon.Class.HasFromArray
  , module Neon.Class.HasFromInt
  , module Neon.Class.HasGreater
  , module Neon.Class.HasInspect
  , module Neon.Class.HasLess
  , module Neon.Class.HasMap
  , module Neon.Class.HasMultiply
  , module Neon.Class.HasNot
  , module Neon.Class.HasOne
  , module Neon.Class.HasOr
  , module Neon.Class.HasPower
  , module Neon.Class.HasPure
  , module Neon.Class.HasReduce
  , module Neon.Class.HasRemainder
  , module Neon.Class.HasSubtract
  , module Neon.Class.HasToArray
  , module Neon.Class.HasToInt
  , module Neon.Class.HasTop
  , module Neon.Class.HasTraverse
  , module Neon.Class.HasZero
  ) where

import Neon.Class.HasAdd as Neon.Class.HasAdd
import Neon.Class.HasAnd as Neon.Class.HasAnd
import Neon.Class.HasApply as Neon.Class.HasApply
import Neon.Class.HasBottom as Neon.Class.HasBottom
import Neon.Class.HasChain as Neon.Class.HasChain
import Neon.Class.HasCompare as Neon.Class.HasCompare
import Neon.Class.HasDivide as Neon.Class.HasDivide
import Neon.Class.HasEqual as Neon.Class.HasEqual
import Neon.Class.HasFilter as Neon.Class.HasFilter
import Neon.Class.HasFromArray as Neon.Class.HasFromArray
import Neon.Class.HasFromInt as Neon.Class.HasFromInt
import Neon.Class.HasGreater as Neon.Class.HasGreater
import Neon.Class.HasInspect as Neon.Class.HasInspect
import Neon.Class.HasLess as Neon.Class.HasLess
import Neon.Class.HasMap as Neon.Class.HasMap
import Neon.Class.HasMultiply as Neon.Class.HasMultiply
import Neon.Class.HasNot as Neon.Class.HasNot
import Neon.Class.HasOne as Neon.Class.HasOne
import Neon.Class.HasOr as Neon.Class.HasOr
import Neon.Class.HasPower as Neon.Class.HasPower
import Neon.Class.HasPure as Neon.Class.HasPure
import Neon.Class.HasReduce as Neon.Class.HasReduce
import Neon.Class.HasRemainder as Neon.Class.HasRemainder
import Neon.Class.HasSubtract as Neon.Class.HasSubtract
import Neon.Class.HasToArray as Neon.Class.HasToArray
import Neon.Class.HasToInt as Neon.Class.HasToInt
import Neon.Class.HasTop as Neon.Class.HasTop
import Neon.Class.HasTraverse as Neon.Class.HasTraverse
import Neon.Class.HasZero as Neon.Class.HasZero
