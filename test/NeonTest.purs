module Test.NeonTest where

import Test.Neon.ClassTest as ClassTest
import Test.Neon.DataTest as DataTest
import Test.Neon.EffectTest as EffectTest
import Test.Neon.HelperTest as HelperTest
import Test.Neon.OperatorTest as OperatorTest
import Test.Neon.PrimitiveTest as PrimitiveTest
import Test.Helper (Suite, discard, suite)

tests :: Suite
tests = suite "Neon" do
  ClassTest.tests
  DataTest.tests
  EffectTest.tests
  HelperTest.tests
  OperatorTest.tests
  PrimitiveTest.tests
