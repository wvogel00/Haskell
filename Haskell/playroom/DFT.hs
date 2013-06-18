module DFT2 where

import Control.Applicative

fst' (v:_) = v
snd' (_:v:_) = v
thd (_:_:v:_) = v
forth (_:_:_:v:_) = v

dft :: Double -> [Double] -> Double -> Double
dft n vs k = ps.foldl sum' (0,0) .map (uncurry f) $ zip [0,1..] vs where
	f i v = (v*fst (w i),v*snd (w i))
	w i= (cos (-2*pi*k*i/n) , sin (-2*pi*k*i/n))
	sum' (a,b) (a2,b2) = (a+a2,b-b2)
	ps (a,b) = a^2+b^2 -- power spect

main = do
	file <- getLine
	kxyz <- map (map read.words).lines <$> readFile file :: IO [[Double]]
	let ks = map fst' kxyz
	let n = fromIntegral $ length ks
	let xs = map (dft n (map snd' kxyz)) ks
	let ys = map (dft n (map thd kxyz)) ks
	let zs = map (dft n (map forth kxyz)) ks
	--mapM_ (putStrLn.format) $ zip ks $ zip3 xs ys zs
	writeFile ("dft"++file) $ unlines.map format $ zip ks $ zip3 xs ys zs
	putStrLn $ "done!\nresult is put in the file, dft" ++ file 

format (k,(x,y,z)) =
	show k ++ "\t" ++ show x ++ "\t" ++ show y ++ "\t" ++ show z
