module Test.Neon.Class.ShowSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Show" do
  it "shows arrays" do
    show ([] :: Array Int) `shouldBe` "[]"
    show [1] `shouldBe` "[1]"
    show [1, 2] `shouldBe` "[1, 2]"
  it "shows booleans" do
    show false `shouldBe` "false"
  it "shows characters" do
    show 'a' `shouldBe` "'a'"
    show '\0' `shouldBe` "'\\0'"
    show '\'' `shouldBe` "'\\''"
  it "shows integers" do
    show 1 `shouldBe` "1"
  it "shows numbers" do
    show 1.0 `shouldBe` "1.0"
    show 1.1 `shouldBe` "1.1"
    show infinity `shouldBe` "infinity"
    show nan `shouldBe` "nan"
  it "shows strings" do
    show "a" `shouldBe` "\"a\""
    show "\0" `shouldBe` "\"\\0\""
    show "\"" `shouldBe` "\"\\\"\""
