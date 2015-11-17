module Test.Neon.Values.Regex where

import Neon
import Test.Core (Test(), (==>))

main :: Test
main = do
  info "Neon.Values.Regex"
  regex "a" regexFlags != regex "b" regexFlags ==> true
  regex "." regexFlags ==> regex "." regexFlags
  show (regex "." regexFlags) ==> "regex \".\" { ignoreCase: false, global: false, multiline: false }"
  show (regex "." { ignoreCase: true, global: true, multiline: true }) ==> "regex \".\" { ignoreCase: true, global: true, multiline: true }"
  test "a" (regex "a" regexFlags) ==> true
  test "b" (regex "a" regexFlags) ==> false
