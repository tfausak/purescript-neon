module Test.Neon.HelperSpec where

import Neon
import Neon.Data -- HACK
import Test.Spec

spec :: Spec
spec = describe "Neon.Helper" do
  describe "absoluteValue" do
    it "returns the absolute value" do
      absoluteValue 1 ?= 1
      absoluteValue (-1.0) ?= 1.0
  describe "all" do
    it "checks if all elements pass the predicate" do
      all identity [] ?= true
      all identity [true, false] ?= false
      all (> 1) [2, 3] ?= true
  describe "any" do
    it "checks if any elements pass the predicate" do
      any identity [] ?= false
      any identity [true, false] ?= true
      any (> 1) [1, 2] ?= true
  describe "asTypeOf" do
    it "hints at the right type" do
      asTypeOf [] [1] ?= []
  describe "clamp" do
    it "clamps the value between the bounds" do
      clamp 3 5 2 ?= 3
      clamp 3 5 4 ?= 4
      clamp 3 5 6 ?= 5
  describe "contains" do
    it "returns true if the collection contains the element" do
      contains 1 [0, 1, 2] ?= true
    it "returns false if the collection does not contain the element" do
      contains 3 [0, 1, 2] ?= false
  describe "curry" do
    it "curries the function" do
      curry (\ (Pair x) -> x.first + x.second) "ab" "cd" ?= "abcd"
  describe "decrement" do
    it "decrements the value" do
      decrement true ?= Just false
  describe "for" do
    it "is map flipped" do
      for [1, 2] (+ 1) ?= [2, 3]
  describe "greaterOrEqual" do
    it "is greater or equal" do
      greaterOrEqual 2 1 ?= true
      greaterOrEqual 1 1 ?= true
  describe "increment" do
    it "increments the value" do
      increment false ?= Just true
  describe "isEmpty" do
    it "returns true if the collection is empty" do
      isEmpty ([] :: Array Int) ?= true
    it "returns false if the collection is not empty" do
      isEmpty [1] ?= false
  describe "isInfinite" do
    it "returns true for infinity and nan" do
      isInfinite infinity ?= true
      isInfinite (-infinity) ?= true
      isInfinite nan ?= true
    it "returns false for anything else" do
      isInfinite 0.0 ?= false
  describe "isJust" do
    it "returns true if just" do
      isJust (Just 1) ?= true
    it "returns false if nothing" do
      isJust (Nothing :: Maybe Int) ?= false
  describe "isNothing" do
    it "returns false if just" do
      isNothing (Just 1) ?= false
    it "returns true if nothing" do
      isNothing (Nothing :: Maybe Int) ?= true
  describe "join" do
    it "joins things" do
      join [[1, 2], [3, 4]] ?= [1, 2, 3, 4]
  describe "lessOrEqual" do
    it "is less or equal" do
      lessOrEqual 1 2 ?= true
      lessOrEqual 1 1 ?= true
  describe "max" do
    it "returns the max" do
      max 1 2 ?= 2
  describe "maximum" do
    it "returns nothing for an empty colleciton" do
      maximum ([] :: Array Int) ?= Nothing
    it "returns the maximum value" do
      maximum [1, 2, 0] ?= Just 2
  describe "min" do
    it "returns the min" do
      min 1 2 ?= 1
  describe "minimum" do
    it "returns nothing for an empty colleciton" do
      minimum ([] :: Array Int) ?= Nothing
    it "returns the minimum value" do
      minimum [1, 2, 0] ?= Just 0
  describe "negate" do
    it "is the number subtracted from zero" do
      negate 1 ?= -1
      negate 1.0 ?= -1.0
  describe "notEqual" do
    it "is not equal" do
      notEqual false true ?= true
  describe "print" do
    pending
  describe "product" do
    it "is the array multiplied together" do
      product [2, 3] ?= 6
  describe "range" do
    it "returns a range of values" do
      range 1 3 ?= [1, 2, 3]
  describe "reciprocal" do
    it "is one divided by the number" do
      reciprocal 2.0 ?= 0.5
  describe "sequence" do
    it "sequences the actions" do
      sequence [Just 1, Just 2] ?= Just [1, 2]
  describe "sign" do
    it "returns the sign" do
      sign (-2) ?= -1
      sign 0.0 ?= 0.0
      sign 2 ?= 1
  describe "size" do
    it "returns the size of the collection" do
      size ([] :: Array Int) ?= 0
      size [1] ?= 1
      size [1, 1, 1] ?= 3
  describe "sum" do
    it "is the array summed up" do
      sum [2, 3] ?= 5
  describe "swap" do
    it "swaps the elements" do
      swap (pair 1 2.0) ?= pair 2.0 1
  describe "uncurry" do
    it "uncurries the function" do
      uncurry add (pair "ab" "cd") ?= "abcd"
  describe "unless" do
    it "executes the action if the predicate is false" do
      unless false [unit, unit] ?= [unit, unit]
    it "returns unit if the predicate is true" do
      unless true [unit, unit] ?= [unit]
  describe "unsafeFromJust" do
    it "returns the value if just" do
      unsafeFromJust (Just 1) ?= 1
    it "throws an exception if nothing" do
      pending
  describe "unsafeLog" do
    pending
  describe "until" do
    it "iterates until the predicate is true" do
      until (> 3) (+ 1) 1 ?= 4
  describe "void" do
    it "discards the result" do
      void [1, 2] ?= [unit, unit]
  describe "when" do
    it "executes the action if the predicate is true" do
      when true [unit, unit] ?= [unit, unit]
    it "returns unit if the predicate is false" do
      when false [unit, unit] ?= [unit]
  describe "while" do
    it "iterates while the predicate is true" do
      while (< 3) (+ 1) 1 ?= 3
  describe "withDefault" do
    it "returns the default if nothing" do
      withDefault 1 Nothing ?= 1
    it "returns the value if just" do
      withDefault 1 (Just 2) ?= 2
