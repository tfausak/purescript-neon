module Test.Neon.HelperTest where

import Neon as Neon
import Prelude as Prelude
import Test.Core (Tests, quickCheck, test, (===))

tests :: Tests
tests = test "Helper" do
  test "asTypeOf" do
    quickCheck \ (x :: Int) y ->
      Neon.asTypeOf x y === Prelude.asTypeOf y x
