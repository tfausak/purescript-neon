module Test.Neon.PrimitiveSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Neon.Primitive" do
  describe "Array" do
    pending ""
  describe "Boolean" do
    pending ""
  describe "Char" do
    describe "toLower" do
      it "lower cases the character" do
        toLower 'A' ?= 'a'
    describe "toString" do
      it "converts to a string" do
        toString 'a' ?= "a"
    describe "toUpper" do
      it "upper cases the character" do
        toUpper 'a' ?= 'A'
  describe "Function" do
    describe "always" do
      it "always returns the first argument" do
        always 1 unit ?= 1
    describe "compose" do
      it "composes functions" do
        compose (* 2) (+ 2) 3 ?= 10
    describe "flip" do
      it "flips functions" do
        flip add "a" "b" ?= "ab"
    describe "identity" do
      it "returns the argument" do
        identity unit ?= unit
  describe "Int" do
    describe "toNumber" do
      it "converts to a number" do
        toNumber 1 ?= 1.0
  describe "Number" do
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
  describe "Object" do
    pending ""
  describe "String" do
    pending ""
