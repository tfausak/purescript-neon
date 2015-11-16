module Test.Neon.Values.List where

import Neon
import Neon.Values
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.List"
  Nil ==> Nil :: List Unit
  Cons 1 Nil ==> Cons 1 Nil
  show (Nil :: List Unit) ==> "Nil"
  show (Cons 1 Nil) ==> "Cons (1) (Nil)"
  toList [1, 2] ==> Cons 1 (Cons 2 Nil)
  fromList (Cons 1 (Cons 2 Nil)) ==> [1, 2]
