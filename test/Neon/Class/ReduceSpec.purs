module Test.Neon.Class.ReduceSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Reduce" do
  describe "Array" do
    it "can be reduced" do
      reduce add "z" ["a", "b"] ?= "zab"
