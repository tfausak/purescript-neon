module Test.Neon.PrimitiveSpec where

import Neon (..)
import Test.Spec (..)
import Test.Neon.Primitive.ArraySpec (spec) as Array
import Test.Neon.Primitive.BooleanSpec (spec) as Boolean
import Test.Neon.Primitive.CharSpec (spec) as Char
import Test.Neon.Primitive.FunctionSpec (spec) as Function
import Test.Neon.Primitive.IntSpec (spec) as Int
import Test.Neon.Primitive.NumberSpec (spec) as Number
import Test.Neon.Primitive.ObjectSpec (spec) as Object
import Test.Neon.Primitive.StringSpec (spec) as String

spec :: Spec
spec = describe "Neon.Primitive" do
  Array.spec
  Boolean.spec
  Char.spec
  Function.spec
  Int.spec
  Number.spec
  Object.spec
  String.spec
