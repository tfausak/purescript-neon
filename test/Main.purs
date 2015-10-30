module Test.Main where

import Ax

main :: Effect (assert :: ASSERT, output :: OUTPUT) Unit
main = do
  -- Add
  [1] + [2] ==> [1, 2]
  1 + 2 ==> 3
  1.0 + 2.0 ==> 3.0
  "1" + "2" ==> "12"

  -- And
  true && true ==> true
  ((\ _ -> true) && (\ _ -> true)) unit ==> true

  -- Apply
  apply [(+ 1), (+ 2)] [1, 2] ==> [2, 3, 3, 4]
  (apply (+) (+ 2)) 1 ==> 4

  -- TODO: Assert

  -- Bind
  bind [1, 2] (\ x -> [x, x + 1]) ==> [1, 2, 2, 3]
  (bind (+ 2) (+)) 1 ==> 4

  -- Bounded
  bottom ==> false
  top ==> true
  -- TODO: Test character instance.
  bottom ==> negate 2147483648
  top ==> 2147483647
  -- TODO: Test function instance.

  -- Compare
  compare [1] [1] ==> EqualTo
  compare false true ==> LessThan
  compare 'b' 'a' ==> GreaterThan
  compare 1 1 ==> EqualTo
  compare 0.1 2.3 ==> LessThan
  compare EqualTo LessThan ==> GreaterThan
  compare "ax" "ax" ==> EqualTo

  -- Compose
  ((+ 2) >> (* 2)) 3 ==> 10

  -- Divide
  5 / 2 ==> 2
  5 % 2 ==> 1
  5.0 / 2.0 ==> 2.5
  5.0 % 2.0 ==> 0.0

  -- TODO: Effect

  -- Equal
  [1] == [1] ==> true
  true == false ==> false
  'a' == 'a' ==> true
  1 == 2 ==> false
  1.0 == 1.0 ==> true
  { k: "a" } == { k: "z" } ==> false
  "ax" == "ax" ==> true

  -- Exception
  runPure (catch (throw (exception "a")) (\ _ -> pure "b")) ==> "b"

  -- Identity
  identity unit ==> unit

  -- Map
  map (+ 1) [1, 2] ==> [2, 3]
  (map (+ 2) (* 2)) 3 ==> 8

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
  show "ax" ==> "\"ax\""

  -- Subtract
  2 - 3 ==> negate 1
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
  zero ==> [] :: Array Boolean
  zero ==> 0
  zero ==> 0.0
  zero ==> ""

  pure unit

shouldBe :: forall a. (Equal a, Show a) => a -> a -> Effect (assert :: ASSERT, output :: OUTPUT) Unit
shouldBe x y = if x == y
  then do
    print ("✔︎ " + show x + " = " + show y)
  else do
    print ("✘ " + show x + " ≠ " + show y)
    assert false

(==>) :: forall a. (Equal a, Show a) => a -> a -> Effect (assert :: ASSERT, output :: OUTPUT) Unit
(==>) x y = shouldBe x y
infix 0 ==>
