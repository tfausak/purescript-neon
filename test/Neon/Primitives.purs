module Test.Neon.Primitives where

import Neon
import Test.Core

testPrimitives :: Test
testPrimitives = do
  testArray
  testBoolean
  testChar
  testFunction
  testInt
  testNumber
  testObject
  testString

testArray :: Test
testArray = do
  -- This module does not export anything.
  pure unit

testBoolean :: Test
testBoolean = do
  otherwise ==> true

testChar :: Test
testChar = do
  toLower 'A' ==> 'a'
  toUpper 'a' ==> 'A'

testFunction :: Test
testFunction = do
  constant true unit ==> true
  flip (+) "a" "b" ==> "ba"
  (false |> not) ==> true
  (not <| true) ==> false

testInt :: Test
testInt = do
  -- This module does not export anything.
  pure unit

testNumber :: Test
testNumber = do
  -- This module does not export anything.
  pure unit

testObject :: Test
testObject = do
  -- This module does not export anything.
  pure unit

testString :: Test
testString = do
  fromCharArray ['a', 'b'] ==> "ab"
  toCharArray "ab" ==> ['a', 'b']
