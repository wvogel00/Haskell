module WelshPowell where

import Data.Graph.Inductive
import Data.Graph.Inductive.Graphviz

type Color = Maybe Int

chkList = zip [1..6] $ repeat Nothing

edge :: [LEdge ()]
edge = [(0,5,()), (5,0,()), (5,1,()), (1,5,()),
        (5,2,()), (2,5,()), (4,5,()), (5,4,()),
        (4,3,()), (3,4,()), (0,1,()), (1,0,()),
        (1,2,()), (2,1,()), (2,4,()), (4,2,())
       ]

node = zip [1..6] $ repeat (Just 1) :: [LNode Color]

gragh = mkGraph node edge :: Gr Color ()
