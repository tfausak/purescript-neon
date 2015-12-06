module Test.Neon.Data.PairSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Data.Pair" do
  describe "Equal" do
    it "can be equated" do
      equal (pair 1 2.0) (pair 1 2.0) `shouldBe` true
  describe "Show" do
    it "can be shown" do
      show (pair 1 2.0) `shouldBe` "Pair { first: 1, second: 2.0 }"