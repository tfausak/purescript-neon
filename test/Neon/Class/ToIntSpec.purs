module Test.Neon.Class.ToIntSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.ToInt" do
  describe "Boolean" do
    it "can be converted into an int" do
      toInt false `shouldBe` 0
  describe "Char" do
    it "can be converted into an int" do
      toInt '\0' `shouldBe` 0
