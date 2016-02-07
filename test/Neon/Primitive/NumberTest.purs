module Test.Neon.Primitive.NumberTest where

import Data.Int as Int
import Global as Global
import Neon as Neon
import Test.Core (Tests, bind, quickCheck, test, (===))

tests :: Tests
tests = test "Number" do
  test "ceiling" do
    quickCheck \ x ->
      Neon.ceiling x === Int.ceil x
  test "finite" do
    quickCheck \ x ->
      Neon.finite x === Global.isFinite x
  test "floor" do
    quickCheck \ x ->
      Neon.floor x === Int.floor x
  -- test "infinity"
  test "isNaN" do
    quickCheck \ x ->
      Neon.isNaN x === Global.isNaN x
  -- test "nan"
  test "round" do
    quickCheck \ x ->
      Neon.round x === Int.round x
