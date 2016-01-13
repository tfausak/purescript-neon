module Test.Neon.ClassSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Class" do
  describe "Add" do
    it "can add arrays" do
      add [2] [1] ?= [1, 2]
    it "can add ints" do
      add 2 1 ?= 3
    it "can add lists" do
      add (Cons 2 Nil) (Cons 1 Nil) ?= Cons 1 (Cons 2 Nil)
    it "can add numbers" do
      add 2.0 1.0 ?= 3.0
    it "can add strings" do
      add "b" "a" ?= "ab"
  describe "And" do
    it "can and arrays" do
      and [2] [1, 2] ?= [2]
    it "can and booleans" do
      and false false ?= false
      and true false ?= false
      and false true ?= false
      and true true ?= true
    it "can and functions" do
      and not not false ?= true
    it "can and lists" do
      and (Cons 2 Nil) (Cons 1 (Cons 2 Nil)) ?= Cons 2 Nil
  describe "Apply" do
    it "can apply arrays" do
      apply [(+ 2), (* 2)] [3, 5] ?= [5, 7, 6, 10]
    it "can apply lists" do
      apply
        (Cons (+ 2) (Cons (* 2) Nil))
        (Cons 3 (Cons 5 Nil))
        ?= Cons 5 (Cons 7 (Cons 6 (Cons 10 Nil)))
  describe "Bottom" do
    it "has a bottom for booleans" do
      bottom ?= false
    it "has a bottom for chars" do
      bottom ?= '\0'
    it "has a bottom for ints" do
      bottom ?= Prelude.bottom :: Int
    it "has a bottom for numbers" do
      bottom ?= -infinity
  describe "Chain" do
    it "can chain arrays" do
      chain (\ x -> [x, x * 2]) [3, 5] ?= [3, 6, 5, 10]
    it "can chain lists" do
      chain
        (\ x -> Cons x (Cons (x * 2) Nil))
        (Cons 3 (Cons 5 Nil))
        ?= Cons 3 (Cons 6 (Cons 5 (Cons 10 Nil)))
  describe "Divide" do
    it "can divide ints" do
      divide 2 5 ?= 2
    it "can divide numbers" do
      divide 2.0 5.0 ?= 2.5
  describe "Equal" do
    pending "can equal arrays"
    it "can equal booleans" do
      equal false false ?= true
    it "can equal chars" do
      equal 'a' 'a' ?= true
    it "can equal ints" do
      equal 1 1 ?= true
    pending "can equal lists"
    it "can equal numbers" do
      equal 1.0 1.0 ?= true
    it "can equal strings" do
      equal "a" "a" ?= true
  describe "Filter" do
    it "can filter arrays" do
      filter (greater 1) [0, 2, 1] ?= [2]
    it "can filter lists" do
      filter (greater 1) (Cons 0 (Cons 2 (Cons 1 Nil))) ?= Cons 2 Nil
  describe "Greater" do
    pending "can compare arrays"
    it "can compare booleans" do
      greater false true ?= true
    it "can compare chars" do
      greater 'a' 'b' ?= true
    it "can compare ints" do
      greater 1 2 ?= true
    pending "can compare lists"
    it "can compare numbers" do
      greater 1.0 2.0 ?= true
    it "can compare strings" do
      greater "a" "b" ?= true
  describe "Less" do
    pending "can compare arrays"
    it "can compare booleans" do
      less true false ?= true
    it "can compare chars" do
      less 'b' 'a' ?= true
    it "can compare ints" do
      less 2 1 ?= true
    pending "can compare lists"
    it "can compare numbers" do
      less 2.0 1.0 ?= true
    it "can compare strings" do
      less "b" "a" ?= true
  describe "Map" do
    it "can map arrays" do
      map (+ 1) [1, 2] ?= [2, 3]
    it "can map lists" do
      map (+ 1) (Cons 1 (Cons 2 Nil)) ?= Cons 2 (Cons 3 Nil)
  describe "Multiply" do
    it "can multiply ints" do
      multiply 3 2 ?= 6
    it "can multiply numbers" do
      multiply 3.0 2.0 ?= 6.0
  describe "Not" do
    it "can not booleans" do
      not false ?= true
      not true ?= false
  describe "One" do
    it "has a one for ints" do
      one ?= 1
    it "has a one for numbers" do
      one ?= 1.0
  describe "Or" do
    it "can or arrays" do
      or [1, 2] [2, 3] ?= [2, 3, 1]
    it "can or booleans" do
      or false false ?= false
      or false true ?= true
      or true false ?= true
      or true true ?= true
    it "can or functions" do
      or not not false ?= true
    it "can or lists" do
      or (Cons 1 Nil) (Cons 2 Nil) ?= Cons 2 (Cons 1 Nil)
  describe "Power" do
    it "can power ints" do
      power 3 2 ?= 8
    it "can power numbers" do
      power 3.0 2.0 ?= 8.0
  describe "Reduce" do
    it "can reduce arrays" do
      reduce add "a" ["b", "c"] ?= "cba"
    it "can reduce lists" do
      reduce add "a" (Cons "b" (Cons "c" Nil)) ?= "cba"
  describe "Remainder" do
    it "can remainder ints" do
      remainder 2 5 ?= 1
  describe "Show" do
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
    pending "can show lists"
    it "can show numbers" do
      show 1.0 ?= "1.0"
    it "can show strings" do
      show "a" ?= "\"a\""
  describe "Subtract" do
    pending "can subtract arrays"
    it "can subtract ints" do
      subtract 1 2 ?= 1
    pending "can subtract lists"
    it "can subtract numbers" do
      subtract 1.0 2.0 ?= 1.0
  describe "Top" do
    it "has a top for booleans" do
      top ?= true
    it "has a top for chars" do
      top ?= '\65535'
    it "has a top for ints" do
      top ?= 2147483647
    it "has a top for numbers" do
      top ?= infinity
  describe "Wrap" do
    it "can wrap arrays" do
      wrap 1 ?= [1]
    it "can wrap lists" do
      wrap 1 ?= Cons 1 Nil
  describe "Zero" do
    it "has a zero for arrays" do
      zero ?= ([] :: Array Unit)
    it "has a zero for ints" do
      zero ?= 0
    it "has a zero for lists" do
      zero ?= (Nil :: List Unit)
    it "has a zero for numbers" do
      zero ?= 0.0
    it "has a zero for strings" do
      zero ?= ""
