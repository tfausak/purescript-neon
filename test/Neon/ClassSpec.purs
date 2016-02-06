module Test.Neon.ClassSpec where

import Test.Helper
import Test.Neon.Class.AddSpec as Add
import Test.Neon.Class.AndSpec as And
import Test.Neon.Class.ApplySpec as Apply
import Test.Neon.Class.BottomSpec as Bottom
import Test.Neon.Class.ChainSpec as Chain
import Test.Neon.Class.DivideSpec as Divide
import Test.Neon.Class.EqualSpec as Equal
import Test.Neon.Class.FilterSpec as Filter
import Test.Neon.Class.GreaterSpec as Greater
import Test.Neon.Class.LessSpec as Less
import Test.Neon.Class.MapSpec as Map
import Test.Neon.Class.MultiplySpec as Multiply
import Test.Neon.Class.NotSpec as Not
import Test.Neon.Class.OneSpec as One
import Test.Neon.Class.OrSpec as Or
import Test.Neon.Class.PowerSpec as Power
import Test.Neon.Class.ReduceSpec as Reduce
import Test.Neon.Class.RemainderSpec as Remainder
import Test.Neon.Class.ShowSpec as Show
import Test.Neon.Class.SubtractSpec as Subtract
import Test.Neon.Class.TopSpec as Top
import Test.Neon.Class.WrapSpec as Wrap
import Test.Neon.Class.ZeroSpec as Zero

spec :: Spec
spec = describe "Class" do
  Add.spec
  And.spec
  Apply.spec
  Bottom.spec
  Chain.spec
  Divide.spec
  Equal.spec
  Filter.spec
  Greater.spec
  Less.spec
  Map.spec
  Multiply.spec
  Not.spec
  One.spec
  Or.spec
  Power.spec
  Reduce.spec
  Remainder.spec
  Show.spec
  Subtract.spec
  Top.spec
  Wrap.spec
  Zero.spec
