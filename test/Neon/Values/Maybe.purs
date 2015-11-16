module Test.Neon.Values.Maybe where

import Neon
import Neon.Values -- TODO: #45
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Maybe"
  Just 1 + Just 2 ==> Just 3
  Nothing <|> Just 1 ==> Just 1
  Just true && Just true ==> Just true
  Just (+ 1) <*> Just 1 ==> Just 2
  bind (Just 1) (\x -> pure (x + 1)) ==> Just 2
  bottom ==> Nothing :: Maybe Unit
  compare (Just 1) (Just 2) ==> LessThan
  Just 5 / Just 2 ==> Just 2
  Just 5 % Just 2 ==> Just 1
  empty ==> Nothing :: Maybe Unit
  Just 1 == Just 1 ==> true
  foldl (+) 1 (Just 2) ==> 3
  foldr (+) 1 Nothing ==> 1
  map (+ 1) (Just 1) ==> Just 2
  Just 2 * Just 3 ==> Just 6
  not (Just true) ==> Just false
  one ==> Just 1
  Just false || Just true ==> Just true
  pure 1 ==> Just 1
  show (Just 1) ==> "Just (1)"
  Just 2 - Just 1 ==> Just 1
  top ==> Just unit
  zero ==> Just unit
  maybe "?" identity Nothing ==> "?"
  maybe "?" identity (Just "something") ==> "something"
  isJust (Nothing :: Maybe Unit) ==> false
  isJust (Just unit :: Maybe Unit) ==> true
  isNothing (Nothing :: Maybe Unit) ==> true
  isNothing (Just unit :: Maybe Unit) ==> false
  withDefault 1 Nothing ==> 1
  withDefault 1 (Just 2) ==> 2
