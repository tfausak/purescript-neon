module Test.Neon.Data.MaybeSpec where

import Neon
import Neon.Data -- HACK
import Test.Spec

main :: Spec
main = describe "Neon.Data.Maybe" do
  describe "Apply" do
    it "can be applied" do
      apply (Just (+ 1)) (Just 1) `shouldBe` Just 2
  describe "Bind" do
    it "can be bound" do
      bind (Just 1) (\ x -> Just (x + 1)) `shouldBe` Just 2
  describe "Equal" do
    it "can be equated" do
      equal Nothing (Nothing :: Maybe Int) `shouldBe` true
      equal (Just 1) (Just 1) `shouldBe` true
      equal Nothing (Just 1) `shouldBe` false
  describe "FromArray" do
    it "can be converted from an array" do
      fromArray [1, 2] `shouldBe` Just 1
  describe "Greater" do
    it "can be greater than" do
      greater (Just 2) (Just 1) `shouldBe` true
  describe "Less" do
    it "can be less than" do
      less (Just 1) (Just 2) `shouldBe` true
  describe "Map" do
    it "can be mapped" do
      map (+ 1) (Just 1) `shouldBe` Just 2
  describe "Pure" do
    it "supports pure" do
      pure 1 `shouldBe` Just 1
  describe "Show" do
    it "can be shown" do
      show (Nothing :: Maybe Int) `shouldBe` "Nothing"
      show (Just 1) `shouldBe` "Just (1)"
  describe "ToArray" do
    it "can be converted into an array" do
      toArray (Just 1) `shouldBe` [1]
  describe "maybe" do
    it "uses the default with nothing" do
      maybe show "default" (Nothing :: Maybe Int) `shouldBe` "default"
    it "applies the function with just" do
      maybe show "default" (Just 1) `shouldBe` "1"
