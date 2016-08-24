module Neon (module Export, module Neon) where

import Control.Applicative (pure) as Export
import Control.Bind (bind) as Export
import Control.Monad.Eff (Pure) as Export
import Control.Semigroupoid (class Semigroupoid, compose) as Export
import Data.Eq (class Eq, eq, notEq) as Export
import Data.EuclideanRing (class EuclideanRing, div, mod) as Export
import Data.HeytingAlgebra (class HeytingAlgebra, conj, disj) as Export
import Data.Ord (class Ord, greaterThan, greaterThanOrEq, lessThan, lessThanOrEq) as Export
import Data.Ring (class Ring, negate, sub) as Export
import Data.Semigroup (class Semigroup, append) as Export
import Data.Semiring (class Semiring, add, mul) as Export
import Data.Unit (Unit, unit) as Export
import Math (pow) as Export

import Control.Semigroupoid as Semigroupoid
import Data.Eq as Eq
import Data.EuclideanRing as EuclideanRing
import Data.Function as Function
import Data.HeytingAlgebra as HeytingAlgebra
import Data.Ord as Ord
import Data.Ring as Ring
import Data.Semigroup as Semigroup
import Data.Semiring as Semiring
import Math as Math

infixl 9 Semigroupoid.composeFlipped as >>
infixr 9 Semigroupoid.compose        as <<
infixr 8 Math.pow                    as ^
infixl 7 Semiring.mul                as *
infixl 7 EuclideanRing.div           as /
infixl 7 EuclideanRing.mod           as %
infixl 6 Semiring.add                as +
infixl 6 Ring.sub                    as -
infixr 5 Semigroup.append            as ++
infix  4 Eq.eq                       as ==
infix  4 Eq.notEq                    as !=
infix  4 Ord.greaterThan             as >
infix  4 Ord.greaterThanOrEq         as >=
infix  4 Ord.lessThan                as <
infix  4 Ord.lessThanOrEq            as <=
infixr 3 HeytingAlgebra.conj         as &&
infixr 2 HeytingAlgebra.disj         as ||
infixl 1 Function.applyFlipped       as |>
infixr 1 Function.apply              as <|
