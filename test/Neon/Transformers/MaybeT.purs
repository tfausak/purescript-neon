module Test.Neon.Transformers.MaybeT where

import Neon
import Neon.Transformers -- TODO: #45
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

testMaybeT :: Test
testMaybeT = do
  info "Neon.Transformers.MaybeT"
  let x = MaybeT (pure (pure 1))
  runMaybeT (MaybeT (pure empty) <|> x) ==> Identity (Just 1)
  runMaybeT (MaybeT (pure (pure (+ 1))) <*> x) ==> Identity (Just 2)
  runMaybeT (x >>= ((+ 1) >> pure)) ==> Identity (Just 2)
  runMaybeT empty ==> Identity (Nothing :: Maybe Unit)
  runMaybeT (lift (pure 1)) ==> Identity (Just 1)
  runMaybeT ((+ 1) <$> x) ==> Identity (Just 2)
  runMaybeT (pure 1) ==> Identity (Just 1)
  runMaybeT x ==> Identity (Just 1)
