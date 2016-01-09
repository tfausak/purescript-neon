module Test.Main where

import Control.Monad.Aff as Aff
import Control.Monad.Eff as Eff
import Control.Monad.Eff.Console as Console
import Neon hiding (bind)
import Neon.Data -- HACK
import Prelude (bind)
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
          bottom ?= -2147483648
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
          isEqual false false ?= true
        it "can equal chars" do
          isEqual 'a' 'a' ?= true
        it "can equal ints" do
          isEqual 1 1 ?= true
        pending "can equal lists"
        it "can equal numbers" do
          isEqual 1.0 1.0 ?= true
        it "can equal strings" do
          isEqual "a" "a" ?= true
      describe "Filter" do
        it "can filter arrays" do
          filter (isGreater 1) [0, 2, 1] ?= [2]
        it "can filter lists" do
          filter (isGreater 1) (Cons 0 (Cons 2 (Cons 1 Nil))) ?= Cons 2 Nil
      describe "Greater" do
        pending "can compare arrays"
        it "can compare booleans" do
          isGreater false true ?= true
        it "can compare chars" do
          isGreater 'a' 'b' ?= true
        it "can compare ints" do
          isGreater 1 2 ?= true
        pending "can compare lists"
        it "can compare numbers" do
          isGreater 1.0 2.0 ?= true
        it "can compare strings" do
          isGreater "a" "b" ?= true
      describe "Less" do
        pending "can compare arrays"
        it "can compare booleans" do
          isLess true false ?= true
        it "can compare chars" do
          isLess 'b' 'a' ?= true
        it "can compare ints" do
          isLess 2 1 ?= true
        pending "can compare lists"
        it "can compare numbers" do
          isLess 2.0 1.0 ?= true
        it "can compare strings" do
          isLess "b" "a" ?= true
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
        it "can or booleans" do
          or false false ?= false
          or false true ?= true
          or true false ?= true
          or true true ?= true
        it "can or functions" do
          or not not false ?= true
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
        pending "can show arrays"
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
    describe "Data" do
      pending "TODO"
    describe "Helper" do
      describe "absoluteValue" do
        pending "TODO"
      describe "all" do
        pending "TODO"
      describe "any" do
        pending "TODO"
      describe "asTypeOf" do
        it "is always" do
          asTypeOf [1] [] ?= ([] :: Array Int)
      describe "bind" do
        it "is chain flipped" do
          bind [3, 5] (\ x -> [x, x * 2]) ?= [3, 6, 5, 10]
      describe "flatten" do
        pending "TODO"
      describe "isGreaterOrEqual" do
        it "is isGreater or isEqual" do
          isGreaterOrEqual 1 0 ?= false
          isGreaterOrEqual 1 1 ?= true
          isGreaterOrEqual 1 2 ?= true
      describe "isInfinite" do
        pending "TODO"
      describe "isLessOrEqual" do
        it "is isLess or isEqual" do
          isLessOrEqual 1 0 ?= true
          isLessOrEqual 1 1 ?= true
          isLessOrEqual 1 2 ?= false
      describe "isNotEqual" do
        it "is not isEqual" do
          isNotEqual 1 1 ?= false
          isNotEqual 1 0 ?= true
      describe "negate" do
        it "subtracts from zero" do
          negate 1 ?= -1
      describe "product" do
        pending "TODO"
      describe "reciprocal" do
        pending "TODO"
      describe "sequence" do
        pending "TODO"
      describe "sign" do
        pending "TODO"
      describe "sum" do
        pending "TODO"
      describe "void" do
        it "replaces values with unit" do
          void [1, 2] ?= [unit, unit]
    describe "Operator" do
      describe "^" do
        it "is power" do
          2 ^ 3 ?= 8
      describe "*" do
        it "is multiply" do
          2 * 3 ?= 6
      describe "/" do
        it "is divide" do
          5 / 2 ?= 2
      describe "%" do
        it "is remainder" do
          5 % 2 ?= 1
      describe "+" do
        it "is add" do
          "a" + "b" ?= "ab"
      describe "-" do
        it "is subtract" do
          2 - 1 ?= 1
      describe "==" do
        it "is isEqual" do
          false == false ?= true
      describe "!=" do
        it "is isNotEqual" do
          false != true ?= true
      describe ">" do
        it "is isGreater" do
          2 > 1 ?= true
      describe ">=" do
        it "is isGreaterOrEqual" do
          1 >= 1 ?= true
      describe "<" do
        it "is isLess" do
          1 < 2 ?= true
      describe "<=" do
        it "is isLessOrEqual" do
          1 <= 1 ?= true
      describe "&&" do
        it "is and" do
          true && true ?= true
      describe "||" do
        it "is or" do
          false || true ?= true
      describe ".." do
        it "is application" do
          false .. not ?= true
    describe "Primitive" do
      describe "Array" do
        pending "TODO"
      describe "Boolean" do
        pending "TODO"
      describe "Char" do
        describe "toLower" do
          it "lower cases the character" do
            toLower 'A' ?= 'a'
        describe "toString" do
          it "converts to a string" do
            toString 'a' ?= "a"
        describe "toUpper" do
          it "upper cases the character" do
            toUpper 'a' ?= 'A'
      describe "Function" do
        describe "always" do
          it "always returns the first argument" do
            always 1 unit ?= 1
        describe "compose" do
          it "composes functions" do
            compose (* 2) (+ 2) 3 ?= 10
        describe "flip" do
          it "flips functions" do
            flip add "a" "b" ?= "ab"
        describe "identity" do
          it "returns the argument" do
            identity unit ?= unit
      describe "Int" do
        describe "toNumber" do
          it "converts to a number" do
            toNumber 1 ?= 1.0
      describe "Number" do
        describe "ceiling" do
          it "returns the smallest integer greater than the number" do
            ceiling 1.2 ?= 2
            ceiling (-1.2) ?= -1
        describe "floor" do
          it "returns the largest integer less than the number" do
            floor 1.2 ?= 1
            floor (-1.2) ?= -2
        describe "infinity" do
          pending "TODO"
        describe "isFinite" do
          it "returns false for infinity and nan" do
            isFinite infinity ?= false
            isFinite (-infinity) ?= false
            isFinite nan ?= false
          it "returns true for anything else" do
            isFinite 0.0 ?= true
        describe "isNaN" do
          it "returns true for nan" do
            isNaN nan ?= true
          it "returns false for anything else" do
            isNaN infinity ?= false
            isNaN 0.0 ?= false
        describe "nan" do
          pending "TODO"
        describe "round" do
          it "returns the integer closest to the number" do
            round 1.2 ?= 1
            round (-1.2) ?= -1
            round 1.5 ?= 2
      describe "Object" do
        pending "TODO"
      describe "String" do
        pending "TODO"
