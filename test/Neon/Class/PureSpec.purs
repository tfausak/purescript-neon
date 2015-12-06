module Test.Neon.Class.PureSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Pure" do
  describe "Array" do
    it "supports pure" do
      pure 1 `shouldBe` [1]
