module Test.Neon.Primitive.IntSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Int" do
  describe "toNumber" do
    it "converts to a number" do
      toNumber 1 ?= 1.0
