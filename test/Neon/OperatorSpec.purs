module Test.Neon.OperatorSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Operator" do
  (1 + 2) `shouldBe` 3
  (1 == 1) `shouldBe` true
  (2 - 1) `shouldBe` 1
