module Test.Neon.Class.BottomSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Bottom" do
  describe "Boolean" do
    it "has a bottom" do
      bottom `shouldBe` false
  describe "Char" do
    it "has a bottom" do
      bottom `shouldBe` '\0'
  describe "Int" do
    it "has a bottom" do
      bottom `shouldBe` -2147483648
  describe "Number" do
    it "has a bottom" do
      bottom `shouldBe` -infinity
