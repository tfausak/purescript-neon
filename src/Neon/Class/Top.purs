module Neon.Class.Top (class Top, top) where

foreign import nativeTopInt :: Int
foreign import nativeTopNumber :: Number

class Top a where
  top :: a

instance topBoolean :: Top Boolean where
  top = true

instance topChar :: Top Char where
  top = '\65535'

instance topInt :: Top Int where
  top = nativeTopInt

instance topNumber :: Top Number where
  top = nativeTopNumber
