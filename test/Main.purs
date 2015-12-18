module Test.Main where

import Test.Spec (..)
import Test.NeonSpec (spec) as Neon

main :: Spec
main = runSpec Neon.spec
