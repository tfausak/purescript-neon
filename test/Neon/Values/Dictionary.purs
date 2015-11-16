module Test.Neon.Values.Dictionary where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Dictionary"
  fromArray [pair "a" 1] + fromArray [pair "b" 2] ==> fromArray [pair "a" 1, pair "b" 2]
  fromArray [pair "a" 1] <|> fromArray [pair "b" 2] ==> fromArray [pair "a" 1, pair "b" 2]
  fromArray [pair "a" (+ 1)] <*> fromArray [pair "a" 1] ==> fromArray [pair "a" 2]
  empty ==> fromArray [] :: Dictionary Unit
  fromArray [] ==> fromArray [] :: Dictionary Unit
  fromArray [pair "a" 1] ==> fromArray [pair "a" 1]
  fromArray [pair "a" 1, pair "b" 2] ==> fromArray [pair "b" 2, pair "a" 1]
  foldl (+) "a" (fromArray [pair "b" "b", pair "c" "c"]) ==> "abc"
  foldr (+) "a" (fromArray [pair "b" "b", pair "c" "c"]) ==> "bca"
  map (+ 1) (fromArray [pair "a" 1]) ==> fromArray [pair "a" 2]
  show (fromArray [pair "a" 1, pair "b" 2]) ==> "fromArray ([pair (\"a\") (1), pair (\"b\") (2)])"
  zero ==> fromArray [] :: Dictionary Unit
