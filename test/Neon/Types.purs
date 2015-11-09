module Test.Neon.Types where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core

testTypes :: Test
testTypes = do
  testHasAdd
  testHasAlternative
  testHasAnd
  testHasApply
  testHasBind
  testHasBottom
  testHasCompare
  testHasCompose
  testHasDivide
  testHasEmpty
  testHasEqual
  testHasFold
  testHasIdentity
  testHasLift
  testHasMap
  testHasMultiply
  testHasNot
  testHasOne
  testHasOr
  testHasPure
  testHasShow
  testHasState
  testHasSubtract
  testHasTop
  testHasZero

testHasAdd :: Test
testHasAdd = do
  [1] + [2] ==> [1, 2]
  add true true ==> true
  ((+ "!") + (+ "?")) "Eh" ==> "Eh!Eh?"
  1 + 2 ==> 3
  1.0 + 2.0 ==> 3.0
  "1" + "2" ==> "12"

testHasAlternative :: Test
testHasAlternative = do
  alternative [1] [2] ==> [1, 2]
  [1] <|> [2] ==> [1, 2]

testHasAnd :: Test
testHasAnd = do
  and true true ==> true
  true && true ==> true
  (identity && not) true ==> false

testHasApply :: Test
testHasApply = do
  apply [(+ 1), (+ 2)] [1, 2] ==> [2, 3, 3, 4]
  ((+) <*> (+ 2)) 1 ==> 4
  [1] *> [2] ==> [2]
  [1] <* [2] ==> [1]

testHasBind :: Test
testHasBind = do
  bind [1, 2] (\ x -> [x, x + 1]) ==> [1, 2, 2, 3]
  [1, 2] >>= (\ x -> [x, x + 1]) ==> [1, 2, 2, 3]
  ((+) =<< (+ 2)) 1 ==> 4

testHasBottom :: Test
testHasBottom = do
  bottom ==> false
  -- bottom ==> '\0' -- TODO: purescript/purescript#1602
  bottom unit ==> false
  bottom ==> 0 - 2147483648 -- NOTE: purescript/purescript#1591
  bottom ==> LessThan

testHasCompare :: Test
testHasCompare = do
  compare [1] [1] ==> EqualTo
  lessThan false true ==> true
  greaterThan 'b' 'a' ==> true
  compare (+ 1) (+ 1) ==> LessThan
  let f = (+ 1)
  compare f f ==> EqualTo
  compare 1 1 ==> EqualTo
  lessThanOrEqualTo 0.1 2.3 ==> true
  greaterThanOrEqualTo EqualTo LessThan ==> true
  compare "neon" "neon" ==> EqualTo
  1 < 2 ==> true
  2 <= 2 ==> true
  2 >= 2 ==> true
  3 > 2 ==> true
  min 1 2 ==> 1
  max 1 2 ==> 2
  clamp 2 4 1 ==> 2

testHasCompose :: Test
testHasCompose = do
  compose (+ 2) (* 2) 3 ==> 10
  ((+ 2) >> (* 2)) 3 ==> 10
  ((+ 2) << (* 2)) 3 ==> 8

testHasDivide :: Test
testHasDivide = do
  ((+ 2) / (\ x -> x - 3)) 8 ==> 2
  ((+ 2) % (\ x -> x - 3)) 8 ==> 0
  divide 5 2 ==> 2
  modulo 5 2 ==> 1
  5.0 / 2.0 ==> 2.5
  5.0 % 2.0 ==> 0.0

testHasEmpty :: Test
testHasEmpty = do
  empty ==> [] :: Array Unit

testHasEqual :: Test
testHasEqual = do
  [1] == [1] ==> true
  equal true false ==> false
  'a' == 'a' ==> true
  (+ 1) == (+ 1) ==> false
  let f = (+ 1)
  f == f ==> true
  1 == 2 ==> false
  1.0 == 1.0 ==> true
  { k: "a" } == { k: "z" } ==> false
  "neon" == "neon" ==> true

testHasFold :: Test
testHasFold = do
  foldl (+) "a" ["b", "c"] ==> "abc"
  foldr (+) "a" ["b", "c"] ==> "bca"

testHasIdentity :: Test
testHasIdentity = do
  identity unit ==> unit

testHasLift :: Test
testHasLift = do
  -- This module does not define any instances.
  pure unit

testHasMap :: Test
testHasMap = do
  (+ 1) <$> [1, 2] ==> [2, 3]
  (map (+ 2) (* 2)) 3 ==> 8
  [1, 3] $> 2 ==> [2, 2]
  2 <$ [1, 3] ==> [2, 2]

testHasMultiply :: Test
testHasMultiply = do
  multiply false true ==> false
  ((+ 2) * (+ 3)) 3 ==> 30
  2 * 3 ==> 6
  2.0 * 3.0 ==> 6.0

testHasNot :: Test
testHasNot = do
  not true ==> false
  not (constant false) unit ==> true
  notEqual 1 2 ==> true
  1 != 2 ==> true

testHasOne :: Test
testHasOne = do
  one ==> true
  one unit ==> 1
  one ==> 1
  one ==> 1.0

testHasOr :: Test
testHasOr = do
  or false true ==> true
  false || true ==> true
  (identity || not) false ==> true

testHasPure :: Test
testHasPure = do
  pure 1 ==> [1]
  (pure 1 :: Unit -> Int) unit ==> 1

testHasShow :: Test
testHasShow = do
  show [1, 2] ==> "[1, 2]"
  show true ==> "true"
  show 'a' ==> "'a'"
  show '\65535' ==> "'\\65535'"
  show 0 ==> "0"
  show 1.2 ==> "1.2"
  show "neon" ==> "\"neon\""
  show " ~\8\65535" ==> "\" ~\\8\\65535\""

testHasState :: Test
testHasState = do
  -- This module does not define any instances.
  pure unit

testHasSubtract :: Test
testHasSubtract = do
  ((+ 2) - (+ 1)) 3 ==> 1
  subtract 3 2 ==> 1
  3.0 - 2.0 ==> 1.0
  negate 1 ==> 0 - 1 -- NOTE: purescript/purescript#1591

testHasTop :: Test
testHasTop = do
  top ==> true
  top ==> '\65535'
  top unit ==> true
  top ==> 2147483647
  top ==> GreaterThan

testHasZero :: Test
testHasZero = do
  zero ==> [] :: Array Unit
  zero ==> false
  zero unit ==> 0
  zero ==> 0
  zero ==> 0.0
  zero ==> ""
