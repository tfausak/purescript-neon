module Test.Neon.Class.LessSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Less" do
  describe "Array" do
    it "can be less than" do
      [1, 2] < [1, 1] ?= false
  describe "Boolean" do
    it "can be less than" do
      true < false ?= false
  describe "Char" do
    it "can be less than" do
      'b' < 'a' ?= false
  describe "Int" do
    it "can be less than" do
      2 < 1 ?= false
  describe "Number" do
    it "can be less than" do
      2.0 < 1.0 ?= false
  describe "String" do
    it "can be less than" do
      "ab" < "aa" ?= false
