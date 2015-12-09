module Test.Neon.Class.GreaterSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Greater" do
  describe "Array" do
    it "can be greater than" do
      greater [1, 2] [1, 1] ?= true
  describe "Boolean" do
    it "can be greater than" do
      greater true false ?= true
  describe "Char" do
    it "can be greater than" do
      greater 'b' 'a' ?= true
  describe "Int" do
    it "can be greater than" do
      greater 2 1 ?= true
  describe "Number" do
    it "can be greater than" do
      greater 2.0 1.0 ?= true
  describe "String" do
    it "can be greater than" do
      greater "ab" "aa" ?= true
