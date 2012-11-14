module DrivingCar where

import CarLens
import Data.Lens.Lazy
import Control.Monad.State.Lazy

data Pedal = Accelerator | Brake deriving Show
type CarState = (Pedal,Car)

initCarState = (Accelerator,myCar)

drive :: [String] -> StateT CarState IO Car
drive [] = get >>= return.snd
drive (ground:xs) = do
	nowState@(pedal,car) <- get
	_ <- liftIO (putStr $ show car)
	_ <- liftIO (putStrLn $ show pedal)
	_ <- liftIO (putStrLn.take 20 $ repeat '*')
	if car ^.fuelL <= 0 && car ^. velocityL <= 0
		then put nowState
		else case ground of
			"flat"  -> put (Accelerator,driveFlat nowState)
			"up"    -> put (Accelerator,driveUp car)
			"down"  -> put (Brake,driveDown car)
	drive xs

run :: IO()
run = do
	(_,carstate) <- runStateT (drive road) initCarState
	putStr.show $ snd carstate

driveFlat (Accelerator,car) = if car ^.fuelL > 0
	then  velocityL ^= 10 $ posL ^= 10 $ fuelL ^= -5 $ car
	else  velocityL ^= -3 $ posL^= 5 $ car
driveFlat (Brake,car) = velocityL ^= -10 $ posL ^= 5 $ car

driveUp car = velocityL ^= -5 $ posL ^= 5 $ fuelL ^= -10 $ car
driveDown car = velocityL ^= 10 $ posL ^= 15 $ fuelL ^= -1 $ car

road :: [String]
road = ["flat","up","up","down","flat","flat","down","flat","flat","up","up","flat"]
