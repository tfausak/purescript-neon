module Test.Neon.Transformers.MaybeT where

import Neon
import Neon.Transformers -- NOTE: purescript/purescript#1594
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

testMaybeT :: Test
testMaybeT = do
  info "Neon.Transformers.MaybeT"
  let x = MaybeT (Identity (Just 1))
  runMaybeT (MaybeT (Identity Nothing) <|> x) ==> Identity (Just 1)
  runMaybeT (MaybeT (Identity (Just (+ 1))) <*> x) ==> Identity (Just 2)
  runMaybeT (x >>= ((+ 1) >> pure)) ==> Identity (Just 2)
  runMaybeT empty ==> Identity (Nothing :: Maybe Unit)
  runMaybeT (lift (pure 1)) ==> Identity (Just 1)
  runMaybeT ((+ 1) <$> x) ==> Identity (Just 2)
  runMaybeT (pure 1) ==> Identity (Just 1)
  runMaybeT x ==> Identity (Just 1)
