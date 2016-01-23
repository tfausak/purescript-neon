module Test.Neon.OperatorSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Operator" do
  describe ":" do
    it "is application" do
      let f = (+ 1)
      quickCheck \ x -> x :f === f x
  describe "^" do
    it "is power" do
      quickCheck \ (x :: Int) y -> x ^ y === power y x
  describe "*" do
    it "is multiply" do
      quickCheck \ (x :: Int) y -> x * y === multiply y x
  describe "/" do
    it "is divide" do
      quickCheck \ (x :: Int) y -> x / y === divide y x
  describe "%" do
    it "is remainder" do
      quickCheck \ (x :: Int) y -> x % y === remainder y x
  describe "+" do
    it "is add" do
      quickCheck \ (x :: String) y -> x + y === add y x
  describe "-" do
    it "is subtract" do
      quickCheck \ (x :: Int) y -> x - y === subtract y x
  describe "==" do
    it "is equal" do
      quickCheck \ (x :: Int) y -> x == y === equal y x
  describe "!=" do
    it "is notEqual" do
      quickCheck \ (x :: Int) y -> x != y === notEqual y x
  describe ">" do
    it "is greater" do
      quickCheck \ (x :: Int) y -> x > y === greater y x
  describe ">=" do
    it "is greaterOrEqual" do
      quickCheck \ (x :: Int) y -> x >= y === greaterOrEqual y x
  describe "<" do
    it "is less" do
      quickCheck \ (x :: Int) y -> x < y === less y x
  describe "<=" do
    it "is lessOrEqual" do
      quickCheck \ (x :: Int) y -> x <= y === lessOrEqual y x
  describe "&&" do
    it "is and" do
      quickCheck \ (x :: Boolean) y -> x && y === and y x
  describe "||" do
    it "is or" do
      quickCheck \ (x :: Boolean) y -> x || y === or y x
