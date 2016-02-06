module Test.NeonSpec where

import Test.Helper
import Test.Neon.ClassSpec as Class
import Test.Neon.DataSpec as Data
import Test.Neon.EffectSpec as Effect
import Test.Neon.HelperSpec as Helper
import Test.Neon.OperatorSpec as Operator
import Test.Neon.PrimitiveSpec as Primitive
import Test.Neon.SyntaxSpec as Syntax

spec :: Spec
spec = describe "Neon" do
  Class.spec
  Data.spec
  Effect.spec
  Helper.spec
  Operator.spec
  Primitive.spec
  Syntax.spec
