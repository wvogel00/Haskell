{-# Language TemplateHaskell,QuasiQuotes, FlexibleContexts #-}

import Text.Peggy

[peggy|
top :: Double = expr !.

expr ::Double
 =expr "+" fact { $1 + $2 }
 /expr "-" fact { $1 - $2 }
 /fact

fact ::Double
 =fact "*" beki { $1 * $2 }
 /fact "/" beki { $1 / $2 }
 /beki

beki ::Double
 = beki "^" term { $1 ^^ (floor $2) }
 / term

term ::Double
 = "(" expr ")"
 /number

number :::Double
 = [1-9] [0-9]* {read ($1:$2)}
|]

main = print.parseString top "stdin" =<< getLine
