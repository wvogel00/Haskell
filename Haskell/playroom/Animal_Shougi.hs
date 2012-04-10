module Animal_Shougi where

import Data.IORef
import Data.Vector

data Animal = Lion | Elephant | Giraffe | Chick | Hen
                                         deriving (Eq,Show)
data Belong a = Mine a | Enemy a | Empty deriving Show
data Turn = MyTurn | YourTurn            deriving Eq

type Pos = (Int,Int)
type Board = [[Belong Animal]]

type GameInfo = (Board , Turn , [Belong Animal] , [Belong Animal])

height = 4
width =  3

maximum  =  100
_maximum = -100

point :: Animal -> Int
point Chick    = 1
point Elephant = 2
point Giraffe  = 3
point Hen      = 4
point Lion     = 20  --勝利

startBoard
 = [
    [   Mine Giraffe ,    Mine Lion ,  Mine Elephant ],
    [          Empty ,   Mine Chick ,          Empty ],
    [          Empty ,  Enemy Chick ,          Empty ],
    [ Enemy Elephant ,   Enemy Lion ,  Enemy Giraffe ]
   ]

lion
 = [(-1,-1) , (0,-1) , (1,-1),
    (-1, 0) ,          (1, 0),
    (-1, 1) , (0, 1) , (1, 1)
   ]

elephant
 = [(-1,-1)     ,      (1,-1),

    (-1, 1)     ,      (1, 1)
   ]

giraffe
 = [          (0,-1)         ,
    (-1,0)      ,      (1, 0),
              (0, 1)
   ]

chick
 = [          (0,-1)         ]        

hen
 = [(-1,-1) , (0,-1) , (1,-1),
    (-1, 0) ,          (1, 0),
              (0, 1)
   ]


