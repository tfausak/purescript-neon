module Test.Neon.Class.FlipSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Flip" do
  flip add "ab" "cd" `shouldBe` "cdab"
