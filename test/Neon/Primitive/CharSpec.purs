module Test.Neon.Primitive.CharSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Primitive.Char" do
  describe "toLower" do
    it "lowercases the character" do
      toLower 'A' ?= 'a'
  describe "toString" do
    it "converts the character into a string" do
      toString 'a' ?= "a"
  describe "toUpper" do
    it "uppercases the character" do
      toUpper 'a' ?= 'A'
