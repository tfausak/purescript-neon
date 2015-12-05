module Test.Neon.Class.EqualSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Equal" do
  equal false false `shouldBe` true
  equal "a" "a" `shouldBe` true
