module Test.Neon.DataSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Data.DictionarySpec as Dictionary
import qualified Test.Neon.Data.ExceptionSpec as Exception
import qualified Test.Neon.Data.ListSpec as List
import qualified Test.Neon.Data.MaybeSpec as Maybe
import qualified Test.Neon.Data.MaybeSpec as Pair
import qualified Test.Neon.Data.UnitSpec as Unit

spec :: Spec
spec = describe "Neon.Data" do
  Dictionary.spec
  Exception.spec
  List.spec
  Maybe.spec
  Pair.spec
  Unit.spec
