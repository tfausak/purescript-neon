module Test.Neon.Class.BottomSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Bottom" do
  bottom `shouldBe` false
  bottom `shouldBe` '\0'
  bottom `shouldBe` -9007199254740991
  bottom `shouldBe` -infinity
