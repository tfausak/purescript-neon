module Neon.Primitive.Number
  ( infinity
  , nan
  ) where

foreign import nativeInfinity :: Number
foreign import nativeNan :: Number

infinity :: Number
infinity = nativeInfinity

nan :: Number
nan = nativeNan
