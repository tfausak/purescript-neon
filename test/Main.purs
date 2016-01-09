module Test.Main where

import Control.Monad.Aff as Aff
import Control.Monad.Eff as Eff
import Control.Monad.Eff.Console as Console
import Neon as Neon
import Neon.Data as Neon -- HACK
import Prelude
import Test.Spec (describe, it, pending)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (Process(), run)

(?=) :: forall a b. (Prelude.Eq a, Prelude.Show a) => a -> a -> Aff.Aff b Unit
(?=) = shouldEqual
infix 0 ?=

main :: Eff.Eff (console :: Console.CONSOLE, process :: Process) Unit
main = run [consoleReporter] do
  describe "Neon" do
    describe "Class" do
      describe "Add" do
        it "can add arrays" do
          Neon.add [2] [1] ?= [1, 2]
        it "can add ints" do
          Neon.add 2 1 ?= 3
        it "can add lists" do
          Neon.add
            (Neon.Cons 2 Neon.Nil)
            (Neon.Cons 1 Neon.Nil)
            ?= Neon.Cons 1 (Neon.Cons 2 Neon.Nil)
        it "can add numbers" do
          Neon.add 2.0 1.0 ?= 3.0
        it "can add strings" do
          Neon.add "b" "a" ?= "ab"
      describe "And" do
        it "can and arrays" do
          Neon.and [2] [1, 2] ?= [2]
        it "can and booleans" do
          Neon.and false false ?= false
          Neon.and true false ?= false
          Neon.and false true ?= false
          Neon.and true true ?= true
        it "can and functions" do
          Neon.and Neon.not Neon.not false ?= true
        it "can and lists" do
          Neon.and
            (Neon.Cons 2 Neon.Nil)
            (Neon.Cons 1 (Neon.Cons 2 Neon.Nil))
            ?= Neon.Cons 2 Neon.Nil
      describe "Apply" do
        it "can apply arrays" do
          Neon.apply [(+ 2), (* 2)] [3, 5] ?= [5, 7, 6, 10]
        it "can apply lists" do
          Neon.apply
            (Neon.Cons (+ 2) (Neon.Cons (* 2) Neon.Nil))
            (Neon.Cons 3 (Neon.Cons 5 Neon.Nil))
            ?= Neon.Cons 5 (Neon.Cons 7 (Neon.Cons 6 (Neon.Cons 10 Neon.Nil)))
      describe "Bind" do
        it "can bind arrays" do
          Neon.bind [3, 5] (\ x -> [x, x * 2]) ?= [3, 6, 5, 10]
        it "can bind lists" do
          Neon.bind
            (Neon.Cons 3 (Neon.Cons 5 Neon.Nil))
            (\ x -> Neon.Cons x (Neon.Cons (x * 2) Neon.Nil))
            ?= Neon.Cons 3 (Neon.Cons 6 (Neon.Cons 5 (Neon.Cons 10 Neon.Nil)))
      describe "Bottom" do
        it "has a bottom for booleans" do
          Neon.bottom ?= false
        it "has a bottom for chars" do
          Neon.bottom ?= '\0'
        it "has a bottom for ints" do
          Neon.bottom ?= -2147483648
        it "has a bottom for numbers" do
          Neon.bottom ?= -Neon.infinity
      describe "Divide" do
        it "can divide ints" do
          Neon.divide 2 5 ?= 2
        it "can divide numbers" do
          Neon.divide 2.0 5.0 ?= 2.5
      describe "Equal" do
        it "can equal booleans" do
          Neon.isEqual false false ?= true
        it "can equal chars" do
          Neon.isEqual 'a' 'a' ?= true
        it "can equal ints" do
          Neon.isEqual 1 1 ?= true
        it "can equal numbers" do
          Neon.isEqual 1.0 1.0 ?= true
        it "can equal strings" do
          Neon.isEqual "a" "a" ?= true
      describe "Filter" do
        it "can filter arrays" do
          Neon.filter (Neon.isGreater 1) [0, 2, 1] ?= [2]
        it "can filter lists" do
          Neon.filter
            (Neon.isGreater 1)
            (Neon.Cons 0 (Neon.Cons 2 (Neon.Cons 1 Neon.Nil)))
            ?= Neon.Cons 2 Neon.Nil
      describe "Greater" do
        it "can compare booleans" do
          Neon.isGreater false true ?= true
        it "can compare chars" do
          Neon.isGreater 'a' 'b' ?= true
        it "can compare ints" do
          Neon.isGreater 1 2 ?= true
        it "can compare numbers" do
          Neon.isGreater 1.0 2.0 ?= true
        it "can compare strings" do
          Neon.isGreater "a" "b" ?= true
      describe "Less" do
        it "can compare booleans" do
          Neon.isLess true false ?= true
        it "can compare chars" do
          Neon.isLess 'b' 'a' ?= true
        it "can compare ints" do
          Neon.isLess 2 1 ?= true
        it "can compare numbers" do
          Neon.isLess 2.0 1.0 ?= true
        it "can compare strings" do
          Neon.isLess "b" "a" ?= true
      describe "Map" do
        it "can map arrays" do
          Neon.map (+ 1) [1, 2] ?= [2, 3]
        it "can map lists" do
          Neon.map
            (+ 1)
            (Neon.Cons 1 (Neon.Cons 2 Neon.Nil))
            ?= Neon.Cons 2 (Neon.Cons 3 Neon.Nil)
      describe "Multiply" do
        it "can multiply ints" do
          Neon.multiply 3 2 ?= 6
        it "can multiply numbers" do
          Neon.multiply 3.0 2.0 ?= 6.0
      describe "Not" do
        it "can not booleans" do
          Neon.not false ?= true
          Neon.not true ?= false
      describe "One" do
        it "has a one for ints" do
          Neon.one ?= 1
        it "has a one for numbers" do
          Neon.one ?= 1.0
      describe "Or" do
        it "can or booleans" do
          Neon.or false false ?= false
          Neon.or false true ?= true
          Neon.or true false ?= true
          Neon.or true true ?= true
        it "can or functions" do
          Neon.or Neon.not Neon.not false ?= true
      describe "Power" do
        it "can power ints" do
          Neon.power 3 2 ?= 8
        it "can power numbers" do
          Neon.power 3.0 2.0 ?= 8.0
      describe "Pure" do
        it "can pure arrays" do
          Neon.pure 1 ?= [1]
        it "can pure lists" do
          Neon.pure 1 ?= Neon.Cons 1 Neon.Nil
      describe "Reduce" do
        it "can reduce arrays" do
          Neon.reduce Neon.add "a" ["b", "c"] ?= "cba"
        it "can reduce lists" do
          Neon.reduce
            Neon.add
            "a"
            (Neon.Cons "b" (Neon.Cons "c" Neon.Nil))
            ?= "cba"
      describe "Remainder" do
        it "can remainder ints" do
          Neon.remainder 2 5 ?= 1
      describe "Show" do
        it "can show booleans" do
          Neon.show false ?= "false"
        it "can show chars" do
          Neon.show 'a' ?= "'a'"
          Neon.show '\0' ?= "'\0'"
          Neon.show '\'' ?= "'\\''"
        it "can show ints" do
          Neon.show 1 ?= "1"
        it "can show numbers" do
          Neon.show 1.0 ?= "1.0"
        it "can show strings" do
          Neon.show "a" ?= "\"a\""
      describe "Subtract" do
        it "can subtract ints" do
          Neon.subtract 1 2 ?= 1
        it "can subtract numbers" do
          Neon.subtract 1.0 2.0 ?= 1.0
      describe "Top" do
        it "has a top for booleans" do
          Neon.top ?= true
        it "has a top for chars" do
          Neon.top ?= '\65535'
        it "has a top for ints" do
          Neon.top ?= 2147483647
        it "has a top for numbers" do
          Neon.top ?= Neon.infinity
      describe "Zero" do
        it "has a zero for arrays" do
          Neon.zero ?= ([] :: Array Unit)
        it "has a zero for ints" do
          Neon.zero ?= 0
        it "has a zero for lists" do
          Neon.zero ?= (Neon.Nil :: Neon.List Unit)
        it "has a zero for numbers" do
          Neon.zero ?= 0.0
        it "has a zero for strings" do
          Neon.zero ?= ""
    describe "Data" do
      pending "TODO"
    describe "Helper" do
      it "asTypeOf" do
        Neon.asTypeOf [1] [] ?= ([] :: Array Int)
      it "isGreaterOrEqual" do
        Neon.isGreaterOrEqual 1 0 ?= false
        Neon.isGreaterOrEqual 1 1 ?= true
        Neon.isGreaterOrEqual 1 2 ?= true
      it "isLessOrEqual" do
        Neon.isLessOrEqual 1 0 ?= true
        Neon.isLessOrEqual 1 1 ?= true
        Neon.isLessOrEqual 1 2 ?= false
      it "isNotEqual" do
        Neon.isNotEqual 1 1 ?= false
        Neon.isNotEqual 1 0 ?= true
      it "negate" do
        Neon.negate 1 ?= -1
      it "void" do
        Neon.void [1, 2] ?= [unit, unit]
    describe "Operator" do
      it ">>" do
        ((+ 2) Neon.>> (* 2)) 3 ?= 10
      it "<<" do
        ((+ 2) Neon.<< (* 2)) 3 ?= 8
      it "^" do
        2 Neon.^ 3 ?= 8
      it "*" do
        2 Neon.* 3 ?= 6
      it "/" do
        5 Neon./ 2 ?= 2
      it "%" do
        5 Neon.% 2 ?= 1
      it "+" do
        "a" Neon.+ "b" ?= "ab"
      it "-" do
        2 Neon.- 1 ?= 1
      it "==" do
        false Neon.== false ?= true
      it "!=" do
        false Neon.!= true ?= true
      it ">" do
        2 Neon.> 1 ?= true
      it ">=" do
        1 Neon.>= 1 ?= true
      it "<" do
        1 Neon.< 2 ?= true
      it "<=" do
        1 Neon.<= 1 ?= true
      it "&&" do
        true Neon.&& true ?= true
      it "||" do
        false Neon.|| true ?= true
      it "|>" do
        false Neon.|> not ?= true
      it "<|" do
        not Neon.<| false ?= true
    describe "Primitive" do
      describe "Function" do
        it "always" do
          Neon.always 1 unit ?= 1
        it "compose" do
          Neon.compose (* 2) (+ 2) 3 ?= 10
        it "flip" do
          Neon.flip Neon.add "a" "b" ?= "ab"
        it "identity" do
          Neon.identity unit ?= unit
