module Test.Neon.HelperSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Helper" do
  describe "for" do
    it "is map flipped" do
      for [1, 2] (+ 1) `shouldBe` [2, 3]
  describe "greaterOrEqual" do
    it "is greater or equal" do
      greaterOrEqual 2 1 `shouldBe` true
      greaterOrEqual 1 1 `shouldBe` true
  describe "lessOrEqual" do
    it "is less or equal" do
      lessOrEqual 1 2 `shouldBe` true
      lessOrEqual 1 1 `shouldBe` true
  describe "negate" do
    it "is the number subtracted from zero" do
      negate 1 `shouldBe` -1
      negate 1.0 `shouldBe` -1.0
  describe "notEqual" do
    it "is not equal" do
      notEqual false true `shouldBe` true
  describe "product" do
    it "is the array multiplied together" do
      product [2, 3] `shouldBe` 6
  describe "reciprocal" do
    it "is one divided by the number" do
      reciprocal 2.0 `shouldBe` 0.5
  describe "sum" do
    it "is the array summed up" do
      sum [2, 3] `shouldBe` 5
