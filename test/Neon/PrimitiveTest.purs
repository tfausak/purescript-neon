module Test.Neon.PrimitiveTest where

import Test.Core (Tests, test)
import Test.Neon.Primitive.FunctionTest as FunctionTest

tests :: Tests
tests = test "Primitive" do
  FunctionTest.tests
