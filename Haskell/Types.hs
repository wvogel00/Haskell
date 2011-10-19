module Types where

data GameState = Title | Playing | Save | Load | Exit
data Music = PlayOn String | Silence  deriving (Show,Eq)

type Layer = Int
type ImageFile = String
type Image = (Layer , ImageFile)
type ScreenState = [ Image ]
type Date = String
type FLine = Int

datafile :: FilePath
datafile = "d.txt"