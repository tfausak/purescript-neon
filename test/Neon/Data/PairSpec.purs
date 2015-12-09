module Test.Neon.Data.PairSpec where

import Neon
import Test.Spec

spec :: Spec
spec = describe "Neon.Data.Pair" do
  describe "Equal" do
    it "can be equated" do
      pair 1 2.0 == pair 1 2.0 ?= true
  describe "Show" do
    it "can be shown" do
      show (pair 1 2.0) ?= "Pair { first: 1, second: 2.0 }"
