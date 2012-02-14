import Control.Monad
import Data.IORef
import Data.Foldable(foldlM)

type Counter = Int
type Pos = (Int,Int)
type Visited = [Pos]

(n,m) = (10,12)

field = ["W........WW."
        ,".WWW.....WWW"
        ,"....WW...WW."
        ,".........WW."
        ,".........W.."
        ,"..W......W.."
        ,".W.W.....WW."
        ,"W.W.W.....W."
        ,".W.W......W."
        ,"..W.......W."
        ]

value (x,y) = (field !! x) !! y

inField (x,y)
 = 0<=x && x<n && 0<=y && y<m

dfs :: Pos -> IORef Visited -> IO ()
dfs p visitedRef = do
 modifyIORef visitedRef (p:)
 forM_ (near4pos p) $ \p' ->
  when (value p' == 'W') $ dfs p' visitedRef

near4pos (x,y) = filter inField [          {-(x,y)-}( x ,y+1),
                                  (x+1,y-1),(x+1,y),(x+1,y+1)]

solve (c,visitedRef) p = do
 visited <- readIORef visitedRef
 if value p == 'W' && all (/=p) visited --未訪問且つ池
  then dfs p visitedRef
       >> return (c+1,visitedRef)
  else newIORef (p:visited)
        >>= \vRef -> return (c,vRef)

main = do
 visitedRef <- newIORef []
 print.fst =<< foldlM solve (0,visitedRef)
                 [(x,y)| x<-[0..n-1] , y<-[0..m-1] ]
