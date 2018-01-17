module Test.Helper
  ( module Test.Helper
  , module Export
  ) where

import Control.Bind (discard) as Export
import Control.Monad.Aff (Aff) as Export
import Control.Monad.Eff.Random (RANDOM) as Export
import Test.QuickCheck ((===)) as Export
import Test.QuickCheck.Arbitrary (class Arbitrary) as Export
import Test.Unit (TestSuite, Test, test, testSkip, suite, success) as Export
import Test.Unit.Main (runTest) as Export
import Test.Unit.Assert (assert) as Export
import Test.Unit.QuickCheck (quickCheck) as Export

import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Random (RANDOM)
import Data.Unit (Unit)
import Test.Unit (TestSuite)
import Test.Unit.Console (TESTOUTPUT)

type Main = forall t. Eff
  ( avar :: AVAR
  , console :: CONSOLE
  , random :: RANDOM
  , testOutput :: TESTOUTPUT | t)
  Unit

type Suite = forall t. TestSuite (random :: RANDOM | t)
