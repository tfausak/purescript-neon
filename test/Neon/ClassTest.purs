module Test.Neon.ClassTest where

import Test.Core (Tests, test)
import Test.Neon.Class.AddTest as AddTest

tests :: Tests
tests = test "Class" do
  AddTest.tests
