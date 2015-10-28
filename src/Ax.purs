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

instance equalOrdering :: Equal Ordering where
  equal x y = case x of
    LessThan -> case y of
      LessThan -> true
      _ -> false
    EqualTo -> case y of
      EqualTo -> true
      _ -> false
    GreaterThan -> case y of
      GreaterThan -> true
      _ -> false

foreign import jsEqualString :: String -> String -> Boolean
instance equalString :: Equal String where
  equal x y = jsEqualString x y

(==) :: forall a. (Equal a) => a -> a -> Boolean
(==) x y = equal x y
infix 4 ==

notEqual :: forall a. (Equal a) => a -> a -> Boolean
notEqual x y = not (equal x y)

(!=) :: forall a. (Equal a) => a -> a -> Boolean
(!=) x y = notEqual x y
infix 4 !=

class (Bounded a) <= BooleanAlgebra a where
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

instance booleanAlgebraFunction :: (BooleanAlgebra b) => BooleanAlgebra (a -> b) where
  and f g = \ x -> f x && g x
  or f g = \ x -> f x || g x
  not f = \ x -> not (f x)

(&&) :: forall a. (BooleanAlgebra a) => a -> a -> a
(&&) x y = and x y
infixr 3 &&

(||) :: forall a. (BooleanAlgebra a) => a -> a -> a
(||) x y = or x y
infixr 2 ||

data Ordering
  = LessThan
  | EqualTo
  | GreaterThan

class (Equal a) <= Compare a where
  compare :: a -> a -> Ordering

foreign import jsCompareArray :: forall a. (Compare a) => Ordering -> Ordering -> Ordering -> (a -> a -> Ordering) -> Array a -> Array a -> Ordering
instance compareArray :: (Compare a) => Compare (Array a) where
  compare x y = jsCompareArray LessThan EqualTo GreaterThan compare x y

instance compareBoolean :: Compare Boolean where
  compare x y = if x == y
    then EqualTo
    else case x of
      true -> GreaterThan
      false -> LessThan

foreign import jsCompareChar :: Ordering -> Ordering -> Ordering -> Char -> Char -> Ordering
instance compareChar :: Compare Char where
  compare x y = jsCompareChar LessThan EqualTo GreaterThan x y

foreign import jsCompareInt :: Ordering -> Ordering -> Ordering -> Int -> Int -> Ordering
instance compareInt :: Compare Int where
  compare x y = jsCompareInt LessThan EqualTo GreaterThan x y

foreign import jsCompareNumber :: Ordering -> Ordering -> Ordering -> Number -> Number -> Ordering
instance compareNumber :: Compare Number where
  compare x y = jsCompareNumber LessThan EqualTo GreaterThan x y

instance compareOrdering :: Compare Ordering where
  compare x y = case x of
    LessThan -> case y of
      LessThan -> EqualTo
      _ -> LessThan
    EqualTo -> case y of
      LessThan -> GreaterThan
      EqualTo -> EqualTo
      GreaterThan -> LessThan
    GreaterThan -> case y of
      GreaterThan -> EqualTo
      _ -> GreaterThan

foreign import jsCompareString :: Ordering -> Ordering -> Ordering -> String -> String -> Ordering
instance compareString :: Compare String where
  compare x y = jsCompareString LessThan EqualTo GreaterThan x y

(<) :: forall a. (Compare a) => a -> a -> Boolean
(<) x y = case compare x y of
  LessThan -> true
  _ -> false
infixl 4 <

(<=) :: forall a. (Compare a) => a -> a -> Boolean
(<=) x y = case compare x y of
  GreaterThan -> false
  _ -> true
infixl 4 <=

(>=) :: forall a. (Compare a) => a -> a -> Boolean
(>=) x y = case compare x y of
  LessThan -> false
  _ -> true
infixl 4 >=

(>) :: forall a. (Compare a) => a -> a -> Boolean
(>) x y = case compare x y of
  GreaterThan -> true
  _ -> false
infixl 4 >

class Bounded a where
  bottom :: a
  top :: a

instance boundedBoolean :: Bounded Boolean where
  bottom = false
  top = true

foreign import jsBottomChar :: Char
foreign import jsTopChar :: Char
instance boundedChar :: Bounded Char where
  bottom = jsBottomChar
  top = jsTopChar

instance boundedInt :: Bounded Int where
  bottom = -2147483648
  top = 2147483647

instance boundedFunction :: (Bounded b) => Bounded (a -> b) where
  bottom = \ _ -> bottom
  top = \ _ -> top

instance boundedOrdering :: Bounded Ordering where
  bottom = LessThan
  top = GreaterThan

class Show a where
  show :: a -> String

foreign import jsShowArray :: forall a. (Show a) => (a -> String) -> Array a -> String
instance showArray :: (Show a) => Show (Array a) where
  show x = jsShowArray show x

instance showBoolean :: Show Boolean where
  show x = case x of
    true -> "true"
    false -> "false"

foreign import jsShowChar :: Char -> String
instance showChar :: Show Char where
  show x = jsShowChar x

foreign import jsShowInt :: Int -> String
instance showInt :: Show Int where
  show x = jsShowInt x

foreign import jsShowNumber :: Number -> String
instance showNumber :: Show Number where
  show x = jsShowNumber x

foreign import jsShowString :: String -> String
instance showString :: Show String where
  show x = jsShowString x

instance showOrdering :: Show Ordering where
  show x = case x of
    LessThan -> "LessThan"
    EqualTo -> "EqualTo"
    GreaterThan -> "GreaterThan"
