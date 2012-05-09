import Graphics.UI.GLUT
import Interface
import DrawFunc

main = do
 getArgsAndInitialize
 initialWindowSize     $= Size (floor width) (floor height)
 initialWindowPosition $= Position 200 100
 initialDisplayMode    $= [DoubleBuffered,RGBMode]

 createWindow "CHARI-RUNNING!"

 displayCallback       $= chariGame
 mainLoop

chariGame = do
 clearColor $= Color4 1.0 1.0 1.0 0.0
 clear [ColorBuffer]
 loadIdentity

 drawChari 400 100
 drawGround $ makeGround 23
 swapBuffers
