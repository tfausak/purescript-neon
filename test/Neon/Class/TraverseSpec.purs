module Test.Neon.Class.TraverseSpec where

import Neon
import Neon.Data -- Hack
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Traverse" do
  describe "Array" do
    it "can be traversed" do
      traverse (always Nothing) [1] `shouldBe` Nothing :: Maybe (Array Int)
      traverse (show >> Just) ([] :: Array Int) `shouldBe` Just []
      traverse (show >> Just) [1, 2] `shouldBe` Just ["1", "2"]
  describe "List" do
    it "can be traversed" do
      traverse (always Nothing) (Cons 1 Nil) `shouldBe` Nothing :: Maybe (List Int)
      traverse (show >> Just) (Nil :: List Int) `shouldBe` Just Nil
      traverse (show >> Just) (Cons 1 (Cons 2 Nil)) `shouldBe` Just (Cons "1" (Cons "2" Nil))
