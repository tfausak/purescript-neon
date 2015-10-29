module Ax.Equal
  ( Equal
  , equal
  , notEqual
  , (!=)
  , (==)
  ) where

import Ax.BooleanAlgebra (not)

foreign import jsEqualArray :: forall a. (Equal a) => Array a -> Array a -> Boolean
foreign import jsEqualBoolean :: Boolean -> Boolean -> Boolean
foreign import jsEqualChar :: Char -> Char -> Boolean
foreign import jsEqualInt :: Int -> Int -> Boolean
foreign import jsEqualNumber :: Number -> Number -> Boolean
foreign import jsEqualObject :: forall o. Object (| o) -> Object (| o) -> Boolean
foreign import jsEqualString :: String -> String -> Boolean

class Equal a where
  equal :: a -> a -> Boolean

instance equalArray :: (Equal a) => Equal (Array a) where
  equal x y = jsEqualArray x y

instance equalBoolean :: Equal Boolean where
  equal x y = jsEqualBoolean x y

instance equalChar :: Equal Char where
  equal x y = jsEqualChar x y

instance equalInt :: Equal Int where
  equal x y = jsEqualInt x y

instance equalNumber :: Equal Number where
  equal x y = jsEqualNumber x y

instance equalObject :: Equal (Object (| o)) where
  equal x y = jsEqualObject x y

instance equalString :: Equal String where
  equal x y = jsEqualString x y

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual x y = not (equal x y)

(!=) :: forall a. (Equal a) => a -> a -> Boolean
(!=) x y = notEqual x y
infix 4 !=

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) x y = equal x y
infix 4 ==
