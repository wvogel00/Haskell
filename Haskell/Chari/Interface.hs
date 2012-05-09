module Interface where

import Graphics.UI.GLUT

width = (800 :: GLfloat)
height =(600 :: GLfloat)

data NextGround = Flat Int | Up Int | Down Int | Cliff Int deriving Eq
type Pos = (GLfloat,GLfloat)
data GameState = Title | Play | End deriving Eq
data GameInfo = GameInfo {
 chariPos :: Pos,
 isJump   :: Bool,
 state    :: GameState,
 mileage  :: Int
 }
