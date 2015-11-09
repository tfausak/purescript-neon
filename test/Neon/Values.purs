module Test.Neon.Values where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core

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
