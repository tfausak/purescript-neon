module Test.Neon.ClassTest where

import Test.Core (Tests, bind, test)
import Test.Neon.Class.AddTest as AddTest
import Test.Neon.Class.MultiplyTest as MultiplyTest

tests :: Tests
tests = test "Class" do
  AddTest.tests
  MultiplyTest.tests
