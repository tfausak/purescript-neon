module Test.Neon.Class.OneSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.One" do
  it "ones integers" do
    one `shouldBe` 1
  it "ones numbers" do
    one `shouldBe` 1.0
