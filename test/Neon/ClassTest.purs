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
import Test.Neon.Class.HasOneTest as HasOneTest
import Test.Neon.Class.HasOrTest as HasOrTest
import Test.Neon.Class.HasPowerTest as HasPowerTest
import Test.Neon.Class.HasReduceTest as HasReduceTest
import Test.Neon.Class.HasRemainderTest as HasRemainderTest
import Test.Neon.Class.HasSubtractTest as HasSubtractTest
import Test.Neon.Class.HasToArrayTest as HasToArrayTest
import Test.Neon.Class.HasToIntTest as HasToIntTest
import Test.Neon.Class.HasTopTest as HasTopTest
import Test.Neon.Class.TraverseTest as TraverseTest
import Test.Neon.Class.HasPureTest as HasPureTest
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
  HasOneTest.suite
  HasOrTest.suite
  HasPowerTest.suite
  HasReduceTest.suite
  HasRemainderTest.suite
  HasSubtractTest.suite
  HasToArrayTest.suite
  HasToIntTest.suite
  HasTopTest.suite
  TraverseTest.suite
  HasPureTest.suite
  ZeroTest.suite
