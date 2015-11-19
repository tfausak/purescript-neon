module Neon.Values.Either
  ( Either(Left, Right)
  , either
  , fromEither
  , isLeft
  , isRight
  , toEither
  ) where

import Neon.Primitives.Function (always)
import Neon.Types.HasAdd (HasAdd, add, (+))
import Neon.Types.HasAlternative (HasAlternative)
import Neon.Types.HasAnd (HasAnd, and)
import Neon.Types.HasApply (HasApply, (<*>))
import Neon.Types.HasBind (HasBind)
import Neon.Types.HasBottom (HasBottom, bottom)
import Neon.Types.HasCompare (HasCompare, compare)
import Neon.Types.HasDivide (HasDivide, divide, modulo)
import Neon.Types.HasEmpty (HasEmpty, empty)
import Neon.Types.HasEqual (HasEqual, (==))
import Neon.Types.HasFold (HasFold)
import Neon.Types.HasMap (HasMap, (<$>))
import Neon.Types.HasMultiply (HasMultiply, multiply)
import Neon.Types.HasNot (HasNot, not)
import Neon.Types.HasOne (HasOne, one)
import Neon.Types.HasOr (HasOr, or)
import Neon.Types.HasPure (HasPure, pure)
import Neon.Types.HasShow (HasShow, show)
import Neon.Types.HasSubtract (HasSubtract, subtract)
import Neon.Types.HasTop (HasTop, top)
import Neon.Types.HasZero (HasZero, zero)
import Neon.Values.Maybe (Maybe(), maybe)
import Neon.Values.Ordering (Ordering(LessThan, GreaterThan))

-- | Represents a choice between two values. `Either` is conventially used for
-- | error handling where `Left` represents failure and `Right` represents
-- | success.
data Either a b
  = Left a
  | Right b

instance eitherHasAdd :: (HasAdd b) => HasAdd (Either a b) where
  add x y = add <$> x <*> y

instance eitherHasAlternative :: HasAlternative (Either a) where
  alternative (Left _) y = y
  alternative x _ = x

instance eitherHasAnd :: (HasBottom a, HasTop a, HasAnd b) => HasAnd (Either a b) where
  and x y = and <$> x <*> y

instance eitherHasApply :: HasApply (Either a) where
  apply (Right f) x = f <$> x
  apply (Left x) _ = Left x

instance eitherHasBind :: HasBind (Either a) where
  bind (Left x) _ = Left x
  bind (Right x) f = f x

instance eitherHasBottom :: (HasBottom a, HasBottom b) => HasBottom (Either a b) where
  bottom = Left bottom

instance eitherHasCompare :: (HasCompare a, HasCompare b) => HasCompare (Either a b) where
  compare (Left x) (Left y) = compare x y
  compare (Right x) (Right y) = compare x y
  compare (Left _) _ = LessThan
  compare _ (Left _) = GreaterThan

instance eitherHasDivide :: (HasDivide b) => HasDivide (Either a b) where
  divide x y = divide <$> x <*> y
  modulo x y = modulo <$> x <*> y

instance eitherHasEqual :: (HasEqual a, HasEqual b) => HasEqual (Either a b) where
  equal (Left x) (Left y) = x == y
  equal (Right x) (Right y) = x == y
  equal _ _ = false

instance eitherHasFold :: HasFold (Either a) where
  foldl f y x = case x of
    Right r -> f y r
    Left _ -> y
  foldr f y x = case x of
    Right r -> f r y
    Left _ -> y

instance eitherHasMap :: HasMap (Either a) where
  map f (Right x) = Right (f x)
  map _ (Left x) = Left x

instance eitherHasMultiply :: (HasMultiply b) => HasMultiply (Either a b) where
  multiply x y = multiply <$> x <*> y

instance eitherHasNot :: (HasBottom a, HasTop a, HasNot b) => HasNot (Either a b) where
  not x = not <$> x

instance eitherHasOne :: (HasOne b) => HasOne (Either a b) where
  one = Right one

instance eitherHasOr :: (HasBottom a, HasTop a, HasOr b) => HasOr (Either a b) where
  or x y = or <$> x <*> y

instance eitherHasPure :: HasPure (Either a) where
  pure x = Right x

instance eitherHasShow :: (HasShow a, HasShow b) => HasShow (Either a b) where
  show (Left x) = "Left (" + show x + ")"
  show (Right x) = "Right (" + show x + ")"

instance eitherHasSubtract :: (HasSubtract b) => HasSubtract (Either a b) where
  subtract x y = subtract <$> x <*> y

instance eitherHasTop :: (HasTop a, HasTop b) => HasTop (Either a b) where
  top = Right top

instance eitherHasZero :: (HasZero b) => HasZero (Either a b) where
  zero = Right zero

-- | Applies the first function to `Left` values and the second function to
-- | `Right` values.
-- |
-- | ``` purescript
-- | either (+ 2) (* 2) (Left 3)
-- | -- Left 5
-- | either (+ 2) (* 2) (Right 3)
-- | -- Right 6
-- | ```
either :: forall a b c. (a -> c) -> (b -> c) -> Either a b -> c
either f g e = case e of
  Left l -> f l
  Right r -> g r

-- | Returns `true` if the `Either` is a `Left` value. Returns `false`
-- | otherwise.
-- |
-- | ``` purescript
-- | isLeft (Left unit)
-- | -- true
-- | isLeft (Right unit)
-- | -- false
-- | ```
isLeft :: forall a b. Either a b -> Boolean
isLeft e = case e of
  Left _ -> true
  _ -> false

-- | Returns `true` if the `Either` is a `Right` value. Returns `false`
-- | otherwise.
-- |
-- | ``` purescript
-- | isRight (Right unit)
-- | -- true
-- | isRight (Left unit)
-- | -- false
-- | ```
isRight :: forall a b. Either a b -> Boolean
isRight e = not (isLeft e)

-- | Converts an `Either` into a `Maybe`.
-- |
-- | ``` purescript
-- | fromEither (Left unit)
-- | -- Nothing
-- | fromEither (Right unit)
-- | -- Just unit
-- | ```
fromEither :: forall a b m. (HasEmpty m, HasPure m) => Either a b -> m b
fromEither e = either (always empty) pure e

-- | Converts a `Maybe` into an `Either`.
-- |
-- | ``` purescript
-- | toEither unit Nothing
-- | -- Left unit
-- | toEither unit (Just true)
-- | -- Right true
-- | ```
toEither :: forall a b. a -> Maybe b -> Either a b
toEither x m = maybe (Left x) Right m
