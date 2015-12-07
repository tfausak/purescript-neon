module Test.Neon.Class.MultiplySpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Multiply" do
  describe "Int" do
    it "can be multiplied" do
      multiply 2 3 `shouldBe` 6
  describe "Number" do
    it "can be multiplied" do
      multiply 2.0 3.0 `shouldBe` 6.0
