module Test.Neon.Class.OrSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Or" do
  describe "Boolean" do
    it "can be ored" do
      false || true ?= true
  describe "Function" do
    it "can be ored" do
      (identity || not) false ?= true
