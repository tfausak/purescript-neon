module Test.Neon.Class.TopSpec where

import Test.Helper

spec :: Spec
spec = describe "Top" do
  it "has a top for booleans" do
    top ?= true
  it "has a top for chars" do
    top ?= '\65535'
  it "has a top for ints" do
    top ?= 2147483647
  it "has a top for numbers" do
    top ?= infinity
