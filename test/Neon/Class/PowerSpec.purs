module Test.Neon.Class.PowerSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Power" do
  it "powers integers" do
    power 2 3 `shouldBe` 8
  it "powers numbers" do
    power 2.0 3.0 `shouldBe` 8.0
