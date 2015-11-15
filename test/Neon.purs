module Test.Neon where

import Neon
import Test.Core (Test())
import qualified Test.Neon.Effects as Effects
import qualified Test.Neon.Primitives as Primitives
import qualified Test.Neon.Transformers as Transformers
import qualified Test.Neon.Types as Types
import qualified Test.Neon.Values as Values

main :: Test
main = do
  info "Neon"
  Effects.main
  Primitives.main
  Transformers.main
  Types.main
  Values.main
