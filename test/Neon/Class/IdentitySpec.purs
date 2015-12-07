module Test.Neon.Class.IdentitySpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Class.Identity" do
  describe "Function" do
    it "has an identity" do
      identity true `shouldBe` true
