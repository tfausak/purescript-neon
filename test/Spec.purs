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

shouldBe :: Boolean -> Boolean -> Spec
shouldBe actual expected =
  let pass = info "PASS"
      fail = do
        error "FAIL"
        throw (exception "Assertion failed!")
  in  case { actual: actual, expected: expected } of
        { actual: false, expected: true } -> fail
        { actual: true, expected: false } -> fail
        { actual: false, expected: false } -> pass
        { actual: true, expected: true } -> pass
