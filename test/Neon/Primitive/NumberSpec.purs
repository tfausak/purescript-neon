module Test.Neon.Primitive.NumberSpec where

import Data.Int as Int
import Global as Global
import Test.Helper

spec :: Spec
spec = describe "Number" do
  describe "ceiling" do
    it "returns the smallest integer greater than the number" do
      ceiling 1.2 ?= 2
      ceiling (-1.2) ?= -1
    it "is the same as Data.Int.ceil" do
      quickCheck \ x -> ceiling x === Int.ceil x
  describe "finite" do
    it "returns false for infinity and nan" do
      finite infinity ?= false
      finite (-infinity) ?= false
      finite nan ?= false
    it "returns true for anything else" do
      finite 0.0 ?= true
    it "is the same as Global.isFinite" do
      quickCheck \ x -> finite x === Global.isFinite x
  describe "floor" do
    it "returns the largest integer less than the number" do
      floor 1.2 ?= 1
      floor (-1.2) ?= -2
    it "is the same as Data.Int.floor" do
      quickCheck \ x -> floor x === Int.floor x
  describe "infinity" do
    it "is the same as Global.infinity" do
      infinity ?= Global.infinity
  describe "isNaN" do
    it "returns true for nan" do
      isNaN nan ?= true
    it "returns false for anything else" do
      isNaN infinity ?= false
      isNaN 0.0 ?= false
    it "is the same as Global.isNaN" do
      quickCheck \ x -> isNaN x === Global.isNaN x
  describe "nan" do
    pending "is the same as Global.nan"
  describe "round" do
    it "returns the integer closest to the number" do
      round 1.2 ?= 1
      round (-1.2) ?= -1
      round 1.5 ?= 2
    it "is the same as Data.Int.round" do
      quickCheck \ x -> round x === Data.Int.round x
