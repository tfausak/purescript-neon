module Test.Neon.OperatorSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Operator" do
  it "defines the operators" do
    (false |> not) `shouldBe` true
    (not <| false) `shouldBe` true
    (1 + 2) `shouldBe` 3
    (false && true) `shouldBe` false
    ((+ 2) >> (* 2)) 3 `shouldBe` 10
    ((+ 2) << (* 2)) 3 `shouldBe` 8
    (1 == 1) `shouldBe` true
    (2 > 1) `shouldBe` true
    (2 >= 1) `shouldBe` true
    (1 < 2) `shouldBe` true
    (1 <= 2) `shouldBe` true
    (5 % 2) `shouldBe` 1
    (2 * 3) `shouldBe` 6
    (1 != 2) `shouldBe` true
    (false || true) `shouldBe` true
    (2 ^ 3) `shouldBe` 8
    (2 - 1) `shouldBe` 1
