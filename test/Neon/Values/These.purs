module Test.Neon.Values.These where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.These"
  This 1 + That 2 ==> Both 1 2
  Both "a" (+ 1) <*> Both "b" 1 ==> Both "ab" 2
  This 1 == That 2 ==> false
  foldl (+) "a" (Both "b" "c") ==> "ac"
  foldr (+) "a" (Both "b" "c") ==> "ca"
  (+ 1) <$> Both 1 2 ==> Both 1 3
  pure true ==> That true :: These Unit Boolean
  show (Both 1 2) ==> "Both (1) (2)"
  these identity (+ 1) (+) (This 1) ==> 1
  these identity (+ 1) (+) (That 1) ==> 2
  these identity (+ 1) (+) (Both 1 2) ==> 3
  isThis (This unit) ==> true
  isThis (That unit) ==> false
  isThat (That unit) ==> true
  isThat (This unit) ==> false
  isBoth (Both unit unit) ==> true
  isBoth (This unit) ==> false
