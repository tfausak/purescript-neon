module Test.Neon.Class.InspectTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "Inspect" do
  test "Boolean" do
    quickCheck \ (x :: Boolean) ->
      Neon.inspect x === Prelude.show x
  test "Char" do
    quickCheck \ (x :: Char) ->
      Neon.inspect x === Prelude.show x
  test "Int" do
    quickCheck \ (x :: Int) ->
      Neon.inspect x === Prelude.show x
  test "Number" do
    quickCheck \ (x :: Number) ->
      Neon.inspect x === Prelude.show x
  test "String" do
    quickCheck \ (x :: String) ->
      Neon.inspect x === Prelude.show x
