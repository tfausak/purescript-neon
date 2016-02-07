module Test.Core
  ( module M
  , module Test.Core
  ) where

import Prelude (bind) as M
import Test.QuickCheck ((===)) as M
import Test.Unit (runTest, test) as M
import Test.Unit.Assert (assert) as M
import Test.Unit.QuickCheck (quickCheck) as M

import Control.Monad.Aff (Aff)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Random (RANDOM)
import Prelude (Unit)
import Test.Unit (TIMER)
import Test.Unit.Console (TESTOUTPUT)

type Main = Eff
  ( avar :: AVAR
  , random :: RANDOM
  , testOutput :: TESTOUTPUT
  , timer :: TIMER
  ) Unit

type Tests = Aff
  ( avar :: AVAR
  , random :: RANDOM
  , testOutput :: TESTOUTPUT
  , timer :: TIMER
  ) Unit
