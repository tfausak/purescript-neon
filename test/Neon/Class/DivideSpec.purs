module Test.Neon.Class.DivideSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Divide" do
  describe "Int" do
    it "can be divided" do
      divide 4 2 `shouldBe` 2
      divide 5 2 `shouldBe` 2
      divide 1 0 `shouldBe` 0
  describe "Number" do
    it "can be divided" do
      divide 5.0 2.0 `shouldBe` 2.5
      -- divide 1.0 0.0 `shouldBe` nan -- TODO
