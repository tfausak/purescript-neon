module Test.Neon.Class.MultiplySpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Multiply" do
  describe "Int" do
    it "can be multiplied" do
      2 * 3 ?= 6
  describe "Number" do
    it "can be multiplied" do
      2.0 * 3.0 ?= 6.0
