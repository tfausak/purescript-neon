module Test.Neon.Types.IsEnumerable where

import Neon
import Neon.Values -- NOTE: purescript/purescript#1594
import Test.Core (Test(), (==>))

testIsEnumerable :: Test
testIsEnumerable = do
  info "Neon.Types.IsEnumerable"

  fromEnum false ==> 0
  toEnum 1 ==> Just true
  succ false ==> Just true
  pred false ==> Nothing

  fromEnum 'A' ==> 65
  toEnum 65 ==> Just 'A'
  toEnum 999999999 ==> Nothing :: Maybe Char
  succ 'A' ==> Just 'B'
  pred 'B' ==> Just 'A'

  fromEnum 2 ==> 2
  toEnum 2 ==> Just 2
  succ 2 ==> Just 3
  pred 2 ==> Just 1

  fromEnum (Nothing :: Maybe Boolean) ==> 0
  fromEnum (Just true) ==> 2
  toEnum 0 ==> Just (Nothing :: Maybe Boolean)
  toEnum 1 ==> Just (Just false)
  succ Nothing ==> Just (Nothing :: Maybe Boolean)
  succ (Just false) ==> Just (Just true)
  succ (Just true) ==> Nothing
  pred Nothing ==> Nothing :: Maybe (Maybe Boolean)
  pred (Just false) ==> Just Nothing
  pred (Just true) ==> Just (Just false)

  fromEnum unit ==> 0
  toEnum 0 ==> Just unit
  succ unit ==> Nothing
  pred unit ==> Nothing
