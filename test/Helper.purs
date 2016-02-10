module Test.Helper
  ( module Test.Helper
  , module Export
  ) where

import Prelude (bind) as Export
import Test.QuickCheck ((===)) as Export
import Test.Unit (runTest, test) as Export
import Test.Unit.Assert (assert) as Export
import Test.Unit.QuickCheck (quickCheck) as Export

import Control.Monad.Aff (Aff)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Random (RANDOM)
import Prelude (Unit, bind)
import Test.QuickCheck ((===))
import Test.Unit (TIMER, runTest, test)
import Test.Unit.Assert (assert)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.QuickCheck (quickCheck)

type Test a = a
  ( avar :: AVAR
  , random :: RANDOM
  , testOutput :: TESTOUTPUT
  , timer :: TIMER
  ) Unit

type Main = Test Eff

type Suite = Test Aff
