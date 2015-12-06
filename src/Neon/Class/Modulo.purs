module Neon.Class.Modulo (Modulo, modulo) where

foreign import nativeModulo :: forall a. a -> a -> a

class Modulo a where
  modulo :: a -> a -> a

instance moduloInt :: Modulo Int where
  modulo = nativeModulo
