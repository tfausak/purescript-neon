module Test.Main where

import Neon
import Neon.Values -- TODO: purescript/purescript#1594

type Test = Effect (exception :: EXCEPTION, output :: OUTPUT) Unit

main :: Test
main = do
  testEffects
  testPrimitives
  testTypes
  testValues

  print "✔︎ Tests passed."

-- Effects

testEffects :: Test
testEffects = do
  testEffect
  testException
  testOutput
  testRandom

testEffect :: Test
testEffect = do
  print "? Effect" -- TODO

testException :: Test
testException = do
  print "? Exception" -- TODO

testOutput :: Test
testOutput = do
  print "? Output" -- TODO

testRandom :: Test
testRandom = do
  print "? Random" -- TODO

-- Primitives

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
  print "? Array" -- TODO

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
  print "? Int" -- TODO

testNumber :: Test
testNumber = do
  print "? Number" -- TODO

testObject :: Test
testObject = do
  print "? Object" -- TODO

testString :: Test
testString = do
  fromCharArray ['a', 'b'] ==> "ab"
  toCharArray "ab" ==> ['a', 'b']

-- Types

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
  bottom ==> 0 - 2147483648
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
  print "? HasLift" -- TODO

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
  print "? HasState" -- TODO

testHasSubtract :: Test
testHasSubtract = do
  ((+ 2) - (+ 1)) 3 ==> 1
  subtract 3 2 ==> 1
  3.0 - 2.0 ==> 1.0
  negate 1 ==> 0 - 1 -- TODO: purescript/purescript#1591

testHasTop :: Test
testHasTop = do
  top ==> true
  top ==> '\65535'
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

-- Values

testValues :: Test
testValues = do
  testEither
  testIdentity
  testMaybe
  testOrdering
  testPair
  testUnit

testEither :: Test
testEither = do
  Left 1 + Right 2.0 ==> Left 1
  Left 1 <|> Right '2' ==> Right '2'
  Left false && Right true ==> Left false
  Right (+ 1) <*> Right 1 ==> Right 2 :: Either Unit Int
  (Right 1 >>= \ x -> Right (x + 1)) ==> Right 2 :: Either Unit Int
  bottom ==> Left false :: Either Boolean Unit
  Left 1 < Right 2 ==> true
  Right 5 / Right 2 ==> Right 2 :: Either Unit Int
  Right 5 % Right 2 ==> Right 1 :: Either Unit Int
  Left 1 == Right '2' ==> false
  foldl (+) 1 (Right 2) ==> 3
  foldr (+) 1 (Left 2) ==> 1
  (+ 1) <$> Right 1 ==> Right 2 :: Either Unit Int
  Right 2 * Right 3 ==> Right 6 :: Either Unit Int
  not (Right false) ==> Right true :: Either Unit Boolean
  one ==> Right 1 :: Either Unit Int
  Right false || Right true ==> Right true :: Either Unit Boolean
  pure 1 ==> Right 1 :: Either Unit Int
  show (Right unit :: Either Boolean Unit) ==> "Right (unit)"
  Right 3 - Right 2 ==> Right 1 :: Either Unit Int
  top ==> Right true :: Either Unit Boolean
  zero ==> Right 0 :: Either Unit Int
  either show show (Left 'a' :: Either Char Unit) ==> "'a'"
  either show show (Right 'a' :: Either Unit Char) ==> "'a'"

testIdentity :: Test
testIdentity = do
  Identity 1 + Identity 2 ==> Identity 3
  Identity true && Identity true ==> Identity true
  Identity (+ 1) <*> Identity 2 ==> Identity 3
  Identity 1 >>= ((+ 1) >> pure) ==> Identity 2
  bottom ==> Identity false
  Identity 1 < Identity 2 ==> true
  Identity 5 / Identity 2 ==> Identity 2
  Identity 5 % Identity 2 ==> Identity 1
  Identity 2 == Identity 2 ==> true
  foldl (+) "a" (Identity "b") ==> "ab"
  foldr (+) "a" (Identity "b") ==> "ba"
  (+ 1) <$> Identity 1 ==> Identity 2
  Identity 2 * Identity 3 ==> Identity 6
  not (Identity false) ==> Identity true
  one ==> Identity 1
  Identity false || Identity true ==> Identity true
  pure unit ==> Identity unit
  show (Identity unit) ==> "Identity (unit)"
  Identity 3 - Identity 2 ==> Identity 1
  top ==> Identity true
  zero ==> Identity 0

testMaybe :: Test
testMaybe = do
  Just 1 + Just 2 ==> Just 3
  Nothing <|> Just 1 ==> Just 1
  Just true && Just true ==> Just true
  Just (+ 1) <*> Just 1 ==> Just 2
  bind (Just 1) (\x -> pure (x + 1)) ==> Just 2
  bottom ==> Nothing :: Maybe Unit
  compare (Just 1) (Just 2) ==> LessThan
  Just 5 / Just 2 ==> Just 2
  Just 5 % Just 2 ==> Just 1
  empty ==> Nothing :: Maybe Unit
  Just 1 == Just 1 ==> true
  foldl (+) 1 (Just 2) ==> 3
  foldr (+) 1 Nothing ==> 1
  map (+ 1) (Just 1) ==> Just 2
  Just 2 * Just 3 ==> Just 6
  not (Just true) ==> Just false
  one ==> Just 1
  Just false || Just true ==> Just true
  pure 1 ==> Just 1
  show (Just 1) ==> "Just (1)"
  Just 2 - Just 1 ==> Just 1
  top ==> Just unit
  zero ==> Just unit
  maybe "?" identity Nothing ==> "?"
  maybe "?" identity (Just "something") ==> "something"
  isJust (Nothing :: Maybe Unit) ==> false
  isJust (Just unit :: Maybe Unit) ==> true
  isNothing (Nothing :: Maybe Unit) ==> true
  isNothing (Just unit :: Maybe Unit) ==> false
  fromMaybe 1 Nothing ==> 1
  fromMaybe 1 (Just 2) ==> 2

testOrdering :: Test
testOrdering = do
  compare LessThan GreaterThan ==> LessThan
  LessThan == GreaterThan ==> false
  show EqualTo ==> "EqualTo"

testPair :: Test
testPair = do
  pair 1 2 + pair 3 4 ==> pair 4 6
  pair false true && pair true true ==> pair false true
  pair 1 (+ 3) <*> pair 3 4 ==> pair 4 7
  pair 1 2 >>= (\ x -> pair x x) ==> pair 3 2
  bottom ==> pair false false
  pair 1 2 < pair 1 3 ==> true
  pair 1 2 >> pair 3 4 ==> pair 1 4
  pair 9 8 / pair 4 2 ==> pair 2 4
  pair 9 8 % pair 4 2 ==> pair 1 0
  pair 1 2 == pair 1 2 ==> true
  foldl (+) 1 (pair 2 3) ==> 4
  foldr (+) 1 (pair 2 3) ==> 4
  (+ 1) <$> pair 1 2 ==> pair 1 3
  pair 2 3 * pair 4 5 ==> pair 8 15
  not (pair false true) ==> pair true false
  one ==> pair 1 1
  pair false false || pair false true ==> pair false true
  pure 3 ==> pair 0 3
  show (pair 1 2) ==> "Pair { first: 1, second: 2 }"
  pair 9 8 - pair 2 3 ==> pair 7 5
  top ==> pair true true
  zero ==> pair 0 0
  pair 1 2 ==> Pair { first: 1, second: 2 }
  curry (\ (Pair x) -> x.first + x.second) 2 3 ==> 5
  uncurry (\ x y -> x + y) (pair 2 3) ==> 5

testUnit :: Test
testUnit = do
  unit + unit ==> unit
  unit && unit ==> unit
  bottom ==> unit
  compare unit unit ==> EqualTo
  divide unit unit ==> unit
  modulo unit unit ==> unit
  unit == unit ==> true
  unit * unit ==> unit
  not unit ==> unit
  one ==> unit
  unit || unit ==> unit
  show unit ==> "unit"
  unit - unit ==> unit
  top ==> unit
  zero ==> unit

-- Helpers

shouldBe :: forall a. (HasEqual a, HasShow a) => a -> a -> Test
shouldBe x y = if x == y
  then do
    print ("✔︎ " + show x + " = " + show y)
  else do
    print ("✘ " + show x + " ≠ " + show y)
    throw (exception "test failed")

(==>) :: forall a. (HasEqual a, HasShow a) => a -> a -> Test
(==>) x y = shouldBe x y
infix 0 ==>
