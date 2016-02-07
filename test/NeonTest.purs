module Test.NeonTest where

import Test.Neon.ClassTest as ClassTest
import Test.Neon.DataTest as DataTest
import Test.Neon.EffectTest as EffectTest
import Test.Neon.HelperTest as HelperTest
import Test.Neon.OperatorTest as OperatorTest
import Test.Neon.PrimitiveTest as PrimitiveTest
import Test.Helper (Suite, bind, test)

suite :: Suite
suite = test "Neon" do
  ClassTest.suite
  DataTest.suite
  EffectTest.suite
  HelperTest.suite
  OperatorTest.suite
  PrimitiveTest.suite
