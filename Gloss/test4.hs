import Graphics.Gloss
import qualified Graphics.Gloss.Interface.Pure.Game as G
import System.Random

type Velocity = Int
data Info = Info {
	chariPos :: (Int,Int),
	ground :: [Int],
	jumpingMode :: (Int,Velocity),
	record :: Double
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
  criff x = take (mod x  80) $ repeat height
  up    x = take (mod x 100) $ [x..floor $ heightF*0.2]
  down  x = take (mod x 100) $ [x,x-1..0]
  flatt x = take (mod x 150) $ repeat x

initialGround = mkGround.mkRandList
toPictureGnd ys =  map toLines $zip xs ys where
 xs = [-widthF/2..widthF/2]
 toLines (x,y) = Line [(x,fromIntegral y),(x,-heightF/2)]

main = play (InWindow "game-mode" (width,height) (200,100) ) white 200
         initInfo toPictures action nextInfo

action :: G.Event -> Info -> Info
action (G.EventKey (G.SpecialKey G.KeyLeft) G.Down  _ (_,_)) info
 = Info {
	chariPos = (\(x,y) -> (x-1,y)) $ chariPos info,
	ground = tail $ ground info,
	jumpingMode = jumpingMode info,
        record = velocity (record info) + record info
	}
action (G.EventKey (G.SpecialKey G.KeyUp) G.Down  _ (_,_)) info
 = Info {
	chariPos = (\(x,y) -> (x,y+100)) $ chariPos info,
	ground = tail $ ground info,
	jumpingMode = jumpingMode info,
        record = velocity (record info) + record info
	}
action _ info = info

nextInfo _ info = Info{
	chariPos = nextChariPos,
	ground = nextGround,
	jumpingMode = jumpingMode info,
        record = velocity (record info) + record info
	}where
 nextGround = gndVelocity (record info) $ ground info
 (x,y) = chariPos info
 nextChariPos = if x > 0 &&  abs (y - nextGround !! x+1) < 10
  then (x,nextGround !! x+1) else (x,y)

--走行距離に応じて速度変化
gndVelocity record
  | record <  500 = drop 1
  | record < 1000 = drop 2
  | record < 2000 = drop 4
  | record < 5000 = drop 5
  | otherwise     = drop 7


--走行距離に応じて速度変化
velocity record
  | record <  500 = 0.05
  | record < 1000 = 0.06
  | record < 2000 = 0.08
  | record < 5000 = 1.00
  | otherwise     = 1.30

drawChari (x,y) = Pictures [headPic,bodyPic,chariPic] where
  headPic  = Translate x' y' $ Circle 8
  bodyPic  = Line [(x',y'-4),(x',y'-10)]
  chariPic = Pictures [Translate (x'-10) (y'-10) $ Circle 8,
			Translate (x'+15) (y'-10) $ Circle 8,
			Line [(x'-10,y'-10),(x'+15,y'-10)]]
  (x',y')  = (fromIntegral x , fromIntegral y)

--チャリ、地面、走行距離を描画
toPictures info = Pictures $ (drawChari $ chariPos info)
                      :showRecord (show.floor $ record info)
                      :toPictureGnd (ground info)

showRecord str = Translate (-widthF/2+20) (heightF/2-20) $ Scale 0.1 0.1 $ Text str

initInfo = Info {
	chariPos = ( 0,initialGround 32!!(div width 2 -20)),
	ground = initialGround 32,
	jumpingMode = (0,0),
        record = 0
	}
