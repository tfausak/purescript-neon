module Test.Neon.OperatorSpec where

import Neon (..)
import Test.Spec (..)

spec :: Spec
spec = describe "Neon.Operator" do
  it "defines the operators" do
    (false |> not) ?= true
    (not <| false) ?= true
    (1 + 2) ?= 3
    (false && true) ?= false
    ((+ 2) >> (* 2)) 3 ?= 10
    ((+ 2) << (* 2)) 3 ?= 8
    (1 == 1) ?= true
    (2 > 1) ?= true
    (2 >= 1) ?= true
    (1 < 2) ?= true
    (1 <= 2) ?= true
    (5 % 2) ?= 1
    (2 * 3) ?= 6
    (1 != 2) ?= true
    (false || true) ?= true
    (2 ^ 3) ?= 8
    (2 - 1) ?= 1
