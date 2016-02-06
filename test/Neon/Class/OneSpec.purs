module Test.Neon.Class.OneSpec where

import Test.Helper

spec :: Spec
spec = describe "One" do
  it "has a one for ints" do
    one ?= 1
  it "has a one for numbers" do
    one ?= 1.0
