module Test.Neon.Class.SubtractSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Subtract" do
  it "subtracts integers" do
    subtract 2 1 `shouldBe` 1
  it "subtracts numbers" do
    subtract 2.0 1.0 `shouldBe` 1.0
