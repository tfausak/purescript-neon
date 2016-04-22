module Test.Neon.Class.HasInspectTest where

import Neon as Neon
import Prelude as Prelude
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "HasInspect" do
  test "List" do
    quickCheck \ (x :: Array Int) ->
      Neon.inspect x === Prelude.show x
  test "Boolean" do
    quickCheck \ (x :: Boolean) ->
      Neon.inspect x === Prelude.show x
  test "Char" do
    quickCheck \ (x :: Char) ->
      Neon.inspect x === Prelude.show x
  -- test "Error" do
  test "Int" do
    quickCheck \ (x :: Int) ->
      Neon.inspect x === Prelude.show x
  test "List" do
    quickCheck \ (x :: Neon.List Int) ->
      Neon.inspect x === Prelude.show x
  test "Number" do
    quickCheck \ (x :: Number) ->
      Neon.inspect x === Prelude.show x
  test "String" do
    quickCheck \ (x :: String) ->
      Neon.inspect x === Prelude.show x
  test "Unit" do
    quickCheck \ (x :: Neon.Unit) ->
      Neon.inspect x === Prelude.show x