module Test.Neon.Transformers.StateT where

import Neon
import Neon.Transformers -- TODO: #45
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Transformers.StateT"
  let x = StateT (\ x -> pure (pair 0 x))
  runStateT (StateT (always []) <|> StateT (\ y -> pure (pair 0 y))) 2 ==> [pair 0 2]
  runStateT (StateT (\ y -> pure (pair (+ 1) y)) <*> x) 2 ==> Identity (pair 1 2)
  runStateT (x >>= ((+ 1) >> pure)) 2 ==> Identity (pair 1 2)
  runStateT empty 2 ==> Nothing :: Maybe (Pair Unit Int)
  runStateT (lift (pure 1)) 2 ==> Identity (pair 1 2)
  runStateT ((+ 1) <$> x) 2 ==> Identity (pair 1 2)
  runStateT (pure 1) 2 ==> Identity (pair 1 2)
  runStateT x 2 ==> Identity (pair 0 2)
