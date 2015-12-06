module Test.Neon.Class.LessSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Less" do
  it "lesses arrays" do
    less [1, 2] [1, 1] `shouldBe` false
  it "lesses booleans" do
    less true false `shouldBe` false
  it "lesses characters" do
    less 'b' 'a' `shouldBe` false
  it "lesses integers" do
    less 2 1 `shouldBe` false
  it "lesses numbers" do
    less 2.0 1.0 `shouldBe` false
  it "lesses strings" do
    less "ab" "aa" `shouldBe` false
