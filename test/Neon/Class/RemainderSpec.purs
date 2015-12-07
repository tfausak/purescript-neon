module Test.Neon.Class.RemainderSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Remainder" do
  describe "Int" do
    it "supports modular arithmetic" do
      remainder 5 2 `shouldBe` 1
