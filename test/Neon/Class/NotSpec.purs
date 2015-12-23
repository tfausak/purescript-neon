module Test.Neon.Class.NotSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Not" do
  describe "Boolean" do
    it "can be notted" do
      not false ?= true
  describe "Function" do
    it "can be notted" do
      not identity false ?= true
