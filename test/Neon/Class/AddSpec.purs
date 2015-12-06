module Test.Neon.Class.AddSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Class.Add" do
  it "adds arrays" do
    add [1, 2] [3, 4] `shouldBe` [1, 2, 3, 4]
  it "adds integers" do
    add 1 2 `shouldBe` 3
  it "adds numbers" do
    add 1.0 2.0 `shouldBe` 3.0
  it "adds strings" do
    add "ab" "cd" `shouldBe` "abcd"
