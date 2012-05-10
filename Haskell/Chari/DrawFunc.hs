module DrawFunc where
import Interface
import Graphics.UI.GLUT
import System.Random (mkStdGen,next)
import Data.List

piList = [0,0.01..2*pi]

toVertex (x,y) = Vertex2 x y
toVector3 :: (GLfloat,GLfloat) -> Vertex3 Float
toVector3 (x,y) = Vertex3 (x/width*2-1) (y/height*2-1) 0
toGLPos (Vertex2 x y) = Vertex2 (x/width*2-1) (y/height*2-1)

drawChari x y = preservingMatrix $ do
 color (Color3 0.0 0.0 0.0 :: Color3 GLfloat)
 renderPrimitive Points $ mapM_ vertex
  $ map (toGLPos.toVertex) $ modelingChari x y

modelingChari x y =
 map circle piList
 ++ zip (repeat $ x) ([y-15..y-10])
 ++ zip [x-10..x] [y-20..y-10]
 ++ zip [x-10..x+12] (repeat $y-20)
 ++ map (circle' $ x-10) piList
 ++ map (circle' $ x+12) piList
 where
  r = 9
  circle theta = (x+r*cos theta,y+r*sin theta)
  circle' x theta = (x+(r-2)*cos theta,(y-20)+(r-2)*sin theta)

drawGround yList = preservingMatrix $ do
 lineWidth $= 2.0
 renderPrimitive Lines $ mapM_ vertex $
  map (toGLPos.toVertex) $ zip' [0..width] $ zip (repeat 0.0) $ yList
 where
  zip' xx yys = concat$ map (\(x,(y,y'))->[(x,y),(x,y')]) $ zip xx yys

makeGround :: Int -> [GLfloat]
makeGround seed = map fromIntegral $ concat $ map makeGrad
 $ unfoldr ((\a->Just a).next) $ mkStdGen seed

makeGrad seed = case isGrad seed of
 Interface.Flat  k -> take k $ repeat $ mod seed hMax
 Interface.Up    k -> take k $ [mod seed hMax..]
 Interface.Down  k -> take k $ [mod seed hMax,mod seed hMax-1..]
 Interface.Cliff k -> take (mod seed 100) $ repeat 0
 where
  hMax = floor $ height*0.6
  isGrad :: Int -> NextGround
  isGrad seed
   | grad < 20 = Interface.Flat (mod seed 200)
   | grad < 35 = Interface.Up   (mod seed 140)
   | grad < 60 = Interface.Down (mod seed 140)
   | otherwise = Interface.Cliff(mod seed 80)
   where
    grad = mod seed 67

putText (x,y) str = preservingMatrix $ do
 clearColor $= Color4 1.0 1.0 1.0 0.0
 lineWidth $= 3.0
 w <- stringWidth Roman str
 translate (pos w :: Vector3 Float)
 scale 0.001 0.0008 (1.0 :: Double)
 renderString Roman str where
  pos w = Vector3 (x/width*2-1-0.5*fromIntegral w) (y/height*2-1) 0
