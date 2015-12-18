module Test.Neon.Class.EqualSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Equal" do
  describe "Array" do
    it "can be equated" do
      [1, 2] == [1, 2] ?= true
  describe "Boolean" do
    it "can be equated" do
      false == false ?= true
  describe "Char" do
    it "can be equated" do
      'a' == 'a' ?= true
  describe "Function" do
    it "can be equated" do
      (+ 1) == (+ 1) ?= false
      let f = (+ 1)
      f == f ?= true
  describe "Int" do
    it "can be equated" do
      1 == 1 ?= true
  describe "Number" do
    it "can be equated" do
      1.0 == 1.0 ?= true
  describe "String" do
    it "can be equated" do
      "a" == "a" ?= true
