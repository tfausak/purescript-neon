module Test.Neon.DataSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Data.ExceptionSpec as Exception
import qualified Test.Neon.Data.UnitSpec as Unit

main :: Spec
main = describe "Neon.Data" do
  Exception.main
  Unit.main
