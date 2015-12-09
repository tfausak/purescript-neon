module Test.Neon.Class.DivideSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Divide" do
  describe "Int" do
    it "can be divided" do
      4 / 2 ?= 2
      5 / 2 ?= 2
      1 / 0 ?= 0
  describe "Number" do
    it "can be divided" do
      5.0 / 2.0 ?= 2.5
      1.0 / 0.0 ?= infinity
      isNaN (0.0 / 0.0) ?= true
