module Test.Neon.Class.ReduceSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Reduce" do
  reduce add "z" ["a", "b"] `shouldBe` "zab"
