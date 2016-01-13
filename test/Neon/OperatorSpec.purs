module Test.Neon.OperatorSpec where

import Test.Helper (..)

spec :: Spec
spec = describe "Neon.Operator" do
  describe "^" do
    it "is power" do
      2 ^ 3 ?= 8
  describe "*" do
    it "is multiply" do
      2 * 3 ?= 6
  describe "/" do
    it "is divide" do
      5 / 2 ?= 2
  describe "%" do
    it "is remainder" do
      5 % 2 ?= 1
  describe "+" do
    it "is add" do
      "a" + "b" ?= "ab"
  describe "-" do
    it "is subtract" do
      2 - 1 ?= 1
  describe "==" do
    it "is equal" do
      false == false ?= true
  describe "!=" do
    it "is notEqual" do
      false != true ?= true
  describe ">" do
    it "is greater" do
      2 > 1 ?= true
  describe ">=" do
    it "is greaterOrEqual" do
      1 >= 1 ?= true
  describe "<" do
    it "is less" do
      1 < 2 ?= true
  describe "<=" do
    it "is lessOrEqual" do
      1 <= 1 ?= true
  describe "&&" do
    it "is and" do
      true && true ?= true
  describe "||" do
    it "is or" do
      false || true ?= true
  describe ":" do
    it "is application" do
      false :not ?= true
