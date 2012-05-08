module Interface where

import Graphics.UI.GLUT

width,height :: Double
width = 800
height = 600

piList = [0,0.01..2*pi]

drawChari x y = preservingMatrix $ do
 color (Color3 0.0 0.0 0.0 :: Color3 GLfloat)
 renderPrimitive Points $ mapM_ vertex
  $ map (\(x,y) -> Vertex2 (x/width) (y/height)) $ modelingChari x y

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
