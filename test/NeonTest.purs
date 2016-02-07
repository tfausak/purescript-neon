module Test.NeonTest where

import Test.Core (Tests, bind, test)
import Test.Neon.ClassTest as ClassTest
import Test.Neon.PrimitiveTest as PrimitiveTest

tests :: Tests
tests = test "Neon" do
  ClassTest.tests
  PrimitiveTest.tests
