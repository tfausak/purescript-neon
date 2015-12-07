module Test.Spec where

import Neon

type Spec = Effect (console :: CONSOLE, exception :: EXCEPTION) Unit

runSpec :: Spec -> Spec
runSpec = identity

describe :: String -> Spec -> Spec
describe message spec = do
  info message
  spec

it :: String -> Spec -> Spec
it message spec = do
  info message
  spec

shouldBe :: forall a. (Equal a, Show a) => a -> a -> Spec
shouldBe actual expected =
  if equal actual expected
  then do
    info ("- PASS: " + show actual + " == " + show expected)
  else do
    error ("- FAIL: " + show actual + " != " + show expected)
    throw (exception (show actual))

pending :: Spec
pending = pure unit
