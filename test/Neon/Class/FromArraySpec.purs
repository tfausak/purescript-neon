module Test.Neon.Class.FromArraySpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.FromArray" do
  describe "Array" do
    it "can be converted from an array" do
      fromArray [1, 2] `shouldBe` [1, 2]
  describe "String" do
    it "can be converted from an array" do
      fromArray ['a', 'b'] `shouldBe` "ab"
