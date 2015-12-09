module Test.Neon.Class.TraverseSpec where

import Neon
import Neon.Data -- Hack
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Traverse" do
  describe "Array" do
    it "can be traversed" do
      traverse (always Nothing) [1] ?= Nothing :: Maybe (Array Int)
      traverse (show >> Just) ([] :: Array Int) ?= Just []
      traverse (show >> Just) [1, 2] ?= Just ["1", "2"]
  describe "List" do
    it "can be traversed" do
      traverse (always Nothing) (Cons 1 Nil) ?= Nothing :: Maybe (List Int)
      traverse (show >> Just) (Nil :: List Int) ?= Just Nil
      traverse (show >> Just) (Cons 1 (Cons 2 Nil)) ?= Just (Cons "1" (Cons "2" Nil))
