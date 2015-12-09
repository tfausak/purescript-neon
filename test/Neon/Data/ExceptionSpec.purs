module Test.Neon.Data.ExceptionSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Data.Exception" do
  describe "Equal" do
    it "can be equated" do
      equal (exception "a") (exception "a") ?= false
      let x = exception "a"
      equal x x ?= true
  describe "Show" do
    it "can be shown" do
      show (exception "a") ?= "exception \"a\""
  describe "exception" do
    pending
