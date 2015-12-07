module Test.Neon.Class.ComposeSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Compose" do
  describe "Function" do
    it "can be composed" do
      compose (+ 2) (* 2) 3 `shouldBe` 10
