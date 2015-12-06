module Test.Neon.Class.ZeroSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Zero" do
  it "zeros arrays" do
    zero `shouldBe` ([] :: Array Int)
    zero `shouldBe` 0
    zero `shouldBe` 0.0
    zero `shouldBe` ""
