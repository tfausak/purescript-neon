module Test.Neon.Class.FromArraySpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.FromArray" do
  describe "String" do
    it "can be converted from an array" do
      fromArray ['a', 'b'] `shouldBe` "ab"
