module Neon.Class.Plus (class Plus, plus) where

foreign import nativePlus :: forall a. a -> a -> a
foreign import nativePlusArray :: forall a. Array a -> Array a -> Array a

class Plus a where
  plus :: a -> a -> a

instance plusArray :: Plus (Array a) where
  plus = nativePlusArray

instance plusInt :: Plus Int where
  plus = nativePlus

instance plusNumber :: Plus Number where
  plus = nativePlus

instance plusString :: Plus String where
  plus = nativePlus
