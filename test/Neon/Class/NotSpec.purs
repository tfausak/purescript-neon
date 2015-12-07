module Test.Neon.Class.NotSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Not" do
  describe "Boolean" do
    it "can be notted" do
      not false `shouldBe` true
