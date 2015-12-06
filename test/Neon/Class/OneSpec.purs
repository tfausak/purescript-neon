module Test.Neon.Class.OneSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.One" do
  describe "Int" do
    it "has a one" do
      one `shouldBe` 1
  describe "Number" do
    it "has a one" do
      one `shouldBe` 1.0
