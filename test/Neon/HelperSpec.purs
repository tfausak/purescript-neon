module Test.Neon.HelperSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Helper" do
  greaterOrEqual 2 1 `shouldBe` true
  lessOrEqual 1 2 `shouldBe` true
  negate 1 `shouldBe` -1
  notEqual false true `shouldBe` true
  reciprocal 2.0 `shouldBe` 0.5
