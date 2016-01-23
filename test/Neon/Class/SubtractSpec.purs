module Test.Neon.Class.SubtractSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Subtract" do
  pending "can subtract arrays" -- TODO
  it "can subtract ints" do
    subtract 1 2 ?= 1
  pending "can subtract lists" -- TODO
  it "can subtract numbers" do
    subtract 1.0 2.0 ?= 1.0
