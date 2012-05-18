import Data.List
type Link = (Int,Int,Int,Int)
type Topology = [Link]

main = do
 putStrLn "start node ->"
 start <- (getLine >>= return . read :: IO Int)
 putStrLn "  end node ->"
 end   <- (getLine >>= return . read :: IO Int)
 topology <- (readFile "test_topology.txt"
                >>= return . format :: IO Topology)
 print $ searchPath [] (start,end) topology where
    format = map f.map words.lines where
        f = \[n1,n2,l,b] -> (read n1,read n2,read l,read b)

connected _ [] = False
connected (s,e) xs = case find (\(s',_,_,_) -> s' == s) xs of
 Nothing   -> False
 Just link -> connected' link where
  connected' link@(n1,n2,_,_) = if n2 == e
    then True else connected (n2,e) $ delete link xs

searchPath xs flow topology = if connected flow xs
 then xs
 else searchPath (maxPath:xs) flow $ delete maxPath topology where
   maxPath = maxFlow topology

maxFlow topology = foldl max' (0,0,0,0) topology

max' t1@(_,_,_,k) t2@(_,_,_,b) = if k >= b then t1 else t2
