module Neon (module Export, module Neon) where

import Control.Applicative (class Applicative, pure, unless, when) as Export
import Control.Apply (class Apply, apply) as Export
import Control.Bind (class Bind, bind, join) as Export
import Control.Category (class Category, id) as Export
import Control.Monad (class Monad) as Export
import Control.Monad.Eff (Eff, Pure, runPure) as Export
import Control.Monad.Eff.Class (class MonadEff, liftEff) as Export
import Control.Monad.Eff.Console (CONSOLE, log) as Export
import Control.Monad.Eff.Unsafe (unsafeInterleaveEff, unsafePerformEff) as Export
import Control.Semigroupoid (class Semigroupoid, compose) as Export
import Data.BooleanAlgebra (class BooleanAlgebra) as Export
import Data.Bounded (class Bounded, bottom, top) as Export
import Data.CommutativeRing (class CommutativeRing) as Export
import Data.Eq (class Eq, eq, notEq) as Export
import Data.EuclideanRing (class EuclideanRing, div, mod) as Export
import Data.Field (class Field) as Export
import Data.Function (const, flip, on) as Export
import Data.Functor (class Functor, map, void) as Export
import Data.HeytingAlgebra (class HeytingAlgebra, conj, disj, not) as Export
import Data.Ord (class Ord, abs, between, clamp, compare, comparing, greaterThan, greaterThanOrEq, lessThan, lessThanOrEq, max, min, signum) as Export
import Data.Ordering (Ordering(EQ, GT, LT)) as Export
import Data.Ring (class Ring, negate, sub) as Export
import Data.Semigroup (class Semigroup, append) as Export
import Data.Semiring (class Semiring, add, mul, one, zero) as Export
import Data.Show (class Show, show) as Export
import Data.Unit (Unit, unit) as Export
import Data.Void (Void, absurd) as Export
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
