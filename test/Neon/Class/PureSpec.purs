module Test.Neon.Class.PureSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Pure" do
  describe "Array" do
    it "supports pure" do
      pure 1 ?= [1]
