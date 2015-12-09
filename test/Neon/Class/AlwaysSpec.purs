module Test.Neon.Class.AlwaysSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Always" do
  describe "Function" do
    it "always returns the value" do
      always true unit ?= true
