module Test.Neon.Class.OrSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Or" do
  it "ors booleans" do
    or false true `shouldBe` true
  it "ors functions" do
    or (equal 1) (equal 2) 1 `shouldBe` true
