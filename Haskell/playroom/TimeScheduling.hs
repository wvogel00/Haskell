module TimeScheduling where

import Data.List

s = [1,2,4,6,8] -- 仕事の開始時刻
t = [3,5,7,9,10]--仕事の終了時刻

dataList :: [(Int,Int)]
dataList = zip t s

answer ls = let (a:bs) = sort ls
            in  foldl f (1,a) bs
 where
  f (n,work) work' = case snd work' > fst work of
     True -> (n+1,work') 
     False-> (n,work)
