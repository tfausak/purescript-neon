module Neon.Types.HasEqual
  ( HasEqual
  , equal
  , (==)
  ) where

foreign import nativeEqualArray :: forall a. (HasEqual a) => Array a -> Array a -> Boolean
foreign import nativeEqualBoolean :: Boolean -> Boolean -> Boolean
foreign import nativeEqualChar :: Char -> Char -> Boolean
foreign import nativeEqualFunction :: forall a b. (a -> b) -> (a -> b) -> Boolean
foreign import nativeEqualInt :: Int -> Int -> Boolean
foreign import nativeEqualNumber :: Number -> Number -> Boolean
foreign import nativeEqualObject :: forall o. Object o -> Object o -> Boolean
foreign import nativeEqualString :: String -> String -> Boolean

-- | Laws:
-- | - Reflexivity: `x == x = true`
-- | - Symmetry: `x == y = y == x`
-- | - Transitivity: `x == y` and `y == z` implies `x == z`
class HasEqual a where
  equal :: a -> a -> Boolean

instance arrayHasEqual :: (HasEqual a) => HasEqual (Array a) where
  equal x y = nativeEqualArray x y

instance booleanHasEqual :: HasEqual Boolean where
  equal x y = nativeEqualBoolean x y

instance charHasEqual :: HasEqual Char where
  equal x y = nativeEqualChar x y

instance functionHasEqual :: HasEqual (a -> b) where
  equal f g = nativeEqualFunction f g

instance intHasEqual :: HasEqual Int where
  equal x y = nativeEqualInt x y

instance numberHasEqual :: HasEqual Number where
  equal x y = nativeEqualNumber x y

instance objectHasEqual :: HasEqual (Object o) where
  equal x y = nativeEqualObject x y

instance stringHasEqual :: HasEqual String where
  equal x y = nativeEqualString x y

-- | Alias for `equal`.
(==) :: forall a. (HasEqual a) => a -> a -> Boolean
(==) x y = equal x y
infix 4 ==
