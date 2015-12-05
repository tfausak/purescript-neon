module Test.Neon.Class.ShowSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Show" do
  show false `shouldBe` "false"
  show "a" `shouldBe` "\"a\""
