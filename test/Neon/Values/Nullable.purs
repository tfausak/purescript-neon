module Test.Neon.Values.Nullable where

import Neon
import Neon.Values
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Nullable"
  toNullable Nothing == toNullable (Just unit) ==> false
  fromNullable (toNullable Nothing) ==> Nothing :: Maybe Unit
  fromNullable (toNullable (Just unit)) ==> Just unit
  show (toNullable (Nothing :: Maybe Unit)) ==> "null"
  show (toNullable (Just unit)) ==> "unit"
