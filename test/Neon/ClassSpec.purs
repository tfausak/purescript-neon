module Test.Neon.ClassSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Class.AddSpec as Add
import qualified Test.Neon.Class.AlwaysSpec as Always
import qualified Test.Neon.Class.AndSpec as And
import qualified Test.Neon.Class.ApplySpec as Apply
import qualified Test.Neon.Class.BindSpec as Bind
import qualified Test.Neon.Class.BottomSpec as Bottom
import qualified Test.Neon.Class.ComposeSpec as Compose
import qualified Test.Neon.Class.DivideSpec as Divide
import qualified Test.Neon.Class.EqualSpec as Equal
import qualified Test.Neon.Class.FlipSpec as Flip
import qualified Test.Neon.Class.FlipSpec as FromInt
import qualified Test.Neon.Class.FromArraySpec as FromArray
import qualified Test.Neon.Class.GreaterSpec as Greater
import qualified Test.Neon.Class.GreaterSpec as Identity
import qualified Test.Neon.Class.LessSpec as Less
import qualified Test.Neon.Class.MapSpec as Map
import qualified Test.Neon.Class.MultiplySpec as Multiply
import qualified Test.Neon.Class.NotSpec as Not
import qualified Test.Neon.Class.OneSpec as One
import qualified Test.Neon.Class.OrSpec as Or
import qualified Test.Neon.Class.PowerSpec as Power
import qualified Test.Neon.Class.PureSpec as Pure
import qualified Test.Neon.Class.ReduceSpec as Reduce
import qualified Test.Neon.Class.RemainderSpec as Remainder
import qualified Test.Neon.Class.RootSpec as Root
import qualified Test.Neon.Class.ShowSpec as Show
import qualified Test.Neon.Class.SubtractSpec as Subtract
import qualified Test.Neon.Class.ToArraySpec as ToArray
import qualified Test.Neon.Class.ToIntSpec as ToInt
import qualified Test.Neon.Class.TopSpec as Top
import qualified Test.Neon.Class.TraverseSpec as Traverse
import qualified Test.Neon.Class.ZeroSpec as Zero

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
