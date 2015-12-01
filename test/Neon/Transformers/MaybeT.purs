module Test.Neon.Transformers.MaybeT where

import Neon
import Neon.Transformers -- TODO: #45
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Transformers.MaybeT"
  let x = MaybeT (pure (pure 1))
  runMaybeT (alternative (MaybeT (pure empty)) x) ==> Identity (Just 1)
  runMaybeT (MaybeT (pure (pure (+ 1))) <*> x) ==> Identity (Just 2)
  runMaybeT (bind x ((+ 1) >> pure)) ==> Identity (Just 2)
  runMaybeT empty ==> Identity (Nothing :: Maybe Unit)
  runMaybeT (lift (pure 1)) ==> Identity (Just 1)
  runMaybeT (map (+ 1) x) ==> Identity (Just 2)
  runMaybeT (pure 1) ==> Identity (Just 1)
  runMaybeT x ==> Identity (Just 1)
