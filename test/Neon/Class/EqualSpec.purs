module Test.Neon.Class.EqualSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Equal" do
  it "equals arrays" do
    equal [1, 2] [1, 2] `shouldBe` true
  it "equals booleans" do
    equal false false `shouldBe` true
  it "equals characters" do
    equal 'a' 'a' `shouldBe` true
  it "equals integers" do
    equal 1 1 `shouldBe` true
  it "equals numbers" do
    equal 1.0 1.0 `shouldBe` true
  it "equals strings" do
    equal "a" "a" `shouldBe` true
