module Test.Neon.ClassSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Class.AddSpec as Add
import qualified Test.Neon.Class.BindSpec as Bind
import qualified Test.Neon.Class.EqualSpec as Equal
import qualified Test.Neon.Class.PureSpec as Pure
import qualified Test.Neon.Class.ShowSpec as Show

main :: Spec
main = describe "Neon.Class" do
  Add.main
  Bind.main
  Equal.main
  Pure.main
  Show.main
