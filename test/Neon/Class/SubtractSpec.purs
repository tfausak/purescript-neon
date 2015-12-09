module Test.Neon.Class.SubtractSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Subtract" do
  describe "Int" do
    it "can be subtracted" do
      subtract 2 1 ?= 1
  describe "Number" do
    it "can be subtracted" do
      subtract 2.0 1.0 ?= 1.0
