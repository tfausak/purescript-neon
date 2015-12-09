module Test.Neon.Class.ToArraySpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.ToArray" do
  describe "Array" do
    it "can be converted into an array" do
      toArray [1, 2] ?= [1, 2]
  describe "String" do
    it "can be converted into an array" do
      toArray "ab" ?= ['a', 'b']
