module Test.Main where

import Test.Helper (Main, runTest)
import Test.NeonTest as NeonTest

main :: Main
main = runTest do
  NeonTest.tests
