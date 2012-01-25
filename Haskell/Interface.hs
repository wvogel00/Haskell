module Interface where

import Graphics.UI.GLUT

data GameState = Title | Playing | Save | Load | Exit

data Order =  Sound Music
            | Message String
            | Image Int Int LayerNum ImageFile
            | Wait Int
            | ParseError
                     deriving (Show,Eq)

data Music = PlayOn String | Silence  deriving (Show,Eq)

type LayerNum = Int
type ImageFile = String
type Image = (Layer , ImageFile)
type ScreenState = [ Image ]
type Date = String
type FLine = Int

type Pos = (GLfloat,GLfloat)	--座標

datafile :: FilePath
datafile = "d.txt"

width = 800.0
height= 600.0
