module Test.Neon.Class.AddSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Add" do
  describe "Array" do
    it "can be added" do
      [1, 2] + [3, 4] ?= [1, 2, 3, 4]
  describe "Int" do
    it "can be added" do
      1 + 2 ?= 3
      top + 1 ?= bottom
  describe "Number" do
    it "can be added" do
      1.0 + 2.0 ?= 3.0
      top + 1.0 ?= infinity
  describe "String" do
    it "can be added" do
      "ab" + "cd" ?= "abcd"
