module Annealing  where

import System.Random

data AState = AState {x,tmpX :: Double} deriving Show

func x = -3*x^4 + 3*x^3 + 10*x^2 - 10*x + 15

mkRands :: Int -> [Double]
mkRands = randomRs (0,1.0).mkStdGen

mkRand :: Double -> Double
mkRand = head.randomRs (0,1.0).mkStdGen.floor.(32768*)

temperatures :: Double -> Double -> [Double]
temperatures rate = take 500.iterate (rate*)

--ある温度での反復処理を実行
repeatAnnealing :: Int -> AState -> Double -> AState
repeatAnnealing n anneal t = foldl (seekAnswer t) anneal.take n$iterate mkRand $fromIntegral n*t

--注目座標の近傍を取得
getNeighbor :: Double -> Double -> Double
getNeighbor r x = if r <0.5 then x+0.01 else x-0.01

--実際に解を発見する関数
seekAnswer t anneal r =	AState {x = newX , tmpX = newTmpX}  where
		y = getNeighbor r $ x anneal
		delta = func (x anneal) - func y
		newX = if delta < 0 || exp(-delta/t) > mkRand r then y else x anneal
		newTmpX = if func newX > func (tmpX anneal) then newX else tmpX anneal

runAnneal initX n t rate = foldl (repeatAnnealing n) initAnneal tmps where
	initAnneal = AState {x = initX , tmpX = initX}
	tmps = temperatures rate t
