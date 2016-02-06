module Test.Main where

import Neon
import Test.NeonSpec as Neon
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (Process, run)

main :: Eff (console :: CONSOLE, process :: Process, random :: RANDOM) Unit
main = run [consoleReporter] Neon.spec
