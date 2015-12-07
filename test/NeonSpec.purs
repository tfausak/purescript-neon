module Test.NeonSpec where

import Neon
import Test.Spec
import qualified Test.Neon.ClassSpec as Class
import qualified Test.Neon.DataSpec as Data
import qualified Test.Neon.EffectSpec as Effect
import qualified Test.Neon.HelperSpec as Helper
import qualified Test.Neon.OperatorSpec as Operator
import qualified Test.Neon.PrimitiveSpec as Primitive

spec :: Spec
spec = describe "Neon" do
  Class.spec
  Data.spec
  Effect.spec
  Helper.spec
  Operator.spec
  Primitive.spec
