module Test.NeonSpec where

import Neon
import Test.Spec
import qualified Test.Neon.ClassSpec as Class
import qualified Test.Neon.DataSpec as Data
import qualified Test.Neon.EffectSpec as Effect
import qualified Test.Neon.OperatorSpec as Operator
import qualified Test.Neon.PrimitiveSpec as Primitive

main :: Spec
main = describe "Neon" do
  Class.main
  Data.main
  Effect.main
  Operator.main
  Primitive.main
