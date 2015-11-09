module Test.Core where

import Neon

type Test = Effect (exception :: EXCEPTION, console :: CONSOLE) Unit

(==>) :: forall a. (HasEqual a, HasShow a) => a -> a -> Test
(==>) x y = if x == y
  then do
    info ("✔︎ " + show x + " = " + show y)
  else do
    error ("✘ " + show x + " ≠ " + show y)
    throw (exception "test failed")
infix 0 ==>
