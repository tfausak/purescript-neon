module Test.Neon.Primitive.NumberSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Primitive.Number" do
  describe "ceiling" do
    it "returns the smallest integer greater than the number" do
      ceiling 1.2 `shouldBe` 2
      ceiling (-1.2) `shouldBe` -1
  describe "floor" do
    it "returns the largest integer less than the number" do
      floor 1.2 `shouldBe` 1
      floor (-1.2) `shouldBe` -2
  describe "infinity" do
    pending
  describe "isFinite" do
    it "returns false for infinity and nan" do
      isFinite infinity `shouldBe` false
      isFinite (-infinity) `shouldBe` false
      isFinite nan `shouldBe` false
    it "returns true for anything else" do
      isFinite 0.0 `shouldBe` true
  describe "isNaN" do
    it "returns true for nan" do
      isNaN nan `shouldBe` true
    it "returns false for anything else" do
      isNaN infinity `shouldBe` false
      isNaN 0.0 `shouldBe` false
  describe "nan" do
    pending
  describe "round" do
    it "returns the integer closest to the number" do
      round 1.2 `shouldBe` 1
      round (-1.2) `shouldBe` -1
      round 1.5 `shouldBe` 2
  describe "truncate" do
    it "returns the number without the decimal component" do
      truncate 1.2 `shouldBe` 1
      truncate (-1.2) `shouldBe` -1
