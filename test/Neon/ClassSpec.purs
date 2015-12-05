module Test.Neon.ClassSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Class.BindSpec as Bind
import qualified Test.Neon.Class.PureSpec as Pure

main :: Spec
main = describe "Neon.Class" do
  Bind.main
  Pure.main
