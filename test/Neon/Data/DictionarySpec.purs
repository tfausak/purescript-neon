module Test.Neon.Data.DictionarySpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Data.Dictionary" do
  let d = fromArray [pair "a" 1, pair "b" 2] :: Dictionary Int
  describe "Equal" do
    it "can be equated" do
      equal d d `shouldBe` true
  describe "FromArray" do
    it "can be converted from an array" do
      fromArray [pair "a" 1, pair "b" 2] `shouldBe` d
  describe "Show" do
    it "can be shown" do
      show d `shouldBe` "fromArray [Pair { first: \"a\", second: 1 }, Pair { first: \"b\", second: 2 }]"
  describe "ToArray" do
    it "can be converted to an array" do
      toArray d `shouldBe` [pair "a" 1, pair "b" 2]
