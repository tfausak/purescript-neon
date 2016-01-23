module Test.Neon.Class.DivideSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Divide" do
  it "can divide ints" do
    divide 2 5 ?= 2
  it "can divide numbers" do
    divide 2.0 5.0 ?= 2.5
