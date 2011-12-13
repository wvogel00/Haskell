import Data.Array

type ArrayI = Array Int Int
type ArrayII = Array Int ArrayI

--二次元配列上の座標
type Pos = (Int,Int)
--二次元配列の大きさと、二次元配列自身のタプル
type Data = (Pos,ArrayII)
--ある座標での値と、その座標
type Elem = (Int,Pos)

data Tree a = Branch a (Tree a) (Tree a) | Leaf a
					deriving (Show,Ord,Eq)

makeRange :: String -> (Int,Int)
makeRange = (\[a,b] -> (a,b)).map read.take 2.words

makeArray :: (Int,Int) -> IO (Pos,ArrayII)
makeArray (h,w) = do cs <- getContents
                     let xs = take h $ lines cs
                     return ((h,w),array (1,h) $ zip [1..h]$ map (makeArray' w) xs)

makeArray' :: Int -> String -> ArrayI
makeArray' w str = array (1,w) $ zip [1..w] $ map f str
  where
    f c = read [c]

--配列からindex(h',w')の要素を見る
seeValue :: Int -> Int -> ArrayII -> Int
seeValue h' w' mapData = (mapData ! h') ! w'

makeTree :: Data -> Pos -> Tree Elem
makeTree d@((h,w),mapData) p@(h',w') 
 | p == (h,w) = Leaf (seeValue h w mapData,p)
 | h' > h = Leaf (9*h*w,p)
 | w' > w = Leaf (9*h*w,p)
 | otherwise = Branch (seeValue h' w' mapData,p)
                          (makeTree d (h'+1,w'))
                          (makeTree d (h',w'+1))

leafList :: Int -> Tree Elem -> [Int]
leafList n (Leaf v)= [fst v + n]
leafList n (Branch v t1 t2)
  = leafList (n+fst v) t1 ++ leafList (n+fst v) t2

answer :: Data -> Int
answer d@((h,w) ,mapData)
 = foldl min (9*h*w) . leafList 0 $ makeTree d (1,1)

main = do hw <- getLine
          d <- makeArray.makeRange $ hw
          print $ answer d
