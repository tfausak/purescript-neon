module Test.Neon.Primitive.CharSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Primitive.Char" do
  describe "toLower" do
    it "lowercases the character" do
      toLower 'A' `shouldBe` 'a'
  describe "toString" do
    it "converts the character into a string" do
      toString 'a' `shouldBe` "a"
  describe "toUpper" do
    it "uppercases the character" do
      toUpper 'a' `shouldBe` 'A'
