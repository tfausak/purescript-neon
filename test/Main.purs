module Test.Main where

import Test.Core (Main, runTest)
import Test.NeonTest as NeonTest

main :: Main
main = runTest do
  NeonTest.tests
