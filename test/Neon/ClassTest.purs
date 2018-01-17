module Test.Neon.ClassTest where

import Test.Neon.Class.HasAddTest as HasAddTest
import Test.Neon.Class.HasAndTest as HasAndTest
import Test.Neon.Class.HasApplyTest as HasApplyTest
import Test.Neon.Class.HasBottomTest as HasBottomTest
import Test.Neon.Class.HasChainTest as HasChainTest
import Test.Neon.Class.HasCompareTest as HasCompareTest
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
import Test.Neon.Class.HasPureTest as HasPureTest
import Test.Neon.Class.HasReduceTest as HasReduceTest
import Test.Neon.Class.HasRemainderTest as HasRemainderTest
import Test.Neon.Class.HasSubtractTest as HasSubtractTest
import Test.Neon.Class.HasToArrayTest as HasToArrayTest
import Test.Neon.Class.HasToIntTest as HasToIntTest
import Test.Neon.Class.HasTopTest as HasTopTest
import Test.Neon.Class.HasTraverseTest as HasTraverseTest
import Test.Neon.Class.HasZeroTest as HasZeroTest
import Test.Helper (Suite, discard, suite)


tests :: Suite
tests = suite "Class" do
  HasAddTest.tests
  HasAndTest.tests
  HasApplyTest.tests
  HasBottomTest.tests
  HasChainTest.tests
  HasCompareTest.tests
  HasDivideTest.tests
  HasEqualTest.tests
  HasFilterTest.tests
  HasFromArrayTest.tests
  HasFromIntTest.tests
  HasGreaterTest.tests
  HasInspectTest.tests
  HasLessTest.tests
  HasMapTest.tests
  HasMultiplyTest.tests
  HasNotTest.tests
  HasOneTest.tests
  HasOrTest.tests
  HasPowerTest.tests
  HasReduceTest.tests
  HasRemainderTest.tests
  HasSubtractTest.tests
  HasToArrayTest.tests
  HasToIntTest.tests
  HasTopTest.tests
  HasTraverseTest.tests
  HasPureTest.tests
  HasZeroTest.tests
