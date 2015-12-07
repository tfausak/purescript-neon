module Test.Neon.Class.ApplySpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Apply" do
  describe "Array" do
    it "can be applied" do
      apply [(+ 2), (* 2)] [3, 5] `shouldBe` [5, 6, 7, 10]
