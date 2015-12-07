module Test.Neon.Class.IdentitySpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Identity" do
  describe "Function" do
    it "has an identity" do
      identity true `shouldBe` true
