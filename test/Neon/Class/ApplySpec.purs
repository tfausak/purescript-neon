module Test.Neon.Class.ApplySpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Apply" do
  it "can apply arrays" do
    apply [(+ 2), (* 2)] [3, 5] ?= [5, 7, 6, 10]
  it "can apply lists" do
    apply
      (Cons (+ 2) (Cons (* 2) Nil))
      (Cons 3 (Cons 5 Nil))
      ?= Cons 5 (Cons 7 (Cons 6 (Cons 10 Nil)))
