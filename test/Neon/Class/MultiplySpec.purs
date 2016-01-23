module Test.Neon.Class.MultiplySpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Multiply" do
  it "can multiply ints" do
    multiply 3 2 ?= 6
  it "can multiply numbers" do
    multiply 3.0 2.0 ?= 6.0
