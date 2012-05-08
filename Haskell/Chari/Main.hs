import Graphics.UI.GLUT
import Interface

data GameState = Title | Play | GameOver

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

 drawChari 20 10

 swapBuffers
