module Test.Neon.Transformers.StateT where

import Neon
import Neon.Transformers -- NOTE: purescript/purescript#1594
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

testStateT :: Test
testStateT = do
  info "Neon.Transformers.StateT"
  let x = StateT (\ x -> pure (pair 0 x))
  runStateT (StateT (constant []) <|> StateT (\ y -> pure (pair 0 y))) 2 ==> [pair 0 2]
  runStateT (StateT (\ y -> pure (pair (+ 1) y)) <*> x) 2 ==> Identity (pair 1 2)
  runStateT (x >>= ((+ 1) >> pure)) 2 ==> Identity (pair 1 2)
  runStateT empty 2 ==> Nothing :: Maybe (Pair Unit Int)
  runStateT (lift (pure 1)) 2 ==> Identity (pair 1 2)
  runStateT ((+ 1) <$> x) 2 ==> Identity (pair 1 2)
  runStateT (pure 1) 2 ==> Identity (pair 1 2)
  runStateT x 2 ==> Identity (pair 0 2)
