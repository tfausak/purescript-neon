module Test.Spec where

import Neon

type Spec = Effect (console :: CONSOLE, exception :: EXCEPTION) Unit

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
    info "PASS"
  else do
    error "FAIL"
    throw (exception (show actual))
