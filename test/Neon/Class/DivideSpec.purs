module Test.Neon.Class.DivideSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Divide" do
  it "divides integers" do
    divide 4 2 `shouldBe` 2
  it "divides numbers" do
    divide 5.0 2.0 `shouldBe` 2.5
