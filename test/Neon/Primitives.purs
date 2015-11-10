module Test.Neon.Primitives where

import Neon
import Test.Core (Test())
import Test.Neon.Primitives.Array (testArray)
import Test.Neon.Primitives.Boolean (testBoolean)
import Test.Neon.Primitives.Char (testChar)
import Test.Neon.Primitives.Function (testFunction)
import Test.Neon.Primitives.Int (testInt)
import Test.Neon.Primitives.Number (testNumber)
import Test.Neon.Primitives.Object (testObject)
import Test.Neon.Primitives.String (testString)

testPrimitives :: Test
testPrimitives = do
  info "Neon.Primitives"
  testArray
  testBoolean
  testChar
  testFunction
  testInt
  testNumber
  testObject
  testString
