module Test.Neon.Class.AndSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.And" do
  it "ands booleans" do
    and false true `shouldBe` false
  it "ands functions" do
    and (equal 1) (equal 2) 1 `shouldBe` false
