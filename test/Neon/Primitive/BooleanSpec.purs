module Test.Neon.Primitive.BooleanSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Boolean" do
  it "has no exports" do
    true ?= true
