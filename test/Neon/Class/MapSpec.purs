module Test.Neon.Class.MapSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Map" do
  describe "Array" do
    it "can be mapped" do
      map (+ 1) [1, 2] ?= [2, 3]
