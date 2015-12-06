module Test.Neon.Effect.EffectSpec where

import Neon
import Test.Spec

main :: Spec
main = describe "Neon.Effect.Effect" do
  runPure (apply (pure show) (pure true)) `shouldBe` "true"
  runPure (bind (pure false) (not >> pure)) `shouldBe` true
  runPure (pure true) `shouldBe` true
  unsafeRunEffect (pure true) `shouldBe` true
