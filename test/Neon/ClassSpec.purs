module Test.Neon.ClassSpec where

import Neon (..)
import Test.Spec (..)
import Test.Neon.Class.AddSpec (spec) as Add
import Test.Neon.Class.AlwaysSpec (spec) as Always
import Test.Neon.Class.AndSpec (spec) as And
import Test.Neon.Class.ApplySpec (spec) as Apply
import Test.Neon.Class.BindSpec (spec) as Bind
import Test.Neon.Class.BottomSpec (spec) as Bottom
import Test.Neon.Class.ComposeSpec (spec) as Compose
import Test.Neon.Class.DivideSpec (spec) as Divide
import Test.Neon.Class.EqualSpec (spec) as Equal
import Test.Neon.Class.FlipSpec (spec) as Flip
import Test.Neon.Class.FromArraySpec (spec) as FromArray
import Test.Neon.Class.FromIntSpec (spec) as FromInt
import Test.Neon.Class.GreaterSpec (spec) as Greater
import Test.Neon.Class.IdentitySpec (spec) as Identity
import Test.Neon.Class.LessSpec (spec) as Less
import Test.Neon.Class.MapSpec (spec) as Map
import Test.Neon.Class.MultiplySpec (spec) as Multiply
import Test.Neon.Class.NotSpec (spec) as Not
import Test.Neon.Class.OneSpec (spec) as One
import Test.Neon.Class.OrSpec (spec) as Or
import Test.Neon.Class.PowerSpec (spec) as Power
import Test.Neon.Class.PureSpec (spec) as Pure
import Test.Neon.Class.ReduceSpec (spec) as Reduce
import Test.Neon.Class.RemainderSpec (spec) as Remainder
import Test.Neon.Class.RootSpec (spec) as Root
import Test.Neon.Class.ShowSpec (spec) as Show
import Test.Neon.Class.SubtractSpec (spec) as Subtract
import Test.Neon.Class.ToArraySpec (spec) as ToArray
import Test.Neon.Class.ToIntSpec (spec) as ToInt
import Test.Neon.Class.TopSpec (spec) as Top
import Test.Neon.Class.TraverseSpec (spec) as Traverse
import Test.Neon.Class.ZeroSpec (spec) as Zero

spec :: Spec
spec = describe "Neon.Class" do
  Add.spec
  Always.spec
  And.spec
  Apply.spec
  Bind.spec
  Bottom.spec
  Compose.spec
  Divide.spec
  Equal.spec
  Flip.spec
  FromArray.spec
  FromInt.spec
  Greater.spec
  Identity.spec
  Less.spec
  Map.spec
  Multiply.spec
  Not.spec
  One.spec
  Or.spec
  Power.spec
  Pure.spec
  Reduce.spec
  Remainder.spec
  Root.spec
  Show.spec
  Subtract.spec
  ToArray.spec
  ToInt.spec
  Top.spec
  Traverse.spec
  Zero.spec
