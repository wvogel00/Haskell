module Annealing  where

import Debug.Trace (trace)
import System.Random

data AState = AState {
	x :: Double,
	tmpX :: Double
	}deriving Show

func x = -3*x^4 + 3*x^3 + 10*x^2 - 10*x + 15

mkRands :: Int -> [Double]
mkRands = randomRs (0,1.0).mkStdGen

mkRand :: Double -> Double
mkRand = head.randomRs (0,1.0).mkStdGen.floor.(32768*)

temperatures :: Double -> Double -> [Double]
temperatures init rate = take 500 $ iterate (rate*) init

repeatAnnealing :: Double -> AState -> Int -> AState
repeatAnnealing t anneal n = foldl (seekAnswer t) anneal.take n $ iterate mkRand $ fromIntegral n*t

getNeighbor :: Double -> Double -> Double
getNeighbor r x = if r <0.5 then x+0.01 else x-0.01

seekAnswer t anneal r =	AState {x = newX , tmpX = newTmpX}  where
		y = getNeighbor r $ x anneal
		delta = func (x anneal) - func y
		newX = if delta < 0 || exp(-delta/t) > mkRand r then y else x anneal
		newTmpX = if func newX > func (tmpX anneal) then newX else tmpX anneal

runAnneal x initT n = foldl (calc n) (initAnneal x).temperatures initT

calc n anneal t = repeatAnnealing t anneal n

initAnneal initx = AState {x = initx , tmpX = initx}
