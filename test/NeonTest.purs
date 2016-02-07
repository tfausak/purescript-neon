module Test.NeonTest where

import Test.Core (Tests, bind, test)
import Test.Neon.ClassTest as ClassTest
import Test.Neon.DataTest as DataTest
import Test.Neon.EffectTest as EffectTest
import Test.Neon.OperatorTest as OperatorTest
import Test.Neon.PrimitiveTest as PrimitiveTest

tests :: Tests
tests = test "Neon" do
  ClassTest.tests
  DataTest.tests
  EffectTest.tests
  OperatorTest.tests
  PrimitiveTest.tests
