module Test.Neon.Class.PowerSpec where

import Test.Helper

spec :: Spec
spec = describe "Power" do
  it "can power ints" do
    power 3 2 ?= 8
  it "can power numbers" do
    power 3.0 2.0 ?= 8.0
