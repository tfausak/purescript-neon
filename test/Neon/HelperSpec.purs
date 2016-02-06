module Test.Neon.HelperSpec where

import Control.Bind as Bind
import Control.Monad as Monad
import Data.Array as Array
import Data.Enum as Enum
import Data.Foldable as Foldable
import Data.Int as Int
import Data.Maybe as Maybe
import Data.Ord as Ord
import Data.Traversable as Traversable
import Data.Tuple as Tuple
import Global as Global
import Math as Math
import Prelude as Prelude
import Test.Helper

spec :: Spec
spec = describe "Helper" do
  describe "absoluteValue" do
    it "returns the absolute value" do
      absoluteValue 1 ?= 1
      absoluteValue 0.0 ?= 0.0
      absoluteValue (-1) ?= 1
    it "is the same as Math.abs" do
      quickCheck \ x -> absoluteValue x === Math.abs x
  describe "all" do
    it "returns true when every element passes the predicate" do
      all (greater 1) [] ?= true
      all (greater 1) [2, 3] ?= true
      all (greater 1) [1, 2] ?= false
    it "is the same as Data.Foldable.all" do
      quickCheck \ (x :: Array Int) -> all (greater 1) x === Foldable.all (greater 1) x
  describe "any" do
    it "returns true when any element passes the predicate" do
      any (greater 1) [] ?= false
      any (greater 1) [1, 2] ?= true
      any (greater 1) [0, 1] ?= false
    it "is the same as Data.Foldable.any" do
      quickCheck \ (x :: Array Int) -> any (greater 1) x === Foldable.any (greater 1) x
  describe "asTypeOf" do
    it "is always" do
      asTypeOf [1] [] ?= ([] :: Array Int)
    it "is the same as Prelude.asTypeOf" do
      quickCheck \ (x :: Array Int) -> asTypeOf x [] === Prelude.asTypeOf [] x
  describe "bind" do
    it "is chain flipped" do
      bind [3, 5] (\ x -> [x, x * 2]) ?= [3, 6, 5, 10]
    it "is the same as Prelude.bind" do
      let f x = [x, x * 2]
      quickCheck \ x -> bind x f === Prelude.bind x f
  describe "clamp" do
    it "clamps the value between the bounds" do
      clamp 3 5 2 ?= 3
      clamp 3 5 4 ?= 4
      clamp 3 5 6 ?= 5
      clamp 5 3 4 ?= 4
    it "is the same as Data.Ord.clamp" do
      quickCheck \ (x :: Int) l h ->
        if less h l
        then clamp l h x === Ord.clamp l h x
        else clamp l h x === Ord.clamp h l x
  describe "contains" do
    it "returns true when the container contains the element" do
      contains 1 [0, 1, 2] ?= true
      contains 1 [0, 2] ?= false
      contains 1 [] ?= false
    it "is the same as Data.Foldable.elem" do
      quickCheck \ (xs :: Array Int) x -> contains x xs === Foldable.elem x xs
  describe "curry" do
    let f (Tuple x y) = "(" + x + ", " + y + ")"
    it "converts a tuple function into a normal function" do
      curry f "a" "b" ?= "(a, b)"
    it "is the same as Data.Tuple.curry" do
      quickCheck \ x y -> curry f x y === Tuple.curry f x y
  describe "decrement" do
    it "decrements the argument" do
      decrement 'b' ?= Just 'a'
      decrement '\0' ?= Nothing
    it "is the same as Data.Enum.pred" do
      quickCheck \ (x :: Char) -> decrement x === Enum.pred x
  describe "divisibleBy" do
    it "returns true if the number is divisible by the other" do
      divisibleBy 3 6 ?= true
      divisibleBy 4 6 ?= false
      divisibleBy 6 3 ?= false
    it "returns true if the remainder is zero" do
      quickCheck \ x y -> divisibleBy y x === x % y == 0
  describe "downTo" do
    it "returns an array of values from low to high" do
      downTo 1 3 ?= [3, 2, 1]
      downTo 3 1 ?= []
      downTo 1 1 ?= [1]
    pending "is the same as Data.Enum.enumFromTo"
  describe "empty" do
    it "returns true when the container is empty" do
      empty [] ?= true
      empty [1] ?= false
    it "is the same as Data.Array.null" do
      quickCheck \ (xs :: Array Int) -> empty xs === Array.null xs
  describe "even" do
    it "returns true when the int is even" do
      even 2 ?= true
      even 3 ?= false
    it "is the same as Data.Int.even" do
      quickCheck \ x -> even x === Int.even x
  describe "flatten" do
    it "removes a level of nesting" do
      flatten [[1, 2], [3, 4]] ?= [1, 2, 3, 4]
    it "is the same as Control.Bind.join" do
      quickCheck \ (xs :: Array (Array Int)) -> flatten xs === Bind.join xs
  describe "greaterOrEqual" do
    it "is greater or equal" do
      greaterOrEqual 1 0 ?= false
      greaterOrEqual 1 1 ?= true
      greaterOrEqual 1 2 ?= true
    it "is the same as Prelude.>=" do
      quickCheck \ (x :: Int) y -> greaterOrEqual y x === x Prelude.>= y
  describe "increment" do
    it "increments the argument" do
      increment 'a' ?= Just 'b'
      increment '\65535' ?= Nothing
    it "is the same as Data.Enum.succ" do
      quickCheck \ (x :: Char) -> increment x === Enum.succ x
  describe "infinite" do
    it "returns true when the number is infinite" do
      infinite infinity ?= true
      infinite (-infinity) ?= true
      infinite nan ?= true
      infinite 0.0 ?= false
    it "is the opposite of Global.isFinite" do
      quickCheck \ x -> infinite x === Prelude.not (Global.isFinite x)
  describe "lessOrEqual" do
    it "is less or equal" do
      lessOrEqual 1 0 ?= true
      lessOrEqual 1 1 ?= true
      lessOrEqual 1 2 ?= false
    it "is the same as Prelude.<=" do
      quickCheck \ (x :: Int) y -> lessOrEqual y x === x Prelude.<= y
  describe "max" do
    it "returns the max" do
      max 1 2 ?= 2
    it "is the same as Data.Ord.max" do
      quickCheck \ (x :: Int) y -> max y x === Ord.max x y
  describe "maximum" do
    it "returns the greatest element in the container" do
      maximum ([] :: Array Int) ?= Nothing
      maximum [1] ?= Just 1
      maximum [1, 2] ?= Just 2
      maximum [2, 1] ?= Just 2
    it "is the same as Data.Foldable.maximum" do
      quickCheck \ (xs :: Array Int) -> maximum xs === Foldable.maximum xs
  describe "min" do
    it "returns the min" do
      min 1 2 ?= 1
    it "is the same as Data.Ord.min" do
      quickCheck \ (x :: Int) y -> min y x === Ord.min x y
  describe "minimum" do
    it "returns the least element in the container" do
      minimum ([] :: Array Int) ?= Nothing
      minimum [1] ?= Just 1
      minimum [1, 2] ?= Just 1
      minimum [2, 1] ?= Just 1
    it "is the same as Data.Foldable.minimum" do
      quickCheck \ (xs :: Array Int) -> minimum xs === Foldable.minimum xs
  describe "negate" do
    it "subtracts from zero" do
      negate 1 ?= -1
    it "is the same as Prelude.negate" do
      quickCheck \ (x :: Int) -> negate x === Prelude.negate x
  describe "notEqual" do
    it "is not equal" do
      notEqual 1 1 ?= false
      notEqual 1 0 ?= true
    it "is the same as Prelude./=" do
      quickCheck \ (x :: Int) y -> notEqual y x === x Prelude./= y
  describe "odd" do
    it "returns true when the int is even" do
      odd 2 ?= false
      odd 3 ?= true
    it "is the same as Data.Int.odd" do
      quickCheck \ x -> odd x === Int.odd x
  describe "print" do
    pending "shows the value and logs it"
  describe "product" do
    it "multiplies the elements in the container together" do
      product [] ?= 1
      product [2] ?= 2
      product [2, 3] ?= 6
    it "is the same as Data.Foldable.product" do
      quickCheck \ (xs :: Array Int) -> product xs === Foldable.product xs
  describe "reciprocal" do
    it "returns the reciprocal of the number" do
      reciprocal 2.0 ?= 0.5
    it "is the same as one divided by the number" do
      quickCheck \ (x :: Int) -> reciprocal x === 1 / x
  describe "sequence" do
    it "sequences the actions" do
      sequence [Just 1, Just 2] ?= Just [1, 2]
    it "is the same as Data.Traversable.sequence" do
      quickCheck \ (xs :: Array (Maybe Int)) -> sequence xs === Traversable.sequence xs
  describe "sign" do
    it "returns the sign of the number" do
      sign 2 ?= 1
      sign 0 ?= 0
      sign (-2) ?= -1
  describe "size" do
    it "returns the size of the container" do
      size [] ?= 0
      size [2] ?= 1
      size [2, 3, 4] ?= 3
    it "is the same as Data.Array.length" do
      quickCheck \ (xs :: Array Int) -> size xs === Array.length xs
  describe "sum" do
    it "adds the elements in the container together" do
      sum [] ?= ""
      sum ["a"] ?= "a"
      sum ["a", "b"] ?= "ab"
    it "is the same as Data.Foldable.sum" do
      quickCheck \ (xs :: Array Int) -> sum xs === Foldable.sum xs
  describe "swap" do
    it "swaps the parts of a tuple" do
      swap (Tuple 1 2.0) ?= Tuple 2.0 1
    it "is the same as Data.Tuple.swap" do
      quickCheck \ (x :: Tuple Unit Boolean) -> swap x === Tuple.swap x
  describe "todo" do
    it "is unit" do
      todo ?= unit
    it "can be any type" do
      equal unit todo ?= true
      equal 1 todo ?= false
      equal 1.0 todo ?= false
  describe "uncurry" do
    let f x y = "(" + x + ", " + y + ")"
    it "converts a normal function into a tuple function" do
      uncurry f (Tuple "a" "b") ?= "(a, b)"
    it "is the same as Data.Tuple.uncurry" do
      quickCheck \ x y -> uncurry f (Tuple x y) === Tuple.uncurry f (Tuple x y)
  describe "unsafeCoerce" do
    it "convinces the type system" do
      unsafeCoerce 1 ?= 1.0
  describe "unsafeLog" do
    pending "unsafely logs the value"
  describe "upTo" do
    it "returns an array of values from low to high" do
      upTo 3 1 ?= [1, 2, 3]
      upTo 1 3 ?= []
      upTo 1 1 ?= [1]
    pending "is the same as Data.Enum.enumFromTo"
  describe "void" do
    it "replaces values with unit" do
      void [1, 2] ?= [unit, unit]
    it "is the same as Prelude.void" do
      quickCheck \ (xs :: Array Int) -> void xs === Prelude.void xs
  describe "when" do
    it "executes the action if the predicate is true" do
      when true [unit, unit] ?= [unit, unit]
    it "returns unit if the predicate is false" do
      when false [unit, unit] ?= [unit]
    it "is the same as Control.Monad.when" do
      quickCheck \ x (ys :: Array Unit) -> when x ys === Monad.when x ys
  describe "while" do
    it "iterates while the predicate is true" do
      while (< 3) (+ 1) 1 ?= 3
  describe "withDefault" do
    it "uses the default value" do
      withDefault 1 Nothing ?= 1
      withDefault 1 (Just 2) ?= 2
    it "is the same as Data.Maybe.fromMaybe" do
      quickCheck \ (x :: Int) y -> withDefault x y === Maybe.fromMaybe x y
