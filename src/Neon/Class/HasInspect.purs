module Neon.Class.HasInspect where

import Data.Foldable as Foldable
import Neon.Data as Data
import Prelude as Prelude

-- | Represents types that can be converting to a string. This is typically
-- | used for debugging. The result of `inspect x` should be a valid PureScript
-- | expression.
-- |
-- | ``` purescript
-- | inspect 123 -- "123"
-- | inspect (Just 123) -- "Just (123)"
-- | ```
-- |
-- | The instance for functions and objects do not return valid expressions.
-- | This is because there is no way in general to generate an expression for
-- | them.
-- |
-- | ``` purescript
-- | inspect identity -- "{- Function -}"
-- | inspect {} -- "{- Object -}"
-- | ```
class HasInspect a where
  inspect :: a -> String

instance arrayHasInspect :: (HasInspect a) => HasInspect (Array a) where
  inspect xs = case xs of
    [] -> "[]"
    _ -> Foldable.fold
      ["[", Foldable.intercalate "," (Prelude.map inspect xs), "]"]

instance booleanHasInspect :: HasInspect Boolean where
  inspect x = Prelude.show x

instance charHasInspect :: HasInspect Char where
  inspect x = Prelude.show x

instance errorHasInspect :: HasInspect Data.Error where
  inspect x = Prelude.show x

instance functionHasInspect :: HasInspect (a -> b) where
  inspect _ = "{- Function -}"

instance intHasInspect :: HasInspect Int where
  inspect x = Prelude.show x

instance listHasInspect :: (HasInspect a) => HasInspect (Data.List a) where
  inspect xs = case xs of
    Data.Nil -> "Nil"
    Data.Cons h t -> Foldable.fold
      ["(", Foldable.intercalate " : " (Prelude.map inspect xs), " : Nil)"]

instance numberHasInspect :: HasInspect Number where
  inspect x = Prelude.show x

instance objectHasInspect :: HasInspect { | a } where
  inspect _ = "{- Object -}"

instance orderingHasInspect :: HasInspect Data.Ordering where
  inspect x = Prelude.show x

instance proxyHasInspect :: HasInspect (Data.Proxy a) where
  inspect _ = "Proxy"

instance stringHasInspect :: HasInspect String where
  inspect x = Prelude.show x

instance unitHasInspect :: HasInspect Data.Unit where
  inspect x = Prelude.show x
