module Test.Neon.Types.HasTraverse where

import Neon
import Neon.Values
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Types.HasTraverse"
  traverse (always Nothing) [1] ==> Nothing :: Maybe (Array Unit)
  traverse (show >> Just) ([] :: Array Unit) ==> Just []
  traverse (show >> Just) [1, 2] ==> Just ["1", "2"]
  traverse (always Nothing) (Cons 1 Nil) ==> Nothing :: Maybe (List Unit)
  traverse (show >> Just) (Nil :: List Unit) ==> Just Nil
  traverse (show >> Just) (Cons 1 (Cons 2 Nil)) ==> Just (Cons "1" (Cons "2" Nil))
  traverse pure (Just 1) ==> [Just 1]
