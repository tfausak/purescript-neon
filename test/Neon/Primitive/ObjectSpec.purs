module Test.Neon.Primitive.ObjectSpec where

import Test.Helper

spec :: Spec
spec = describe "Object" do
  it "has no exports" do
    true ?= true
