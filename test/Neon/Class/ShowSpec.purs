module Test.Neon.Class.ShowSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Show" do
  it "can show arrays" do
    show [1, 2] ?= "[1, 2]"
    show ([] :: Array Int) ?= "[]"
  it "can show booleans" do
    show false ?= "false"
  it "can show chars" do
    show 'a' ?= "'a'"
    show '\0' ?= "'\0'"
    show '\'' ?= "'\\''"
  it "can show ints" do
    show 1 ?= "1"
  it "can show lists" do
    show (Cons 1 (Cons 2 Nil)) ?= "Cons (1) (Cons (2) (Nil))"
  it "can show numbers" do
    show 1.0 ?= "1.0"
  it "can show strings" do
    show "a" ?= "\"a\""
