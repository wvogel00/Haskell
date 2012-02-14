import Control.Monad.State

type Pos = Int
type Counter = Int
type NotVisited = [Pos]
type VisitState = ((Pos,NotVisited),Counter)

n = 10
m = 12

mapData :: [Char]
mapData
 = concat ["W........WW.",
           ".WWW.....WWW",
           "....WW...WW.",
           ".........WW.",
           ".........W..",
           "..W......W..",
           ".W.W.....WW.",
           "W.W.W.....W.",
           ".W.W......W.",
           "..W.......W."
          ]

search :: [Char] -> State VisitState Counter
search [] = do
 (_,counter) <- get
 return counter
search (x:xs) = do
 ((p,visited),counter) <- get
 case x of
  '.' -> put ((p+1,p:visited),counter)
  'W' -> 

 search xs

--既に探索済みの座標は調べる必要がないので、4点のみ調べれば良い
nearPos :: Pos -> [Pos]
nearPos p = filter (<n*m) [p + 1,p+m-1,p+m,p+m+1]

start :: VisitState
start = ((0,0),0)

main :: IO()
main = evalState (search [0..m*n]) start
