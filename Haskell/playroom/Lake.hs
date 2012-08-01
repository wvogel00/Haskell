module Lake where

import Control.Monad
import Data.Vector
import Data.IORef
import Data.Maybe

n = 10
m = 12

initField = ["W........WW."
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
fieldRef = newIORef $ (fromList . Prelude.map fromList) initField

dfs (x, y) = do
  fieldRef' <- fieldRef
  field <- readIORef fieldRef'
  yv <- indexM field x
  let field' = field // [(x, yv // [(y, '.')])]
---------
--  Data.Vector.forM_ field' print
--  print ""
---------
  writeIORef fieldRef' field'
  
  Control.Monad.forM_ [-1..1] $ \dx ->
    Control.Monad.forM_ [-1..1] $ \dy -> do
      let nx = x + dx
      let ny = y + dy
      let fxy = fromMaybe '.' (field' !? nx >>= (!? ny))

      when (0 <= nx &&
            nx < n &&
            0 <= ny &&
            ny < m &&
            fxy == 'W')
            (dfs (nx, ny))

solve = do
  res <- newIORef 0

  Control.Monad.forM_ [0..(n-1)] $ \i ->
    Control.Monad.forM_ [0..(m-1)] $ \j -> do
      fieldRef' <- fieldRef
      field <- readIORef fieldRef'
      fij <- ((`indexM` i) >=> (`indexM` j)) field

      when (fij == 'W') $ do
        dfs (i, j)
        modifyIORef res (+1)
        print =<< readIORef res

  print =<< readIORef res
