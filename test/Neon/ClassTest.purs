module Test.Neon.ClassTest where

import Test.Neon.Class.AddTest as AddTest
import Test.Neon.Class.AndTest as AndTest
import Test.Neon.Class.ApplyTest as ApplyTest
import Test.Neon.Class.BottomTest as BottomTest
import Test.Neon.Class.ChainTest as ChainTest
import Test.Neon.Class.DivideTest as DivideTest
import Test.Neon.Class.EqualTest as EqualTest
import Test.Neon.Class.FilterTest as FilterTest
import Test.Neon.Class.FromArrayTest as FromArrayTest
import Test.Neon.Class.FromIntTest as FromIntTest
import Test.Neon.Class.GreaterTest as GreaterTest
import Test.Neon.Class.InspectTest as InspectTest
import Test.Neon.Class.LessTest as LessTest
import Test.Neon.Class.MapTest as MapTest
import Test.Neon.Class.MultiplyTest as MultiplyTest
import Test.Neon.Class.NotTest as NotTest
import Test.Neon.Class.OneTest as OneTest
import Test.Neon.Class.OrTest as OrTest
import Test.Neon.Class.PowerTest as PowerTest
import Test.Neon.Class.ReduceTest as ReduceTest
import Test.Neon.Class.RemainderTest as RemainderTest
import Test.Neon.Class.SubtractTest as SubtractTest
import Test.Neon.Class.ToArrayTest as ToArrayTest
import Test.Neon.Class.ToIntTest as ToIntTest
import Test.Neon.Class.TopTest as TopTest
import Test.Neon.Class.TraverseTest as TraverseTest
import Test.Neon.Class.WrapTest as WrapTest
import Test.Neon.Class.ZeroTest as ZeroTest
import Test.Helper (Suite, bind, test)

suite :: Suite
suite = test "Class" do
  AddTest.suite
  AndTest.suite
  ApplyTest.suite
  BottomTest.suite
  ChainTest.suite
  DivideTest.suite
  EqualTest.suite
  FilterTest.suite
  FromArrayTest.suite
  FromIntTest.suite
  GreaterTest.suite
  InspectTest.suite
  LessTest.suite
  MapTest.suite
  MultiplyTest.suite
  NotTest.suite
  OneTest.suite
  OrTest.suite
  PowerTest.suite
  ReduceTest.suite
  RemainderTest.suite
  SubtractTest.suite
  ToArrayTest.suite
  ToIntTest.suite
  TopTest.suite
  TraverseTest.suite
  WrapTest.suite
  ZeroTest.suite
