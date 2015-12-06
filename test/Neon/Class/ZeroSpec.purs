module Test.Neon.Class.ZeroSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Zero" do
  it "zeros arrays" do
    zero `shouldBe` ([] :: Array Int)
  it "zeros integers" do
    zero `shouldBe` 0
  it "zeros numbers" do
    zero `shouldBe` 0.0
  it "zeros strings" do
    zero `shouldBe` ""
