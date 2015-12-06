module Test.Neon.Class.NotSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Not" do
  it "nots booleans" do
    not false `shouldBe` true
  it "nots functions" do
    not (equal 1) 1 `shouldBe` false
