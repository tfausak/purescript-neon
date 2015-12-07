module Test.Neon.Class.LessSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Less" do
  describe "Array" do
    it "can be less than" do
      less [1, 2] [1, 1] `shouldBe` false
  describe "Boolean" do
    it "can be less than" do
      less true false `shouldBe` false
  describe "Char" do
    it "can be less than" do
      less 'b' 'a' `shouldBe` false
  describe "Int" do
    it "can be less than" do
      less 2 1 `shouldBe` false
  describe "Number" do
    it "can be less than" do
      less 2.0 1.0 `shouldBe` false
  describe "String" do
    it "can be less than" do
      less "ab" "aa" `shouldBe` false
