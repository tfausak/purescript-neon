module Test.Neon.Class.MapSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Map" do
  map (+ 1) [1, 2] `shouldBe` [2, 3]
