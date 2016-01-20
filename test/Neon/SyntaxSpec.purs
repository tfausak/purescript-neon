module Test.Neon.SyntaxSpec where

import Prelude (..) as Prelude
import Test.Helper (..)

spec :: Spec
spec = describe "Syntax" do
  describe "bind" do
    it "is the same as Prelude.bind" do
      let f x = [x - 1, x, x + 1]
      quickCheck \ x -> bind [x] f === Prelude.bind [x] f
