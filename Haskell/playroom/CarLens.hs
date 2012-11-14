module CarLens where

import Data.Lenses
import Data.Lens.Lazy
import Data.Lens.Template

data Car = Car {
	pos      :: Int,
	fuel     :: Int,
	velocity :: Int
	}

instance Show Car where
	show car = "position = "++show (pos car) ++"km\n"
				++"fuel is "++show (fuel car) ++"L\n"
					++"velocity is "++show (velocity car) ++" km/h\n"

myCar :: Car
myCar = Car{
	pos = 0,
	fuel = 100,
	velocity = 0
}

getPos :: Car -> Int
getPos = pos
setPos :: Int -> Car -> Car
setPos x car = car {pos = pos car + x}

getFuel :: Car -> Int
getFuel = fuel
setFuel :: Int -> Car -> Car
setFuel f car = if fuel car + f > 0
	then car {fuel = fuel car + f} else car {fuel = 0}

getV :: Car -> Int
getV = velocity
setV :: Int -> Car -> Car
setV v car = if velocity car + v > 0
	then car {velocity= velocity car + v} else car {velocity = 0}

posL :: Lens Car Int
posL = lens getPos setPos

fuelL :: Lens Car Int
fuelL = lens getFuel setFuel

velocityL :: Lens Car Int
velocityL = lens getV setV
