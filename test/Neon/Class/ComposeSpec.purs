module Test.Neon.Class.ComposeSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Compose" do
  describe "Function" do
    it "can be composed" do
      ((+ 2) >> (* 2)) 3 ?= 10
      ((+ 2) << (* 2)) 3 ?= 8
