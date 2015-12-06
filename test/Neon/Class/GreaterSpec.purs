module Test.Neon.Class.GreaterSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Greater" do
  it "greaters arrays" do
    greater [1, 2] [1, 1] `shouldBe` true
  it "greaters booleans" do
    greater true false `shouldBe` true
  it "greaters characters" do
    greater 'b' 'a' `shouldBe` true
  it "greaters integers" do
    greater 2 1 `shouldBe` true
  it "greaters numbers" do
    greater 2.0 1.0 `shouldBe` true
  it "greaters strings" do
    greater "ab" "aa" `shouldBe` true
