module Test.Internal where

import Control.Monad.Aff (..) as Aff
import Neon (..) as Neon
import Prelude (..) as Prelude
import Test.Spec (..) as Spec
import Test.Spec.Runner (..) as Runner
import Test.Spec.Assertions (..) as Assertions

type Spec = Spec.Spec (console :: Neon.CONSOLE, process :: Runner.Process) Neon.Unit

_shouldEqual :: forall a b. (Prelude.Eq a, Prelude.Show a) => a -> a -> Aff.Aff b Neon.Unit
_shouldEqual = Assertions.shouldEqual

infix 0 _shouldEqual as ?=
