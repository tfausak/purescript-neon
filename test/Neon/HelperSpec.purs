module Test.Neon.HelperSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Helper" do
  negate 1 `shouldBe` -1
  reciprocal 2.0 `shouldBe` 0.5
