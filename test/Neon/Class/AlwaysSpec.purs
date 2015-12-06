module Test.Neon.Class.AlwaysSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Always" do
  describe "Function" do
    it "always returns the value" do
      always true unit `shouldBe` true
