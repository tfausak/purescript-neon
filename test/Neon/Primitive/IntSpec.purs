module Test.Neon.Primitive.IntSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Primitive.Int" do
  describe "toNumber" do
    it "converts an integer into a number" do
      toNumber 1 `shouldBe` 1.0
