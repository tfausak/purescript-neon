module Test.Neon.Types where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))
import Test.Neon.Types.HasAdd (testHasAdd)
import Test.Neon.Types.HasAlternative (testHasAlternative)
import Test.Neon.Types.HasAnd (testHasAnd)
import Test.Neon.Types.HasApply (testHasApply)
import Test.Neon.Types.HasBind (testHasBind)
import Test.Neon.Types.HasBottom (testHasBottom)
import Test.Neon.Types.HasCompare (testHasCompare)
import Test.Neon.Types.HasCompose (testHasCompose)
import Test.Neon.Types.HasDivide (testHasDivide)
import Test.Neon.Types.HasEmpty (testHasEmpty)
import Test.Neon.Types.HasEqual (testHasEqual)
import Test.Neon.Types.HasFold (testHasFold)
import Test.Neon.Types.HasIdentity (testHasIdentity)
import Test.Neon.Types.HasLift (testHasLift)
import Test.Neon.Types.HasMap (testHasMap)
import Test.Neon.Types.HasMultiply (testHasMultiply)
import Test.Neon.Types.HasNot (testHasNot)
import Test.Neon.Types.HasOne (testHasOne)
import Test.Neon.Types.HasOr (testHasOr)
import Test.Neon.Types.HasPower (testHasPower)
import Test.Neon.Types.HasPure (testHasPure)
import Test.Neon.Types.HasShow (testHasShow)
import Test.Neon.Types.HasState (testHasState)
import Test.Neon.Types.HasSubtract (testHasSubtract)
import Test.Neon.Types.HasTop (testHasTop)
import Test.Neon.Types.HasZero (testHasZero)
import Test.Neon.Types.IsEnumerable (testIsEnumerable)

testTypes :: Test
testTypes = do
  info "Neon.Types"
  testHasAdd
  testHasAlternative
  testHasAnd
  testHasApply
  testHasBind
  testHasBottom
  testHasCompare
  testHasCompose
  testHasDivide
  testHasEmpty
  testHasEqual
  testHasFold
  testHasIdentity
  testHasLift
  testHasMap
  testHasMultiply
  testHasNot
  testHasOne
  testHasOr
  testHasPower
  testHasPure
  testHasShow
  testHasState
  testHasSubtract
  testHasTop
  testHasZero
  testIsEnumerable
