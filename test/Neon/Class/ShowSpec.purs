module Test.Neon.Class.ShowSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Class.Show" do
  describe "Array" do
    it "can be shown" do
      show ([] :: Array Int) ?= "[]"
      show [1] ?= "[1]"
      show [1, 2] ?= "[1, 2]"
  describe "Boolean" do
    it "can be shown" do
      show false ?= "false"
  describe "Char" do
    it "can be shown" do
      show 'a' ?= "'a'"
      show '\0' ?= "'\\0'"
      show '\'' ?= "'\\''"
  describe "Int" do
    it "can be shown" do
      show 1 ?= "1"
  describe "Number" do
    it "can be shown" do
      show 1.0 ?= "1.0"
      show 1.1 ?= "1.1"
      show infinity ?= "infinity"
      show nan ?= "nan"
  describe "String" do
    it "can be shown" do
      show "a" ?= "\"a\""
      show "\0" ?= "\"\\0\""
      show "\"" ?= "\"\\\"\""
