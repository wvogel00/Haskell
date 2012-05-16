import Graphics.Gloss
import System.Random

type Velocity = Int
data Info = Info {
	chariPos :: (Int,Int),
	ground :: [Int],
	jumpingMode :: (Int,Velocity)
	} deriving (Eq,Ord)

(width,height) = (600,400) :: (Int,Int)
(widthF,heightF) = (fromIntegral width,fromIntegral height)

mkRandList :: Int -> [Int]
mkRandList = randomRs (floor $ -heightF/2,floor $heightF*0.2).mkStdGen

mkGround :: [Int] -> [Int]
mkGround = addNoise.concat.map switch
 where
  addNoise = map (\x -> x + mod x 4)
  switch x | mod x 60 == 0 = criff x
           | mod x  5 == 0 = up x
           | mod x  4 == 0 = down x
           | otherwise     = flatt x
  criff x = take (mod x 80)$ repeat height
  up    x = take (mod x 100) $ [x..floor $ heightF*0.2]
  down  x = take (mod x 100) $ [x,x-1..0]
  flatt x = take (mod x 150) $ repeat x

initialGround = mkGround.mkRandList
toPictureGnd ys =  map toLines $zip xs ys where
 xs = [-widthF/2..widthF/2]
 toLines (x,y) = Line [(x,fromIntegral y),(x,-heightF/2)]

main = play (InWindow "game-mode" (width,height) (200,100) ) white 200
         initInfo toPictures action nextInfo

action _ w = w

nextInfo _ info = Info{
	chariPos = chariPos info,
	ground = tail $ ground info,
	jumpingMode = jumpingMode info
	}

drawChari pos = Circle 8.0 where
  (x',y') = (fromIntegral $fst pos, fromIntegral$ snd pos)

toPictures info = Pictures $ (drawChari $ chariPos info)
                      :toPictureGnd (ground info)

initInfo = Info {
	chariPos = (div width 2-19 ,initialGround 32 !! (div width 2 -20)),
	ground = initialGround 32,
	jumpingMode = (0,0)
	}
