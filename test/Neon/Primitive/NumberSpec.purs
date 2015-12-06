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
    pure unit
  describe "nan" do
    pure unit
  describe "round" do
    it "returns the integer closest to the number" do
      round 1.2 `shouldBe` 1
      round (-1.2) `shouldBe` -1
      round 1.5 `shouldBe` 2
  describe "truncate" do
    it "returns the number without the decimal component" do
      truncate 1.2 `shouldBe` 1
      truncate (-1.2) `shouldBe` -1
