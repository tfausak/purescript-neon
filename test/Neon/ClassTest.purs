module Test.Neon.ClassTest where

import Test.Neon.Class.HasAddTest as HasAddTest
import Test.Neon.Class.HasAndTest as HasAndTest
import Test.Neon.Class.HasApplyTest as HasApplyTest
import Test.Neon.Class.HasBottomTest as HasBottomTest
import Test.Neon.Class.HasChainTest as HasChainTest
import Test.Neon.Class.HasDivideTest as HasDivideTest
import Test.Neon.Class.HasEqualTest as HasEqualTest
import Test.Neon.Class.HasFilterTest as HasFilterTest
import Test.Neon.Class.HasFromArrayTest as HasFromArrayTest
import Test.Neon.Class.HasFromIntTest as HasFromIntTest
import Test.Neon.Class.HasGreaterTest as HasGreaterTest
import Test.Neon.Class.HasInspectTest as HasInspectTest
import Test.Neon.Class.HasLessTest as HasLessTest
import Test.Neon.Class.HasMapTest as HasMapTest
import Test.Neon.Class.HasMultiplyTest as HasMultiplyTest
import Test.Neon.Class.HasNotTest as HasNotTest
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
import Test.Neon.Class.PureTest as PureTest
import Test.Neon.Class.ZeroTest as ZeroTest
import Test.Helper (Suite, bind, test)

suite :: Suite
suite = test "Class" do
  HasAddTest.suite
  HasAndTest.suite
  HasApplyTest.suite
  HasBottomTest.suite
  HasChainTest.suite
  HasDivideTest.suite
  HasEqualTest.suite
  HasFilterTest.suite
  HasFromArrayTest.suite
  HasFromIntTest.suite
  HasGreaterTest.suite
  HasInspectTest.suite
  HasLessTest.suite
  HasMapTest.suite
  HasMultiplyTest.suite
  HasNotTest.suite
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
  PureTest.suite
  ZeroTest.suite
