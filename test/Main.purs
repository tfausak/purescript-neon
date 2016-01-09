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
      describe "Bottom" do
        it "has a bottom for booleans" do
          Neon.bottom ?= false
        it "has a bottom for chars" do
          Neon.bottom ?= '\0'
        it "has a bottom for ints" do
          Neon.bottom ?= -2147483648
        it "has a bottom for numbers" do
          Neon.bottom ?= -Neon.infinity
      describe "Chain" do
        it "can chain arrays" do
          Neon.chain (\ x -> [x, x * 2]) [3, 5] ?= [3, 6, 5, 10]
        it "can chain lists" do
          Neon.chain
            (\ x -> Neon.Cons x (Neon.Cons (x * 2) Neon.Nil))
            (Neon.Cons 3 (Neon.Cons 5 Neon.Nil))
            ?= Neon.Cons 3 (Neon.Cons 6 (Neon.Cons 5 (Neon.Cons 10 Neon.Nil)))
      describe "Divide" do
        it "can divide ints" do
          Neon.divide 2 5 ?= 2
        it "can divide numbers" do
          Neon.divide 2.0 5.0 ?= 2.5
      describe "Equal" do
        pending "can equal arrays"
        it "can equal booleans" do
          Neon.isEqual false false ?= true
        it "can equal chars" do
          Neon.isEqual 'a' 'a' ?= true
        it "can equal ints" do
          Neon.isEqual 1 1 ?= true
        pending "can equal lists"
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
        pending "can compare arrays"
        it "can compare booleans" do
          Neon.isGreater false true ?= true
        it "can compare chars" do
          Neon.isGreater 'a' 'b' ?= true
        it "can compare ints" do
          Neon.isGreater 1 2 ?= true
        pending "can compare lists"
        it "can compare numbers" do
          Neon.isGreater 1.0 2.0 ?= true
        it "can compare strings" do
          Neon.isGreater "a" "b" ?= true
      describe "Less" do
        pending "can compare arrays"
        it "can compare booleans" do
          Neon.isLess true false ?= true
        it "can compare chars" do
          Neon.isLess 'b' 'a' ?= true
        it "can compare ints" do
          Neon.isLess 2 1 ?= true
        pending "can compare lists"
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
        pending "can show arrays"
        it "can show booleans" do
          Neon.show false ?= "false"
        it "can show chars" do
          Neon.show 'a' ?= "'a'"
          Neon.show '\0' ?= "'\0'"
          Neon.show '\'' ?= "'\\''"
        it "can show ints" do
          Neon.show 1 ?= "1"
        pending "can show lists"
        it "can show numbers" do
          Neon.show 1.0 ?= "1.0"
        it "can show strings" do
          Neon.show "a" ?= "\"a\""
      describe "Subtract" do
        pending "can subtract arrays"
        it "can subtract ints" do
          Neon.subtract 1 2 ?= 1
        pending "can subtract lists"
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
      describe "Wrap" do
        it "can wrap arrays" do
          Neon.wrap 1 ?= [1]
        it "can wrap lists" do
          Neon.wrap 1 ?= Neon.Cons 1 Neon.Nil
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
      describe "asTypeOf" do
        it "is always" do
          Neon.asTypeOf [1] [] ?= ([] :: Array Int)
      describe "bind" do
        it "is chain flipped" do
          Neon.bind [3, 5] (\ x -> [x, x * 2]) ?= [3, 6, 5, 10]
      describe "isGreaterOrEqual" do
        it "is isGreater or isEqual" do
          Neon.isGreaterOrEqual 1 0 ?= false
          Neon.isGreaterOrEqual 1 1 ?= true
          Neon.isGreaterOrEqual 1 2 ?= true
      describe "isLessOrEqual" do
        it "is isLess or isEqual" do
          Neon.isLessOrEqual 1 0 ?= true
          Neon.isLessOrEqual 1 1 ?= true
          Neon.isLessOrEqual 1 2 ?= false
      describe "isNotEqual" do
        it "is not isEqual" do
          Neon.isNotEqual 1 1 ?= false
          Neon.isNotEqual 1 0 ?= true
      describe "negate" do
        it "subtracts from zero" do
          Neon.negate 1 ?= -1
      describe "void" do
        it "replaces values with unit" do
          Neon.void [1, 2] ?= [unit, unit]
    describe "Operator" do
      describe ">>" do
        it "is compose" do
          ((+ 2) Neon.>> (* 2)) 3 ?= 10
      describe "<<" do
        it "is compose" do
          ((+ 2) Neon.<< (* 2)) 3 ?= 8
      describe "^" do
        it "is power" do
          2 Neon.^ 3 ?= 8
      describe "*" do
        it "is multiply" do
          2 Neon.* 3 ?= 6
      describe "/" do
        it "is divide" do
          5 Neon./ 2 ?= 2
      describe "%" do
        it "is remainder" do
          5 Neon.% 2 ?= 1
      describe "+" do
        it "is add" do
          "a" Neon.+ "b" ?= "ab"
      describe "-" do
        it "is subtract" do
          2 Neon.- 1 ?= 1
      describe "==" do
        it "is isEqual" do
          false Neon.== false ?= true
      describe "!=" do
        it "is isNotEqual" do
          false Neon.!= true ?= true
      describe ">" do
        it "is isGreater" do
          2 Neon.> 1 ?= true
      describe ">=" do
        it "is isGreaterOrEqual" do
          1 Neon.>= 1 ?= true
      describe "<" do
        it "is isLess" do
          1 Neon.< 2 ?= true
      describe "<=" do
        it "is isLessOrEqual" do
          1 Neon.<= 1 ?= true
      describe "&&" do
        it "is and" do
          true Neon.&& true ?= true
      describe "||" do
        it "is or" do
          false Neon.|| true ?= true
      describe "|>" do
        it "is application" do
          false Neon.|> not ?= true
      describe "<|" do
        it "is application" do
          not Neon.<| false ?= true
    describe "Primitive" do
      describe "Array" do
        pending "TODO"
      describe "Boolean" do
        pending "TODO"
      describe "Char" do
        describe "toLower" do
          it "lower cases the character" do
            Neon.toLower 'A' ?= 'a'
        describe "toString" do
          it "converts to a string" do
            Neon.toString 'a' ?= "a"
        describe "toUpper" do
          it "upper cases the character" do
            Neon.toUpper 'a' ?= 'A'
      describe "Function" do
        describe "always" do
          it "always returns the first argument" do
            Neon.always 1 unit ?= 1
        describe "compose" do
          it "composes functions" do
            Neon.compose (* 2) (+ 2) 3 ?= 10
        describe "flip" do
          it "flips functions" do
            Neon.flip Neon.add "a" "b" ?= "ab"
        describe "identity" do
          it "returns the argument" do
            Neon.identity unit ?= unit
      describe "Int" do
        describe "toNumber" do
          it "converts to a number" do
            Neon.toNumber 1 ?= 1.0
      describe "Number" do
        describe "ceiling" do
          it "returns the smallest integer greater than the number" do
            Neon.ceiling 1.2 ?= 2
            Neon.ceiling (-1.2) ?= -1
        describe "floor" do
          it "returns the largest integer less than the number" do
            Neon.floor 1.2 ?= 1
            Neon.floor (-1.2) ?= -2
        describe "infinity" do
          pending "TODO"
        describe "isFinite" do
          it "returns false for infinity and nan" do
            Neon.isFinite Neon.infinity ?= false
            Neon.isFinite (-Neon.infinity) ?= false
            Neon.isFinite Neon.nan ?= false
          it "returns true for anything else" do
            Neon.isFinite 0.0 ?= true
        describe "isNaN" do
          it "returns true for nan" do
            Neon.isNaN Neon.nan ?= true
          it "returns false for anything else" do
            Neon.isNaN Neon.infinity ?= false
            Neon.isNaN 0.0 ?= false
        describe "nan" do
          pending "TODO"
        describe "round" do
          it "returns the integer closest to the number" do
            Neon.round 1.2 ?= 1
            Neon.round (-1.2) ?= -1
            Neon.round 1.5 ?= 2
      describe "Object" do
        pending "TODO"
      describe "String" do
        pending "TODO"
