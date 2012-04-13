module Plus1 where

foo :: Int ->IO Int
foo x =
 let y = x^2 + 2
 in return y
