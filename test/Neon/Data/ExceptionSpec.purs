module Test.Neon.Data.ExceptionSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Data.Exception" do
  describe "Equal" do
    it "can be equated" do
      equal (exception "a") (exception "a") `shouldBe` false
      let x = exception "a"
      equal x x `shouldBe` true
  describe "Show" do
    it "can be shown" do
      show (exception "a") `shouldBe` "exception \"a\""
  describe "exception" do
    pure unit
