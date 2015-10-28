module Ax where

class Compose f where
  compose :: forall a b c. f a b -> f b c -> f a c

instance composeFunction :: Compose Function where
  compose f g = \ x -> g (f x)

(>>) :: forall f a b c. (Compose f) => f a b -> f b c -> f a c
(>>) f g = compose f g
infixr 9 >>

(<<) :: forall f a b c. (Compose f) => f b c -> f a b -> f a c
(<<) g f = compose f g

class (Compose f) <= Identity f where
  identity :: forall a. f a a

instance identityFunction :: Identity Function where
  identity = \ x -> x

class Add a where
  add :: a -> a -> a

foreign import jsAddArray :: forall a. Array a -> Array a -> Array a
instance addArray :: Add (Array a) where
  add x y = jsAddArray x y

foreign import jsAddInt :: Int -> Int -> Int
instance addInt :: Add Int where
  add x y = jsAddInt x y

foreign import jsAddNumber :: Number -> Number -> Number
instance addNumber :: Add Number where
  add x y = jsAddNumber x y

foreign import jsAddString :: String -> String -> String
instance addString :: Add String where
  add x y = jsAddString x y

(+) :: forall a. (Add a) => a -> a -> a
(+) x y = add x y
infixl 6 +

class (Add a) <= Zero a where
  zero :: a

instance zeroArray :: Zero (Array a) where
  zero = []

instance zeroInt :: Zero Int where
  zero = 0

instance zeroNumber :: Zero Number where
  zero = 0.0

instance zeroString :: Zero String where
  zero = ""

class (Zero a) <= Subtract a where
  subtract :: a -> a -> a

foreign import jsSubtractInt :: Int -> Int -> Int
instance subtractInt :: Subtract Int where
  subtract x y = jsSubtractInt x y

foreign import jsSubtractNumber :: Number -> Number -> Number
instance subtractNumber :: Subtract Number where
  subtract x y = jsSubtractNumber x y

(-) :: forall a. (Subtract a) => a -> a -> a
(-) x y = subtract x y
infixl 6 -

negate :: forall a. (Subtract a) => a -> a
negate x = zero - x

class (Add a) <= Multiply a where
  multiply :: a -> a -> a

foreign import jsMultiplyInt :: Int -> Int -> Int
instance multiplyInt :: Multiply Int where
  multiply x y = jsMultiplyInt x y

foreign import jsMultiplyNumber :: Number -> Number -> Number
instance multiplyNumber :: Multiply Number where
  multiply x y = jsMultiplyNumber x y

(*) :: forall a. (Multiply a) => a -> a -> a
(*) x y = multiply x y
infixl 7 *

class (Multiply a) <= One a where
  one :: a

instance oneInt :: One Int where
  one = 1

instance oneNumber :: One Number where
  one = 1.0

class (Multiply a) <= Divide a where
  divide :: a -> a -> a
  modulo :: a -> a -> a

foreign import jsDivideInt :: Int -> Int -> Int
foreign import jsModuloInt :: Int -> Int -> Int
instance divideInt :: Divide Int where
  divide x y = jsDivideInt x y
  modulo x y = jsModuloInt x y

foreign import jsDivideNumber :: Number -> Number -> Number
instance divideNumber :: Divide Number where
  divide x y = jsDivideNumber x y
  modulo _ _ = 0.0

(/) :: forall a. (Divide a) => a -> a -> a
(/) x y = divide x y
infixl 7 /

(%) :: forall a. (Divide a) => a -> a -> a
(%) x y = modulo x y
infixl 7 %

class Equal a where
  equal :: a -> a -> Boolean

foreign import jsEqualArray :: forall a. (Equal a) => Array a -> Array a -> Boolean
instance equalArray :: (Equal a) => Equal (Array a) where
  equal x y = jsEqualArray x y

foreign import jsEqualBoolean :: Boolean -> Boolean -> Boolean
instance equalBoolean :: Equal Boolean where
  equal x y = jsEqualBoolean x y

foreign import jsEqualChar :: Char -> Char -> Boolean
instance equalChar :: Equal Char where
  equal x y = jsEqualChar x y

foreign import jsEqualInt :: Int -> Int -> Boolean
instance equalInt :: Equal Int where
  equal x y = jsEqualInt x y

foreign import jsEqualNumber :: Number -> Number -> Boolean
instance equalNumber :: Equal Number where
  equal x y = jsEqualNumber x y

foreign import jsEqualObject :: forall o. Object (| o) -> Object (| o) -> Boolean
instance equalObject :: Equal (Object (| o)) where
  equal x y = jsEqualObject x y

foreign import jsEqualString :: String -> String -> Boolean
instance equalString :: Equal String where
  equal x y = jsEqualString x y

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) x y = equal x y
infix 4 ==

class BooleanAlgebra a where
  and :: a -> a -> a
  or :: a -> a -> a
  not :: a -> a

instance booleanAlgebraBoolean :: BooleanAlgebra Boolean where
  and x y = case x of
    true -> y
    false -> false
  or x y = case x of
    true -> true
    false -> y
  not x = case x of
    true -> false
    false -> true

(&&) :: forall a. (BooleanAlgebra a) => a -> a -> a
(&&) x y = and x y
infixr 3 &&

(||) :: forall a. (BooleanAlgebra a) => a -> a -> a
(||) x y = or x y
infixr 2 ||
