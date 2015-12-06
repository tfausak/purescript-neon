module Test.Neon.Class.ToArraySpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.ToArray" do
  describe "String" do
    it "can be converted into an array" do
      toArray "ab" `shouldBe` ['a', 'b']
