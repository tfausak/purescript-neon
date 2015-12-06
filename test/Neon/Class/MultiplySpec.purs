module Test.Neon.Class.MultiplySpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Multiply" do
  it "multiplies integers" do
    multiply 2 3 `shouldBe` 6
  it "multiplies numbers" do
    multiply 2.0 3.0 `shouldBe` 6.0
