module Test.Neon.Data.MaybeSpec where

import Neon
import Neon.Data -- HACK
import Test.Spec

main :: Spec
main = describe "Neon.Data.Maybe" do
  describe "Equal" do
    it "can be equated" do
      equal Nothing (Nothing :: Maybe Int) `shouldBe` true
      equal (Just 1) (Just 1) `shouldBe` true
      equal Nothing (Just 1) `shouldBe` false
  describe "Show" do
    it "can be shown" do
      show (Nothing :: Maybe Int) `shouldBe` "Nothing"
      show (Just 1) `shouldBe` "Just (1)"
  describe "maybe" do
    it "uses the default with nothing" do
      maybe show "default" (Nothing :: Maybe Int) `shouldBe` "default"
    it "applies the function with just" do
      maybe show "default" (Just 1) `shouldBe` "1"
