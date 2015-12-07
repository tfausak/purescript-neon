module Test.Neon.Class.AndSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.And" do
  describe "Boolean" do
    it "can be anded" do
      and false true `shouldBe` false
