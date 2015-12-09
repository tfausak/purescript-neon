module Test.Neon.Class.FlipSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Flip" do
  describe "Function" do
    it "can be flipped" do
      flip add "ab" "cd" ?= "cdab"
