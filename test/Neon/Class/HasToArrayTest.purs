module Test.Neon.Class.HasToArrayTest where

import Data.Maybe as Maybe
import Data.String as String
import Neon as Neon
import Test.Helper (Suite, bind, quickCheck, test, (===))

suite :: Suite
suite = test "HasToArray" do
  test "Maybe" do
    quickCheck \ (mx :: Neon.Maybe Int) ->
      Neon.toArray mx === Maybe.maybe [] (\ x -> [x]) mx
  test "String" do
    quickCheck \ (x :: String) ->
      Neon.toArray x === String.toCharArray x
