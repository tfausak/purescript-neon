module Test.Neon.Class.OrSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Or" do
  describe "Boolean" do
    it "can be ored" do
      or false true `shouldBe` true
  describe "Function" do
    it "can be ored" do
      or (equal 1) (equal 2) 1 `shouldBe` true
