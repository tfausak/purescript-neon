module Test.Neon.HelperSpec where

import Neon
import Neon.Data -- HACK
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
