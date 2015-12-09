module Test.Neon.Class.TopSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Top" do
  describe "Boolean" do
    it "has a top" do
      top ?= true
  describe "Char" do
    it "has a top" do
      top ?= '\65535'
  describe "Int" do
    it "has a top" do
      top ?= 2147483647
  describe "Number" do
    it "has a top" do
      top ?= infinity
