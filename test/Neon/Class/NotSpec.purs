module Test.Neon.Class.NotSpec where

import Test.Helper

spec :: Spec
spec = describe "Not" do
  it "can not booleans" do
    not false ?= true
    not true ?= false
