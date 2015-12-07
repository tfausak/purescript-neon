module Test.Neon.Class.ShowSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Show" do
  describe "Array" do
    it "can be shown" do
      show ([] :: Array Int) `shouldBe` "[]"
      show [1] `shouldBe` "[1]"
      show [1, 2] `shouldBe` "[1, 2]"
  describe "Boolean" do
    it "can be shown" do
      show false `shouldBe` "false"
  describe "Char" do
    it "can be shown" do
      show 'a' `shouldBe` "'a'"
      show '\0' `shouldBe` "'\\0'"
      show '\'' `shouldBe` "'\\''"
  describe "Int" do
    it "can be shown" do
      show 1 `shouldBe` "1"
  describe "Number" do
    it "can be shown" do
      show 1.0 `shouldBe` "1.0"
      show 1.1 `shouldBe` "1.1"
      show infinity `shouldBe` "infinity"
      show nan `shouldBe` "nan"
  describe "String" do
    it "can be shown" do
      show "a" `shouldBe` "\"a\""
      show "\0" `shouldBe` "\"\\0\""
      show "\"" `shouldBe` "\"\\\"\""
