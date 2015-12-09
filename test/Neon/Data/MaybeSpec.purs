module Test.Neon.Data.MaybeSpec where

import Neon
import Neon.Data -- HACK
import Test.Spec

spec :: Spec
spec = describe "Neon.Data.Maybe" do
  describe "Apply" do
    it "can be applied" do
      apply (Just (+ 1)) (Just 1) ?= Just 2
  describe "Bind" do
    it "can be bound" do
      bind (Just 1) (\ x -> Just (x + 1)) ?= Just 2
  describe "Equal" do
    it "can be equated" do
      Nothing == (Nothing :: Maybe Int) ?= true
      Just 1 == Just 1 ?= true
      Nothing == Just 1 ?= false
  describe "FromArray" do
    it "can be converted from an array" do
      fromArray [1, 2] ?= Just 1
  describe "Greater" do
    it "can be greater than" do
      Just 2 > Just 1 ?= true
  describe "Less" do
    it "can be less than" do
      Just 1 < Just 2 ?= true
  describe "Map" do
    it "can be mapped" do
      map (+ 1) (Just 1) ?= Just 2
  describe "Pure" do
    it "supports pure" do
      pure 1 ?= Just 1
  describe "Show" do
    it "can be shown" do
      show (Nothing :: Maybe Int) ?= "Nothing"
      show (Just 1) ?= "Just (1)"
  describe "ToArray" do
    it "can be converted into an array" do
      toArray (Just 1) ?= [1]
  describe "maybe" do
    it "uses the default with nothing" do
      maybe show "default" (Nothing :: Maybe Int) ?= "default"
    it "applies the function with just" do
      maybe show "default" (Just 1) ?= "1"
