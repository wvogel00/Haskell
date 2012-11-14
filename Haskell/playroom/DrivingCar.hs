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
	then  updateCar 10 10 (-5)car
	else  updateCar (-3) 5 0 car
driveFlat (Brake,car) = updateCar (-10) 5 (-5) car

driveUp = updateCar (-5) 5 (-10)
driveDown = updateCar 10 15 (-1)

updateCar v p f = (velocityL^=v).(posL^=p).(fuelL^=f)

road :: [String]
road = ["flat","up","up","down","flat","flat","down","flat","flat","up","up","flat"]
