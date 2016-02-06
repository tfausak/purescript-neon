module Test.Neon.Primitive.IntSpec where

import Data.Int as Int
import Test.Helper

spec :: Spec
spec = describe "Int" do
  describe "toNumber" do
    it "converts to a number" do
      toNumber 1 ?= 1.0
    it "is the same as Data.Int.toNumber" do
      quickCheck \ x -> toNumber x === Int.toNumber x
