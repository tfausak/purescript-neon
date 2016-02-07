module Test.Neon.PrimitiveTest where

import Test.Core (Tests, bind, test)
import Test.Neon.Primitive.CharTest as CharTest
import Test.Neon.Primitive.FunctionTest as FunctionTest
import Test.Neon.Primitive.IntTest as IntTest
import Test.Neon.Primitive.NumberTest as NumberTest

tests :: Tests
tests = test "Primitive" do
  CharTest.tests
  FunctionTest.tests
  IntTest.tests
  NumberTest.tests
