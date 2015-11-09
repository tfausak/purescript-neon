module Test.Neon.Values.Either where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

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
