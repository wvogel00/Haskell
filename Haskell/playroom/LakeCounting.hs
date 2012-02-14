import Data.IORef
import Control.Monad(filterM)
--filterM :: Monad m => (a->m Bool) -> [a] -> m [a]

type Pos = Int
type Counter = Int

n,m :: Pos
n = 10
m = 12

mapData :: [[Char]]
mapData
 = ["W........WW.",
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

visitedPos = []

--update :: Pos -> IORef [Pos]
update p = do
 r <- newIORef p
 return =<< writeIORef r (p:visitedPos)
 

search :: [Char] -> IO Counter
search xs =  (filterM (visit xs)) [0..n*m] >>= return

--訪問済みの場合は無視(false)
--未法文の場合のみ、処理を行う
visit :: [Char] -> Pos -> IO Bool
visit xs p
 = if any (==p) visitedPos
    then return False
    else do case length $ filter f (near8) of
             0 -> do update p
                     return True
             _ -> return True
  where
    f k = xs!!k =='W'

--座標の8近傍点を返す
near8 :: Pos -> [Pos]
near8 p = filter ((>=0) && (<n*m))
            [p-m-1,p-m,p-m+1,
             p - 1  ,  p + 1,
             p+m-1,p+m,p+m-1]

main :: IO()
main = print =<< search $ concat mapData
