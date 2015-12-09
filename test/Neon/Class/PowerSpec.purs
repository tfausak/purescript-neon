module Test.Neon.Class.PowerSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Power" do
  describe "Int" do
    it "supports exponentiation" do
      2 ^ 3 ?= 8
  describe "Number" do
    it "supports exponentiation" do
      2.0 ^ 3.0 ?= 8.0
