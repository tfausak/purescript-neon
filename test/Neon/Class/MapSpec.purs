module Test.Neon.Class.MapSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Map" do
  it "can map arrays" do
    map (+ 1) [1, 2] ?= [2, 3]
  it "can map lists" do
    map (+ 1) (Cons 1 (Cons 2 Nil)) ?= Cons 2 (Cons 3 Nil)
