module Test.Neon.Class.BindSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Bind" do
  describe "Array" do
    it "can be bound" do
      bind [3, 5] (\ x -> [x, x * 2]) `shouldBe` [3, 6, 5, 10]
