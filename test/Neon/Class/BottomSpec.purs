module Test.Neon.Class.BottomSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Bottom" do
  describe "Boolean" do
    it "has a bottom" do
      bottom ?= false
  describe "Char" do
    it "has a bottom" do
      bottom ?= '\0'
  describe "Int" do
    it "has a bottom" do
      bottom ?= round (-2147483648.0)
  describe "Number" do
    it "has a bottom" do
      bottom ?= -infinity
