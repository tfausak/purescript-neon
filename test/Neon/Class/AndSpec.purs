module Test.Neon.Class.AndSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.And" do
  describe "Boolean" do
    it "can be anded" do
      and false true ?= false
