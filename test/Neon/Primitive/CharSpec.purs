module Test.Neon.Primitive.CharSpec where

import Data.Char as Char
import Test.Helper

spec :: Spec
spec = describe "Char" do
  describe "toLower" do
    it "lower cases the character" do
      toLower 'A' ?= 'a'
    it "is the same as Data.Char.toLower" do
      quickCheck \ x -> toLower x === Char.toLower x
  describe "toString" do
    it "converts to a string" do
      toString 'a' ?= "a"
    it "is the same as Data.Char.toString" do
      quickCheck \ x -> toString x === Char.toString x
  describe "toUpper" do
    it "upper cases the character" do
      toUpper 'a' ?= 'A'
    it "is the same as Data.Char.toUpper" do
      quickCheck \ x -> toUpper x === Char.toUpper x
