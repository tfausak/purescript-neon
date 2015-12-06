module Test.Neon.ClassSpec where

import Neon
import Test.Spec
import qualified Test.Neon.Class.AddSpec as Add
import qualified Test.Neon.Class.AndSpec as And
import qualified Test.Neon.Class.BindSpec as Bind
import qualified Test.Neon.Class.ComposeSpec as Compose
import qualified Test.Neon.Class.DivideSpec as Divide
import qualified Test.Neon.Class.EqualSpec as Equal
import qualified Test.Neon.Class.FlipSpec as Flip
import qualified Test.Neon.Class.GreaterSpec as Greater
import qualified Test.Neon.Class.LessSpec as Less
import qualified Test.Neon.Class.ModuloSpec as Modulo
import qualified Test.Neon.Class.MultiplySpec as Multiply
import qualified Test.Neon.Class.NotSpec as Not
import qualified Test.Neon.Class.OneSpec as One
import qualified Test.Neon.Class.OrSpec as Or
import qualified Test.Neon.Class.PowerSpec as Power
import qualified Test.Neon.Class.PureSpec as Pure
import qualified Test.Neon.Class.ShowSpec as Show
import qualified Test.Neon.Class.SubtractSpec as Subtract
import qualified Test.Neon.Class.ZeroSpec as Zero

main :: Spec
main = describe "Neon.Class" do
  Add.main
  And.main
  Bind.main
  Compose.main
  Divide.main
  Equal.main
  Flip.main
  Greater.main
  Less.main
  Modulo.main
  Multiply.main
  Not.main
  One.main
  Or.main
  Power.main
  Pure.main
  Show.main
  Subtract.main
  Zero.main
