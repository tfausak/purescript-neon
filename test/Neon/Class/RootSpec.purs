module Test.Neon.Class.RootSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Root" do
  describe "Int" do
    it "supports roots" do
      root 2 9 `shouldBe` 3
  describe "Number" do
    it "supports roots" do
      root 2.0 9.0 `shouldBe` 3.0
