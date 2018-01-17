module Test.Neon.PrimitiveTest where

import Test.Neon.Primitive.CharTest as CharTest
import Test.Neon.Primitive.FunctionTest as FunctionTest
import Test.Neon.Primitive.IntTest as IntTest
import Test.Neon.Primitive.NumberTest as NumberTest
import Test.Helper (Suite, discard, suite)

tests :: Suite
tests = suite "Primitive" do
  CharTest.tests
  FunctionTest.tests
  IntTest.tests
  NumberTest.tests
