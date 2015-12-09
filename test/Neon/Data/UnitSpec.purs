module Test.Neon.Data.UnitSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Data.Unit" do
  describe "Equal" do
    it "can be equated" do
      unit == unit ?= true
  describe "Show" do
    it "can be shown" do
      show unit ?= "unit"
