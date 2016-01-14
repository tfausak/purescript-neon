module Test.Neon.Primitive.CharSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Char" do
  describe "toLower" do
    it "lower cases the character" do
      toLower 'A' ?= 'a'
  describe "toString" do
    it "converts to a string" do
      toString 'a' ?= "a"
  describe "toUpper" do
    it "upper cases the character" do
      toUpper 'a' ?= 'A'
