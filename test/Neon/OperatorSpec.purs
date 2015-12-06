module Test.Neon.OperatorSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Operator" do
  (1 + 2) `shouldBe` 3
  (1 == 1) `shouldBe` true
  (5 % 2) `shouldBe` 1
  (2 * 3) `shouldBe` 6
  (2 ^ 3) `shouldBe` 8
  (2 - 1) `shouldBe` 1
