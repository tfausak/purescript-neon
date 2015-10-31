module Test.Main where

import Neon

main :: Effect (exception :: EXCEPTION, output :: OUTPUT) Unit
main = do
  -- Add
  [1] + [2] ==> [1, 2]
  1 + 2 ==> 3
  1.0 + 2.0 ==> 3.0
  "1" + "2" ==> "12"

  -- Alternative
  [1] <|> [2] ==> [1, 2]

  -- And
  true && true ==> true
  ((\ _ -> true) && (\ _ -> true)) unit ==> true

  -- Apply
  apply [(+ 1), (+ 2)] [1, 2] ==> [2, 3, 3, 4]
  (apply (+) (+ 2)) 1 ==> 4

  -- Bind
  bind [1, 2] (\ x -> [x, x + 1]) ==> [1, 2, 2, 3]
  (bind (+ 2) (+)) 1 ==> 4

  -- Bounded
  bottom ==> false
  top ==> true
  -- TODO: Test character instance.
  bottom ==> 0 - 2147483648
  top ==> 2147483647
  -- TODO: Test function instance.

  -- Compare
  compare [1] [1] ==> EqualTo
  compare false true ==> LessThan
  compare 'b' 'a' ==> GreaterThan
  compare 1 1 ==> EqualTo
  compare 0.1 2.3 ==> LessThan
  compare EqualTo LessThan ==> GreaterThan
  compare "neon" "neon" ==> EqualTo

  -- Compose
  ((+ 2) >> (* 2)) 3 ==> 10

  -- Divide
  5 / 2 ==> 2
  5 % 2 ==> 1
  5.0 / 2.0 ==> 2.5
  5.0 % 2.0 ==> 0.0

  -- TODO: Effect

  -- Either
  Left 1 + Right 2.0 ==> Left 1
  Left 1 <|> Right '2' ==> Right '2'
  Left false && Right true ==> Left false
  Right (+ 1) <*> Right 1 ==> Right 2 :: Either Unit Int
  (Right 1 >>= \ x -> Right (x + 1)) ==> Right 2 :: Either Unit Int
  top ==> Right true :: Either Unit Boolean
  Left 1 < Right 2 ==> true
  Left 1 == Right '2' ==> false
  (+ 1) <$> Right 1 ==> Right 2 :: Either Unit Int
  Right 2 * Right 3 ==> Right 6 :: Either Unit Int
  not (Right false) ==> Right true :: Either Unit Boolean
  one ==> Right 1 :: Either Unit Int
  Right false || Right true ==> Right true :: Either Unit Boolean
  pure 1 ==> Right 1 :: Either Unit Int
  show (Right unit :: Either Boolean Unit) ==> "Right (unit)"
  Right 3 - Right 2 ==> Right 1 :: Either Unit Int
  zero ==> Right 0 :: Either Unit Int

  -- Empty
  empty ==> [] :: Array Unit

  -- Equal
  [1] == [1] ==> true
  true == false ==> false
  'a' == 'a' ==> true
  1 == 2 ==> false
  1.0 == 1.0 ==> true
  { k: "a" } == { k: "z" } ==> false
  "neon" == "neon" ==> true

  -- Exception
  runPure (catch (throw (exception "a")) (\ _ -> pure "b")) ==> "b"

  -- Identity
  identity unit ==> unit

  -- Map
  map (+ 1) [1, 2] ==> [2, 3]
  (map (+ 2) (* 2)) 3 ==> 8

  -- Maybe
  Just 1 + Just 2 ==> Just 3
  Nothing <|> Just 1 ==> Just 1
  Just true && Just true ==> Just true
  Just (+ 1) <*> Just 1 ==> Just 2
  bind (Just 1) (\x -> pure (x + 1)) ==> Just 2
  top ==> Just unit
  compare (Just 1) (Just 2) ==> LessThan
  Just 5 / Just 2 ==> Just 2
  Just 5 % Just 2 ==> Just 1
  empty ==> Nothing :: Maybe Unit
  Just 1 == Just 1 ==> true
  map (+ 1) (Just 1) ==> Just 2
  Just 2 * Just 3 ==> Just 6
  not (Just true) ==> Just false
  one ==> Just 1
  Just false || Just true ==> Just true
  pure 1 ==> Just 1
  show (Just 1) ==> "Just (1)"
  Just 2 - Just 1 ==> Just 1
  zero ==> Just unit

  -- Multiply
  2 * 3 ==> 6
  2.0 * 3.0 ==> 6.0

  -- Not
  not true ==> false
  (not \ _ -> false) unit ==> true

  -- One
  one ==> 1
  one ==> 1.0

  -- Or
  false || true ==> true
  ((\ _ -> true) || (\ _ -> false)) unit ==> true

  -- Ordering
  bottom ==> LessThan
  top ==> GreaterThan
  EqualTo == EqualTo ==> true
  show LessThan ==> "LessThan"

  -- TODO: Output

  -- Pure
  pure 1 ==> [1]
  -- TODO: Test function instance.

  -- Show
  show [1, 2] ==> "[1, 2]"
  show true ==> "true"
  show 'a' ==> "'a'"
  show 0 ==> "0"
  show 1.2 ==> "1.2"
  show "neon" ==> "\"neon\""

  -- Subtract
  2 - 3 ==> 0 - 1
  3.0 - 2.0 ==> 1.0

  -- Unit
  unit + unit ==> unit
  unit && unit ==> unit
  bottom ==> unit
  top ==> unit
  compare unit unit ==> EqualTo
  divide unit unit ==> unit
  modulo unit unit ==> unit
  unit * unit ==> unit
  not unit ==> unit
  one ==> unit
  unit || unit ==> unit
  show unit ==> "unit"
  unit - unit ==> unit
  zero ==> unit

  -- Zero
  zero ==> [] :: Array Unit
  zero ==> 0
  zero ==> 0.0
  zero ==> ""

  pure unit

shouldBe :: forall a. (Equal a, Show a) => a -> a -> Effect (exception :: EXCEPTION, output :: OUTPUT) Unit
shouldBe x y = if x == y
  then do
    print ("✔︎ " + show x + " = " + show y)
  else do
    print ("✘ " + show x + " ≠ " + show y)
    throw (exception "test failed")

(==>) :: forall a. (Equal a, Show a) => a -> a -> Effect (exception :: EXCEPTION, output :: OUTPUT) Unit
(==>) x y = shouldBe x y
infix 0 ==>
