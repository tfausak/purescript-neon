module Test.Neon.Effect.EffectSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Effect.Effect" do
  describe "Apply" do
    it "can be applied" do
      runPure (apply (pure show) (pure true)) ?= "true"
  describe "Bind" do
    it "can be bound" do
      runPure (bind (pure false) (not >> pure)) ?= true
  describe "Map" do
    it "can be mapped" do
      runPure (map (+ 1) (pure 1)) ?= 2
  describe "Pure" do
    it "supports pure" do
      runPure (pure true) ?= true
  describe "runPure" do
    pending
  describe "unsafeRunEffect" do
    it "runs the effect" do
      unsafeRunEffect (pure true) ?= true
