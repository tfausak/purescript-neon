module Test.Neon.Class.ZeroSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Zero" do
  describe "Array" do
    it "has a zero" do
      zero `shouldBe` ([] :: Array Int)
  describe "Int" do
    it "has a zero" do
      zero `shouldBe` 0
  describe "Number" do
    it "has a zero" do
      zero `shouldBe` 0.0
  describe "String" do
    it "has a zero" do
      zero `shouldBe` ""
