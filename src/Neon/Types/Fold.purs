module Neon.Types.Fold
  ( Fold
  , foldl
  , foldr
  ) where

foreign import nativeFoldlArray :: forall a b. (b -> a -> b) -> b -> Array a -> b
foreign import nativeFoldrArray :: forall a b. (a -> b -> b) -> b -> Array a -> b

class Fold f where
  foldl :: forall a b. (b -> a -> b) -> b -> f a -> b
  foldr :: forall a b. (a -> b -> b) -> b -> f a -> b

instance foldArray :: Fold Array where
  foldl f y xs = nativeFoldlArray f y xs
  foldr f y xs = nativeFoldrArray f y xs
