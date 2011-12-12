import Data.Array

type ArrayI = Array Int Int
type ArrayII = Array Int ArrayI
makeData :: String -> (Int,Int)
makeData = (\[a,b] -> (a,b)).map read.take 2.words

makeArray :: (Int,Int) -> IO ArrayII
makeArray (h,w) = do cs <- getContents
                     let xs = take h $ lines cs
                     return $ array (1,h) $ zip [1..h]$ map (makeArray' w) xs

makeArray' :: Int -> String -> ArrayI
makeArray' w str = array (1,w) $ zip [1..w] $ map f str
  where
    f c = read [c]

--配列からindex(h',w')の要素を見る
seeValue :: Int -> Int -> ArrayII -> Int
seeValue h' w' mapData = (mapData ! h') ! w'

main = do hw <- getLine
          mapData <- makeArray.makeData $ hw
          print mapData
          print $ seeValue 2 3 mapData
