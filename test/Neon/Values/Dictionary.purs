module Test.Neon.Values.Dictionary where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Dictionary"
  let units = [] :: Array (Pair String Unit)
  fromArray [pair "a" 1] + fromArray [pair "b" 2] ==> fromArray [pair "a" 1, pair "b" 2] :: Dictionary Int
  alternative (fromArray [pair "a" 1]) (fromArray [pair "b" 2]) ==> fromArray [pair "a" 1, pair "b" 2] :: Dictionary Int
  apply (fromArray [pair "a" (+ 1)]) (fromArray [pair "a" 1] :: Dictionary Int) ==> fromArray [pair "a" 2] :: Dictionary Int
  empty ==> fromArray units :: Dictionary Unit
  fromArray units ==> fromArray units :: Dictionary Unit
  fromArray [pair "a" 1] ==> fromArray [pair "a" 1] :: Dictionary Int
  fromArray [pair "a" 1, pair "b" 2] ==> fromArray [pair "b" 2, pair "a" 1] :: Dictionary Int
  foldl (+) "a" (fromArray [pair "b" "b", pair "c" "c"] :: Dictionary String) ==> "abc"
  foldr (+) "a" (fromArray [pair "b" "b", pair "c" "c"] :: Dictionary String) ==> "bca"
  map (+ 1) (fromArray [pair "a" 1]) ==> fromArray [pair "a" 2] :: Dictionary Int
  show (fromArray [pair "a" 1, pair "b" 2] :: Dictionary Int) ==> "fromArray ([pair (\"a\") (1), pair (\"b\") (2)])"
  zero ==> fromArray units :: Dictionary Unit
