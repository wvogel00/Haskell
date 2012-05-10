import Graphics.UI.GLUT
import Interface
import DrawFunc
import Data.IORef
import Data.List (nub)

main = do
 keyList <- newIORef []
 getArgsAndInitialize
 initialWindowSize     $= Size (floor width) (floor height)
 initialWindowPosition $= Position 200 100
 initialDisplayMode    $= [DoubleBuffered,RGBMode]

 createWindow "CHARI-RUNNING!"

 keyboardMouseCallback $= Just (keyProc keyList)
 displayCallback       $= chariGame
 mainLoop

chariGame = do
 clearColor $= Color4 1.0 1.0 1.0 0.0
 clear [ColorBuffer]
 loadIdentity

 drawChari 400 400
 drawGround $ makeGround 23
 putText (200,400) "runnning" 
 swapBuffers

keyProc keyList key ks mod pos =
 case (key,ks) of
  (Char 'x',_) -> modifyIORef keyList (nub.(++[key]))
  (Char 'q',_) -> exitLoop
  _            -> return ()

exitLoop = return()

