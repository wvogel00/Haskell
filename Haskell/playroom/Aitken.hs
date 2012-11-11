module Aitken where

a n = foldl (+) 0.take n $ map term [0..n]
term k = (-1)^k/(2*fromIntegral k+1) 

ans n = (n,a n)

lambda n = (a (n+2) - a (n+1)) / (a (n+1) - a n)

limA n = a n - (a (n+1) - a n)^2/(a (n+2)-2*a (n+1)+a n)
