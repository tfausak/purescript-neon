module Test.Neon.ClassSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Class.AddSpec as Add
import qualified Test.Neon.Class.BindSpec as Bind
import qualified Test.Neon.Class.EqualSpec as Equal
import qualified Test.Neon.Class.MultiplySpec as Multiply
import qualified Test.Neon.Class.PureSpec as Pure
import qualified Test.Neon.Class.ShowSpec as Show
import qualified Test.Neon.Class.SubtractSpec as Subtract
import qualified Test.Neon.Class.ZeroSpec as Zero

main :: Spec
main = describe "Neon.Class" do
  Add.main
  Bind.main
  Equal.main
  Multiply.main
  Pure.main
  Show.main
  Subtract.main
  Zero.main
