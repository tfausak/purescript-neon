module Test.Neon.DataSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Data.DictionarySpec as Dictionary
import qualified Test.Neon.Data.ExceptionSpec as Exception
import qualified Test.Neon.Data.MaybeSpec as Maybe
import qualified Test.Neon.Data.MaybeSpec as Pair
import qualified Test.Neon.Data.UnitSpec as Unit

main :: Spec
main = describe "Neon.Data" do
  Dictionary.main
  Exception.main
  Maybe.main
  Pair.main
  Unit.main
