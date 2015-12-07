module Test.Neon.Data.DictionarySpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Data.Dictionary" do
  let d = fromArray [pair "a" 1, pair "b" 2] :: Dictionary Int
  describe "Add" do
    it "can be added" do
      add (fromArray [pair "a" 1]) (fromArray [pair "b" 2]) `shouldBe` d
  describe "Equal" do
    it "can be equated" do
      equal d d `shouldBe` true
  describe "FromArray" do
    it "can be converted from an array" do
      fromArray [pair "a" 1, pair "b" 2] `shouldBe` d
  describe "Map" do
    it "can be mapped" do
      map (+ 1) d `shouldBe` fromArray [pair "a" 2, pair "b" 3]
  describe "Reduce" do
    it "can be reduced" do
      reduce add 0 d `shouldBe` 3
  describe "Show" do
    it "can be shown" do
      show d `shouldBe` "fromArray [Pair { first: \"a\", second: 1 }, Pair { first: \"b\", second: 2 }]"
  describe "ToArray" do
    it "can be converted to an array" do
      toArray d `shouldBe` [pair "a" 1, pair "b" 2]
  describe "Zero" do
    it "has a zero" do
      zero `shouldBe` fromArray ([] :: Array (Pair String Int)) :: Dictionary Int
