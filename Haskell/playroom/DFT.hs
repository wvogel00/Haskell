module DFT where

import Data.List
import Control.Monad
import Control.Applicative

type ComplexNum = (Double,Double)

dft :: Int -> [ComplexNum] -> [ComplexNum]
dft n comps = map dft' [0..n-1] where
	dft' i =
		let d = 2.0*pi*fromIntegral i/fromIntegral n
		in calc i d
	calc i d = foldl sum' (0,0) $ map (\j -> (real j d,imag j d)) [0..n-1]
	real j d = fst (comps !! j)*cos (d*fromIntegral j)
	imag j d = negate $ snd (comps !! j)*sin (d*fromIntegral j)
	sum' (x,ix) (v,iv) = (x+ix,v+iv)

extractX,extractY,extractZ :: String -> ComplexNum
extractX = (\x -> (read x,0)).head.words
extractY = (\y -> (read y,0)).(\(_:y:_) -> y).words
extractZ = (\z -> (read z,0)).(\(_:_:z:_) -> z).words

main = do
	filename <- getLine
	strs <- take 50.lines <$> readFile (filename++".txt")
	let n =  200 -- ~1000ms 
	let xDFT = map hz.zip [0..n-1].dft n $ add0 n (map extractX strs)
	let yDFT = map hz.zip [0..n-1].dft n $ add0 n (map extractY strs)
	let zDFT = map hz.zip [0..n-1].dft n $ add0 n (map extractZ strs)
	writeFile (filename++"DFTX.txt").concat.map format $ xDFT
	writeFile (filename++"DFTY.txt").concat.map format $ yDFT
	writeFile (filename++"DFTZ.txt").concat.map format $ zDFT
	mapM_ putStrLn (map show.take 10.reverse.sort $ xDFT)
	mapM_ putStrLn (map show.take 10.reverse.sort $ yDFT)
	mapM_ putStrLn (map show.take 10.reverse.sort $ zDFT)

max' a (i,v) = if a > v then a else v

add0 n xs = xs ++ take (n-length xs) (repeat (0,0))
format (hz,i) = show i ++ "\t" ++ show hz ++ "\n"
hz (i,(v,iv)) = (v^2 + iv^2,i)
