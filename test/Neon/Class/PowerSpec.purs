module Test.Neon.Class.PowerSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Power" do
  describe "Int" do
    it "supports exponentiation" do
      power 2 3 `shouldBe` 8
  describe "Number" do
    it "supports exponentiation" do
      power 2.0 3.0 `shouldBe` 8.0
