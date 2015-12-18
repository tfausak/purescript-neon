module Test.NeonSpec where

import Neon (..)
import Test.Spec (..)
import Test.Neon.ClassSpec (spec) as Class
import Test.Neon.DataSpec (spec) as Data
import Test.Neon.EffectSpec (spec) as Effect
import Test.Neon.HelperSpec (spec) as Helper
import Test.Neon.OperatorSpec (spec) as Operator
import Test.Neon.PrimitiveSpec (spec) as Primitive

spec :: Spec
spec = describe "Neon" do
  Class.spec
  Data.spec
  Effect.spec
  Helper.spec
  Operator.spec
  Primitive.spec
