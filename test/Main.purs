module Test.Main where

import Neon (..)

import Control.Monad.Aff (Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Prelude (..) as P
import Prelude (bind)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (Process, run)

main :: Eff (console :: CONSOLE, process :: Process) P.Unit
main = run [consoleReporter] spec

_shouldEqual :: forall a b. (P.Eq a, P.Show a) => a -> a -> Aff b P.Unit
_shouldEqual = shouldEqual
infix 0 _shouldEqual as ?=

spec :: Spec (console :: CONSOLE, process :: Process) P.Unit
spec = describe "Neon" do
  describe "Class" do
    describe "And" do
      it "conjoins booleans" do
        false :and false ?= false
        false :and true ?= false
        true :and false ?= false
        true :and true ?= true
      it "conjoins functions" do
        let f = and true
        (f :and f) false ?= false
        (f :and f) true ?= true
    describe "DividedBy" do
      it "divides integers" do
        5 :dividedBy 2 ?= 2
        5 :dividedBy (-2) ?= (-2)
        (-5) :dividedBy 2 ?= (-2)
        (-5) :dividedBy (-2) ?= 2
      it "divides numbers" do
        5.0 :dividedBy 2.0 ?= 2.5
        5.0 :dividedBy (-2.0) ?= (-2.5)
        (-5.0) :dividedBy 2.0 ?= (-2.5)
        (-5.0) :dividedBy (-2.0) ?= 2.5
    describe "Equal" do
      it "equates arrays" do
        [1] :equal [1] ?= true
        [1] :equal [2] ?= false
      it "equates booleans" do
        false :equal false ?= true
        false :equal true ?= false
        true :equal false ?= false
        true :equal true ?= true
      it "equates characters" do
        'a' :equal 'a' ?= true
        'a' :equal 'b' ?= false
      it "equates functions" do
        let f = and true
        f :equal f ?= true
        f :equal (and true) ?= false
      it "equates integers" do
        1 :equal 1 ?= true
        1 :equal 2 ?= false
      it "equates numbers" do
        1.0 :equal 1.0 ?= true
        1.0 :equal 1.1 ?= false
      it "equates strings" do
        "a" :equal "a" ?= true
        "a" :equal "b" ?= false
    describe "Greater" do
      it "compares arrays" do
        [1] :greater [1] ?= false
        [2] :greater [1] ?= false
        [1] :greater [] ?= true
      it "compares booleans" do
        false :greater false ?= false
        false :greater true ?= false
        true :greater false ?= true
        true :greater true ?= false
      it "compares characters" do
        'a' :greater 'a' ?= false
        'b' :greater 'a' ?= true
      it "compares integers" do
        1 :greater 1 ?= false
        2 :greater 1 ?= true
      it "compares numbers" do
        1.0 :greater 1.0 ?= false
        1.1 :greater 1.0 ?= true
      it "compares strings" do
        "a" :greater "a" ?= false
        "b" :greater "a" ?= true
    describe "Less" do
      it "compares arrays" do
        [1] :less [1] ?= false
        [1] :less [2] ?= false
        [] :less [1] ?= true
      it "compares booleans" do
        false :less false ?= false
        false :less true ?= true
        true :less false ?= false
        true :less true ?= false
      it "compares characters" do
        'a' :less 'a' ?= false
        'a' :less 'b' ?= true
      it "compares integers" do
        1 :less 1 ?= false
        1 :less 2 ?= true
      it "compares numbers" do
        1.0 :less 1.0 ?= false
        1.0 :less 1.1 ?= true
      it "compares strings" do
        "a" :less "a" ?= false
        "a" :less "b" ?= true
    describe "Minus" do
      it "subtracts arrays" do
        [1, 2] :minus [1] ?= [2]
      it "subtracts integers" do
        3 :minus 2 ?= 1
      it "subtracts numbers" do
        3.2 :minus 2.1 ?= 1.1
    describe "Modulo" do
      it "takes the remainder of integers" do
        5 :modulo 2 ?= 1
        5 :modulo (-2) ?= 1
        (-5) :modulo 2 ?= (-1)
        (-5) :modulo (-2) ?= (-1)
    describe "Negate" do
      it "complements booleans" do
        false :negate ?= true
        true :negate ?= false
      it "complements integers" do
        1 :negate ?= P.negate 1
      it "complements numbers" do
        1.0 :negate ?= P.negate 1.0
      it "complements functions" do
        let f = and true
        (f :negate) false ?= true
        (f :negate) true ?= false
    describe "Or" do
      it "disjoins booleans" do
        false :or false ?= false
        false :or true ?= true
        true :or false ?= true
        true :or true ?= true
      it "disjoins functions" do
        let f = or false
        (f :or f) false ?= false
        (f :or f) true ?= true
    describe "Plus" do
      it "adds arrays" do
        [1] :plus [2] ?= [1, 2]
      it "adds integers" do
        1 :plus 2 ?= 3
      it "adds numbers" do
        1.2 :plus 2.3 ?= 3.5
      it "adds strings" do
        "a" :plus "b" ?= "ab"
    describe "Times" do
      it "multiplies integers" do
        2 :times 3 ?= 6
      it "multiplies numbers" do
        1.5 :times 2.5 ?= 3.75
  describe "Helper" do
    describe "greaterOrEqual" do
      it "disjoins comparison and equality" do
        1 :greaterOrEqual 0 ?= true
        1 :greaterOrEqual 1 ?= true
        1 :greaterOrEqual 2 ?= false
    describe "lessOrEqual" do
      it "disjoins comparison and equality" do
        1 :lessOrEqual 0 ?= false
        1 :lessOrEqual 1 ?= true
        1 :lessOrEqual 2 ?= true
    describe "notEqual" do
      it "negates equality" do
        1 :notEqual 1 ?= false
        1 :notEqual 2 ?= true
  describe "Operator" do
    describe "*" do
      it "is times" do
        2 * 3 ?= 6
      it "associates left" do
        2 * 3 * 4 ?= 24
    describe "/" do
      it "is dividedBy" do
        5 / 2 ?= 2
      it "associates left" do
        6 / 3 / 2 ?= 1
    describe "%" do
      it "is modulo" do
        5 % 2 ?= 1
      it "associates left" do
        11 % 6 % 2 ?= 1
    describe "+" do
      it "is plus" do
        "a" + "b" ?= "ab"
      it "associates left" do
        "a" + "b" + "c" ?= "abc"
    describe "-" do
      it "is minus" do
        3 - 2 ?= 1
      it "associates left" do
        6 - 3 - 2 ?= 1
    describe "==" do
      it "is equal" do
        1 == 1 ?= true
      it "does not associate" do
        -- HACK: This shouldn't need parentheses. This is probably a bug in the
        --   parser. I should find a minimal case and create an issue for it.
        (1 == 1 == 2 == 2) ?= true
    describe "!=" do
      it "is notEqual" do
        1 != 1 ?= false
      it "does not associate" do
        (1 != 2 != 3 != 3) ?= true
    describe ">" do
      it "is greater" do
        2 > 1 ?= true
      it "does not associate" do
        (3 > 2 > 1 > 1) ?= true
    describe ">=" do
      it "is greaterOrEqual" do
        2 >= 1 ?= true
      it "does not associate" do
        (3 >= 2 >= 1 >= 1) ?= true
    describe "<" do
      it "is less" do
        1 < 2 ?= true
      it "does not associate" do
        (1 < 1 < 2 < 3) ?= true
    describe "<=" do
      it "is lessOrEqual" do
        1 <= 2 ?= true
      it "does not associate" do
        (1 <= 1 <= 2 <= 3) ?= true
    describe "&&" do
      it "is and" do
        false && true ?= false
      it "associates right" do
        false && true && false ?= false
    describe "||" do
      it "is or" do
        false || true ?= true
      it "associates right" do
        false || true || false ?= true
    describe ":" do
      it "applies functions" do
        "a" :plus "b" ?= "ab"
      it "associates left" do
        "a" :plus "b" :plus "c" ?= "abc"
