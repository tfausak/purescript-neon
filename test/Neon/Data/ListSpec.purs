module Test.Neon.Data.ListSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Data.List" do
  let x = fromArray [1, 2] :: List Int
  describe "Equal" do
    it "can be equated" do
      equal x x `shouldBe` true
  describe "FromArray" do
    it "can be converted from an array" do
      fromArray [1, 2] `shouldBe` x
  describe "Map" do
    it "can be mapped" do
      map (+ 1) x `shouldBe` fromArray [2, 3]
  describe "Reduce" do
    it "can be reduced" do
      reduce add 0 x `shouldBe` 3
  describe "Show" do
    it "can be shown" do
      show x `shouldBe` "Cons (1) (Cons (2) (Nil))"
  describe "ToArray" do
    it "can be converted to an array" do
      toArray x `shouldBe` [1, 2]
