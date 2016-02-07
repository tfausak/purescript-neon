module Test.Neon.PrimitiveTest where

import Test.Neon.Primitive.CharTest as CharTest
import Test.Neon.Primitive.FunctionTest as FunctionTest
import Test.Neon.Primitive.IntTest as IntTest
import Test.Neon.Primitive.NumberTest as NumberTest
import Test.Helper (Suite, bind, test)

suite :: Suite
suite = test "Primitive" do
  CharTest.suite
  FunctionTest.suite
  IntTest.suite
  NumberTest.suite
