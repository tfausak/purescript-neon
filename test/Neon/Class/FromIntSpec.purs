module Test.Neon.Class.FromIntSpec where

import Neon
import Neon.Data -- HACK
import Test.Spec

main :: Spec
main = describe "Neon.Class.FromInt" do
  describe "Boolean" do
    it "can be converted from an int" do
      fromInt 0 `shouldBe` Just false
  describe "Char" do
    it "can be converted from an int" do
      fromInt 0 `shouldBe` Just '\0'
