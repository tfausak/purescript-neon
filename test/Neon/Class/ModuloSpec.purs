module Test.Neon.Class.ModuloSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Modulo" do
  it "modulos integers" do
    modulo 5 2 `shouldBe` 1
