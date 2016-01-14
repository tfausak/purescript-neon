module Test.Neon.Primitive.NumberSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Number" do
  describe "ceiling" do
    it "returns the smallest integer greater than the number" do
      ceiling 1.2 ?= 2
      ceiling (-1.2) ?= -1
  describe "finite" do
    it "returns false for infinity and nan" do
      finite infinity ?= false
      finite (-infinity) ?= false
      finite nan ?= false
    it "returns true for anything else" do
      finite 0.0 ?= true
  describe "floor" do
    it "returns the largest integer less than the number" do
      floor 1.2 ?= 1
      floor (-1.2) ?= -2
  describe "infinity" do
    pending ""
  describe "isNaN" do
    it "returns true for nan" do
      isNaN nan ?= true
    it "returns false for anything else" do
      isNaN infinity ?= false
      isNaN 0.0 ?= false
  describe "nan" do
    pending ""
  describe "round" do
    it "returns the integer closest to the number" do
      round 1.2 ?= 1
      round (-1.2) ?= -1
      round 1.5 ?= 2
