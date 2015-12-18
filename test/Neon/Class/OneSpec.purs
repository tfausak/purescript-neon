module Test.Neon.Class.OneSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.One" do
  describe "Int" do
    it "has a one" do
      one ?= 1
  describe "Number" do
    it "has a one" do
      one ?= 1.0
