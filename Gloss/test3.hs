import System.Random
import Graphics.Gloss

(width,height) = (600,400) :: (Int,Int)
(widthF,heightF) = (fromIntegral width,fromIntegral height)
maxGnd = div (height*7) 10
maxGndF = fromIntegral maxGnd - heightF/2

mkRandList :: Int -> [Int]
mkRandList = randomRs (floor $ -heightF/2,floor $heightF*0.2).mkStdGen

ground :: [Int] -> [Int]
ground = addNoise.concat.map switch
 where
  addNoise = map (\x -> x + mod x 4)
  switch x | mod x 60 == 0 = criff x
           | mod x  5 == 0 = up x
           | mod x  4 == 0 = down x
           | otherwise     = flatt x
  criff x = take (mod x 80)$ repeat height
  up    x = take (mod x 100) $ [x..maxGnd]
  down  x = take (mod x 100) $ [x,x-1..0]
  flatt x = take (mod x 150) $ repeat x

main = simulate (InWindow "make ground" (width,height) (100,0)) white
          200 initialGround toPicture updateGround 
 where
  initialGround = ground $ mkRandList 32
  toPicture ys = Pictures$map heightToLines $zip [0..widthF] ys
  heightToLines (x,y) =
     Line [(x-widthF/2,fromIntegral y),(x-widthF/2,-heightF/2)]
  updateGround _ _ ys = tail ys
