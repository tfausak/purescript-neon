module Test.Neon.Class.AddSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Add" do
  describe "Array" do
    it "can be added" do
      add [1, 2] [3, 4] `shouldBe` [1, 2, 3, 4]
  describe "Int" do
    it "can be added" do
      add 1 2 `shouldBe` 3
      add top 1 `shouldBe` bottom
  describe "Number" do
    it "can be added" do
      add 1.0 2.0 `shouldBe` 3.0
      add top 1.0 `shouldBe` infinity
  describe "String" do
    it "can be added" do
      add "ab" "cd" `shouldBe` "abcd"
