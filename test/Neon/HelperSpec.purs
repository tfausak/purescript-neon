module Test.Neon.HelperSpec where

import Neon
import Neon.Data -- HACK
import Test.Spec

main :: Spec
main = describe "Neon.Helper" do
  describe "absoluteValue" do
    it "returns the absolute value" do
      absoluteValue 1 `shouldBe` 1
      absoluteValue (-1.0) `shouldBe` 1.0
  describe "all" do
    it "checks if all elements pass the predicate" do
      all identity [] `shouldBe` true
      all identity [true, false] `shouldBe` false
      all (> 1) [2, 3] `shouldBe` true
  describe "any" do
    it "checks if any elements pass the predicate" do
      any identity [] `shouldBe` false
      any identity [true, false] `shouldBe` true
      any (> 1) [1, 2] `shouldBe` true
  describe "clamp" do
    it "clamps the value between the bounds" do
      clamp 3 5 2 `shouldBe` 3
      clamp 3 5 4 `shouldBe` 4
      clamp 3 5 6 `shouldBe` 5
  describe "decrement" do
    it "decrements the value" do
      decrement true `shouldBe` Just false
  describe "for" do
    it "is map flipped" do
      for [1, 2] (+ 1) `shouldBe` [2, 3]
  describe "greaterOrEqual" do
    it "is greater or equal" do
      greaterOrEqual 2 1 `shouldBe` true
      greaterOrEqual 1 1 `shouldBe` true
  describe "increment" do
    it "increments the value" do
      increment false `shouldBe` Just true
  describe "isJust" do
    it "returns true if just" do
      isJust (Just 1) `shouldBe` true
    it "returns false if nothing" do
      isJust (Nothing :: Maybe Int) `shouldBe` false
  describe "isNothing" do
    it "returns false if just" do
      isNothing (Just 1) `shouldBe` false
    it "returns true if nothing" do
      isNothing (Nothing :: Maybe Int) `shouldBe` true
  describe "join" do
    it "joins things" do
      join [[1, 2], [3, 4]] `shouldBe` [1, 2, 3, 4]
  describe "lessOrEqual" do
    it "is less or equal" do
      lessOrEqual 1 2 `shouldBe` true
      lessOrEqual 1 1 `shouldBe` true
  describe "max" do
    it "returns the max" do
      max 1 2 `shouldBe` 2
  describe "maximum" do
    it "returns nothing for an empty colleciton" do
      maximum ([] :: Array Int) `shouldBe` Nothing
    it "returns the maximum value" do
      maximum [1, 2, 0] `shouldBe` Just 2
  describe "min" do
    it "returns the min" do
      min 1 2 `shouldBe` 1
  describe "minimum" do
    it "returns nothing for an empty colleciton" do
      minimum ([] :: Array Int) `shouldBe` Nothing
    it "returns the minimum value" do
      minimum [1, 2, 0] `shouldBe` Just 0
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
  describe "range" do
    it "returns a range of values" do
      range 1 3 `shouldBe` [1, 2, 3]
  describe "reciprocal" do
    it "is one divided by the number" do
      reciprocal 2.0 `shouldBe` 0.5
  describe "sign" do
    it "returns the sign" do
      sign (-2) `shouldBe` -1
      sign 0.0 `shouldBe` 0.0
      sign 2 `shouldBe` 1
  describe "sum" do
    it "is the array summed up" do
      sum [2, 3] `shouldBe` 5
  describe "unsafeFromJust" do
    it "returns the value if just" do
      unsafeFromJust (Just 1) `shouldBe` 1
    it "throws an exception if nothing" do
      pending
  describe "withDefault" do
    it "returns the default if nothing" do
      withDefault 1 Nothing `shouldBe` 1
    it "returns the value if just" do
      withDefault 1 (Just 2) `shouldBe` 2
