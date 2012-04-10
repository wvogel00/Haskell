module ArrowTest where

import Control.Arrow

data Tree a = Leaf a | Branch a [Tree a] deriving (Eq,Ord,Show)

addOdd = filter odd >>> sum

maxValue = 100

minNode :: Tree Int -> Int
minNode = takeNodes >>> map takeValue >>> foldl min maxValue

maxNode :: Tree Int -> Int
maxNode = takeNodes >>> map takeValue >>> foldl max 0

takeNodes (Leaf v) = [Leaf v]
takeNodes (Branch _ ts) = ts

takeValue (Leaf v) = v
takeValue (Branch v _) = v
