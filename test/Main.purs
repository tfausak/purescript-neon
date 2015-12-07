module Test.Main where

import Test.Spec
import qualified Test.NeonSpec as Neon

main :: Spec
main = runSpec Neon.spec
