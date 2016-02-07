module Test.Neon.ClassTest where

import Test.Neon.Class.AddTest as AddTest
import Test.Neon.Class.AndTest as AndTest
import Test.Neon.Class.BottomTest as BottomTest
import Test.Neon.Class.DivideTest as DivideTest
import Test.Neon.Class.EqualTest as EqualTest
import Test.Neon.Class.FromIntTest as FromIntTest
import Test.Neon.Class.GreaterTest as GreaterTest
import Test.Neon.Class.InspectTest as InspectTest
import Test.Neon.Class.LessTest as LessTest
import Test.Neon.Class.MultiplyTest as MultiplyTest
import Test.Neon.Class.NotTest as NotTest
import Test.Neon.Class.OneTest as OneTest
import Test.Neon.Class.OrTest as OrTest
import Test.Neon.Class.PowerTest as PowerTest
import Test.Neon.Class.RemainderTest as RemainderTest
import Test.Neon.Class.SubtractTest as SubtractTest
import Test.Neon.Class.ToIntTest as ToIntTest
import Test.Neon.Class.TopTest as TopTest
import Test.Helper (Suite, bind, test)

suite :: Suite
suite = test "Class" do
  AddTest.suite
  AndTest.suite
  BottomTest.suite
  DivideTest.suite
  EqualTest.suite
  FromIntTest.suite
  GreaterTest.suite
  InspectTest.suite
  LessTest.suite
  MultiplyTest.suite
  NotTest.suite
  OneTest.suite
  OrTest.suite
  PowerTest.suite
  RemainderTest.suite
  SubtractTest.suite
  ToIntTest.suite
  TopTest.suite
