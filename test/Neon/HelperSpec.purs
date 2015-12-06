module Test.Neon.HelperSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Helper" do
  for [1, 2] (+ 1) `shouldBe` [2, 3]
  greaterOrEqual 2 1 `shouldBe` true
  lessOrEqual 1 2 `shouldBe` true
  negate 1 `shouldBe` -1
  notEqual false true `shouldBe` true
  product [2, 3] `shouldBe` 6
  reciprocal 2.0 `shouldBe` 0.5
  sum [2, 3] `shouldBe` 5
