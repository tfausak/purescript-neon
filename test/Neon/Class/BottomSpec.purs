module Test.Neon.Class.BottomSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Bottom" do
  bottom `shouldBe` false
  bottom `shouldBe` '\0'
  bottom `shouldBe` -2147483648
  bottom `shouldBe` -infinity
