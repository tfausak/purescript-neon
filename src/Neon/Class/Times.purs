module Neon.Class.Times (class Times, times) where

foreign import nativeTimes :: forall a. a -> a -> a

class Times a where
  times :: a -> a -> a

instance timesInt :: Times Int where
  times = nativeTimes

instance timesNumber :: Times Number where
  times = nativeTimes
