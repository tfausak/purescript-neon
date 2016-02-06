module Test.Neon.Class.BottomSpec where

import Prelude as Prelude
import Test.Helper

spec :: Spec
spec = describe "Bottom" do
  it "has a bottom for booleans" do
    bottom ?= false
  it "has a bottom for chars" do
    bottom ?= '\0'
  it "has a bottom for ints" do
    bottom ?= Prelude.bottom :: Int
  it "has a bottom for numbers" do
    bottom ?= -infinity
