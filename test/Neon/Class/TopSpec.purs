module Test.Neon.Class.TopSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Top" do
  top `shouldBe` true
  top `shouldBe` '\65535'
  top `shouldBe` 9007199254740991
  top `shouldBe` infinity
