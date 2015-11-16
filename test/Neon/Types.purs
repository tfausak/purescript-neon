module Test.Neon.Types where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))
import qualified Test.Neon.Types.HasAdd as HasAdd
import qualified Test.Neon.Types.HasAlternative as HasAlternative
import qualified Test.Neon.Types.HasAnd as HasAnd
import qualified Test.Neon.Types.HasApply as HasApply
import qualified Test.Neon.Types.HasBind as HasBind
import qualified Test.Neon.Types.HasBottom as HasBottom
import qualified Test.Neon.Types.HasCompare as HasCompare
import qualified Test.Neon.Types.HasCompose as HasCompose
import qualified Test.Neon.Types.HasDivide as HasDivide
import qualified Test.Neon.Types.HasEmpty as HasEmpty
import qualified Test.Neon.Types.HasEqual as HasEqual
import qualified Test.Neon.Types.HasFold as HasFold
import qualified Test.Neon.Types.HasIdentity as HasIdentity
import qualified Test.Neon.Types.HasLift as HasLift
import qualified Test.Neon.Types.HasLogBase as HasLogBase
import qualified Test.Neon.Types.HasMap as HasMap
import qualified Test.Neon.Types.HasMultiply as HasMultiply
import qualified Test.Neon.Types.HasNot as HasNot
import qualified Test.Neon.Types.HasOne as HasOne
import qualified Test.Neon.Types.HasOr as HasOr
import qualified Test.Neon.Types.HasPower as HasPower
import qualified Test.Neon.Types.HasPure as HasPure
import qualified Test.Neon.Types.HasRoot as HasRoot
import qualified Test.Neon.Types.HasShow as HasShow
import qualified Test.Neon.Types.HasState as HasState
import qualified Test.Neon.Types.HasSubtract as HasSubtract
import qualified Test.Neon.Types.HasTraverse as HasTraverse
import qualified Test.Neon.Types.HasTop as HasTop
import qualified Test.Neon.Types.HasZero as HasZero
import qualified Test.Neon.Types.IsEnumerable as IsEnumerable

main :: Test
main = do
  info "Neon.Types"
  HasAdd.main
  HasAlternative.main
  HasAnd.main
  HasApply.main
  HasBind.main
  HasBottom.main
  HasCompare.main
  HasCompose.main
  HasDivide.main
  HasEmpty.main
  HasEqual.main
  HasFold.main
  HasIdentity.main
  HasLift.main
  HasLogBase.main
  HasMap.main
  HasMultiply.main
  HasNot.main
  HasOne.main
  HasOr.main
  HasPower.main
  HasPure.main
  HasRoot.main
  HasShow.main
  HasState.main
  HasSubtract.main
  HasTraverse.main
  HasTop.main
  HasZero.main
  IsEnumerable.main
