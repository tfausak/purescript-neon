module Test.Neon.Class.EqualSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Equal" do
  describe "Array" do
    it "can be equated" do
      equal [1, 2] [1, 2] `shouldBe` true
  describe "Boolean" do
    it "can be equated" do
      equal false false `shouldBe` true
  describe "Char" do
    it "can be equated" do
      equal 'a' 'a' `shouldBe` true
  describe "Function" do
    it "can be equated" do
      equal (+ 1) (+ 1) `shouldBe` false
      let f = (+ 1)
      equal f f `shouldBe` true
  describe "Int" do
    it "can be equated" do
      equal 1 1 `shouldBe` true
  describe "Number" do
    it "can be equated" do
      equal 1.0 1.0 `shouldBe` true
  describe "String" do
    it "can be equated" do
      equal "a" "a" `shouldBe` true
