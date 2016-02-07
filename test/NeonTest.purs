module Test.NeonTest where

import Test.Core (Tests, test)
import Test.Neon.PrimitiveTest as PrimitiveTest

tests :: Tests
tests = test "Neon" do
  PrimitiveTest.tests
