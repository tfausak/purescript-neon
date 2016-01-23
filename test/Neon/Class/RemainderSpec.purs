module Test.Neon.Class.RemainderSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Remainder" do
  it "can remainder ints" do
    remainder 2 5 ?= 1
