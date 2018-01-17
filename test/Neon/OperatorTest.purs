module Test.Neon.OperatorTest where

import Neon as Neon
import Test.Helper (Suite, discard, quickCheck, suite, test, (===))

tests :: Suite
tests = suite "Operator" do
  test ":" do
    quickCheck \ (x :: Int) ->
      x Neon.: Neon.identity === Neon.identity x
  test "^" do
    quickCheck \ (x :: Number) y ->
      x Neon.^ y === Neon.power y x
  test "*" do
    quickCheck \ (x :: Int) y ->
      x Neon.* y === Neon.multiply y x
  test "/" do
    quickCheck \ (x :: Int) y ->
      x Neon./ y === Neon.divide y x
  test "+" do
    quickCheck \ (x :: Int) y ->
      x Neon.+ y === Neon.add y x
  test "-" do
    quickCheck \ (x :: Int) y ->
      x Neon.- y === Neon.subtract y x
  test "==" do
    quickCheck \ (x :: Boolean) y ->
      x Neon.== y === Neon.equal y x
  test "!=" do
    quickCheck \ (x :: Boolean) y ->
      x Neon.!= y === Neon.notEqual y x
  test ">" do
    quickCheck \ (x :: Boolean) y ->
      x Neon.> y === Neon.greater y x
  test ">=" do
    quickCheck \ (x :: Boolean) y ->
      x Neon.>= y === Neon.greaterOrEqual y x
  test "<" do
    quickCheck \ (x :: Boolean) y ->
      x Neon.< y === Neon.less y x
  test "<=" do
    quickCheck \ (x :: Boolean) y ->
      x Neon.<= y === Neon.lessOrEqual y x
  test "&&" do
    quickCheck \ (x :: Boolean) y ->
      x Neon.&& y === Neon.and y x
  test "||" do
    quickCheck \ (x :: Boolean) y ->
      x Neon.|| y === Neon.or y x
