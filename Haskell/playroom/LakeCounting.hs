import Data.List
import Control.Monad
import Data.IORef
import Data.Foldable(foldlM)

type Counter = Int
type Pos = (Int,Int)
type Visited = IORef [Pos]

n = 10
m = 12

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

--横方向にfoldlMで探索していくので、
--自身のまわりⅧ座標を全て見る必要はなく、near4posの4点だけ見れば良い
--訪問済み座標を管理することで、既に数え上げた湖の重複を防ぐ
value (x,y) = (field !! x) !! y

inField (x,y)
 = 0<=x && x<n && 0<=y && y<m

dfs :: Pos -> Visited -> IO ()
dfs p visitedRef = do
 modifyIORef visitedRef (p:) 
 visited <- readIORef visitedRef
 forM_ (near4pos p) $ \p' ->
  when (value p' == 'W' && all (/=p') visited) $
   do modifyIORef visitedRef (p':)
      dfs p' visitedRef

near4pos (x,y) = filter inField [          {-(x,y)-}( x ,y+1),
                                  (x+1,y-1),(x+1,y),(x+1,y+1)]

solve :: (Counter,Visited) -> Pos -> IO (Counter,Visited)
solve (c,visitedRef) p = do
 visited <- readIORef visitedRef
 --未訪問且つ、池である場合
 if value p == 'W' && all (/=p) visited
  then do
        dfs p visitedRef
        return (c+1,visitedRef)
  else do
        visitedRef' <- newIORef $ p:visited
        return ( c ,visitedRef')

main = do
 visitedRef <- newIORef []
 (c,_) <- foldlM solve (0,visitedRef)
                 [(x,y) | x <- [0..n-1] , y <- [0..m-1]]
 print c
