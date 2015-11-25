module Neon.Values.Nullable
  ( Nullable()
  , fromNullable
  , toNullable
  ) where

import Neon.Types.HasEmpty
import Neon.Types.HasEqual
import Neon.Types.HasShow
import Neon.Types.HasPure
import Neon.Values.Maybe

-- | Represents values that can be null. This is different than `Maybe` because
-- | it has no runtime overhead.
foreign import data Nullable :: * -> *

foreign import null :: forall a. Nullable a

foreign import notNull :: forall a. a -> Nullable a

-- | Converts a `Nullable` value into some other container. Typically this is
-- | `Maybe`.
-- |
-- | ``` purescript
-- | fromNullable (toNullable (Just unit))
-- | -- Just unit
-- | ```
foreign import fromNullable :: forall m a. (HasEmpty m, HasPure m) => Nullable a -> m a

instance nullableHasEqual :: (HasEqual a) => HasEqual (Nullable a) where
  equal x y = toMaybe x == toMaybe y

-- NOTE: This instance wouldn't be law abiding if the HasShow type class had
-- any laws. But there's no way to render the type of a value.
instance nullableHasShow :: (HasShow a) => HasShow (Nullable a) where
  show x = maybe "null" show (fromNullable x)

-- | Converts a `Maybe` value into a `Nullable` value.
-- |
-- | ``` purescript
-- | show (toNullable (Just unit))
-- | -- "unit"
-- | ```
toNullable :: forall a. Maybe a -> Nullable a
toNullable x = maybe null notNull x

toMaybe :: forall a. Nullable a -> Maybe a
toMaybe = fromNullable
