import Graphics.UI.GLUT
import Interface
import ImageReader

data GameState = Title | Play | Save | Load | End

main = do
 getArgsAndInitialize
 initialWindowSize      $= Size (floor width) (floor height)
 initialWindowPosition  $= Position 200 100
 initialDisplayMode     $= [DoubleBuffered , RGBMode]

 createWindow "image"

 displayCallback        $= myDisp
 mainLoop

myDisp = do
 clearColor $= Color4 0.0 0.0 1.0 0.0
 clear [ColorBuffer]

 loadIdentity

 lineWidth  $= 3.0

 preservingMatrix $ do
  color (Color3 0.9 1.0 0.3 :: Color3 GLfloat)
  renderPrimitive Points $ mapM_ vertex
            $ map (\x->Vertex2 x x) [(-1.0),(-0.99)..1.0 :: GLfloat]
 readBmp "test.bmp" >>= showImage (0,0)
 swapBuffers
