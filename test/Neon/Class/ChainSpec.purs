module Test.Neon.Class.ChainSpec where

import Test.Helper

spec :: Spec
spec = describe "Chain" do
  it "can chain arrays" do
    chain (\ x -> [x, x * 2]) [3, 5] ?= [3, 6, 5, 10]
  it "can chain lists" do
    chain
      (\ x -> Cons x (Cons (x * 2) Nil))
      (Cons 3 (Cons 5 Nil))
      ?= Cons 3 (Cons 6 (Cons 5 (Cons 10 Nil)))
