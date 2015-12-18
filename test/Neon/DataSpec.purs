module Test.Neon.DataSpec where

import Neon (..)
import Test.Spec (..)
import Test.Neon.Data.DictionarySpec (spec) as Dictionary
import Test.Neon.Data.ExceptionSpec (spec) as Exception
import Test.Neon.Data.ListSpec (spec) as List
import Test.Neon.Data.MaybeSpec (spec) as Maybe
import Test.Neon.Data.MaybeSpec (spec) as Pair
import Test.Neon.Data.UnitSpec (spec) as Unit

spec :: Spec
spec = describe "Neon.Data" do
  Dictionary.spec
  Exception.spec
  List.spec
  Maybe.spec
  Pair.spec
  Unit.spec
