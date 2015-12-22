module Test.Neon.Class.FilterSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Filter" do
  describe "Array" do
    it "can be filtered" do
      filter (\ x -> x % 2 == 0) [1, 2, 3, 4] ?= [2, 4]
