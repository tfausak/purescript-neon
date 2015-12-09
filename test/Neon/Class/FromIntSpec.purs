module Test.Neon.Class.FromIntSpec where

import Neon
import Neon.Data -- HACK
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.FromInt" do
  describe "Boolean" do
    it "can be converted from an int" do
      fromInt 0 ?= Just false
  describe "Char" do
    it "can be converted from an int" do
      fromInt 0 ?= Just '\0'
