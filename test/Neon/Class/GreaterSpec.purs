module Test.Neon.Class.GreaterSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Greater" do
  describe "Array" do
    it "can be greater than" do
      greater [1, 2] [1, 1] `shouldBe` true
  describe "Boolean" do
    it "can be greater than" do
      greater true false `shouldBe` true
  describe "Char" do
    it "can be greater than" do
      greater 'b' 'a' `shouldBe` true
  describe "Int" do
    it "can be greater than" do
      greater 2 1 `shouldBe` true
  describe "Number" do
    it "can be greater than" do
      greater 2.0 1.0 `shouldBe` true
  describe "String" do
    it "can be greater than" do
      greater "ab" "aa" `shouldBe` true
