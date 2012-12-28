module GATest where

import System.Random
import System.Time
import Data.List (sort,group,(\\))

data Bit = I | O deriving (Show,Ord,Eq)
type Gene = [Bit]

func x = sin (3*x) + 0.5*sin (9*x) + sin (15*x+50)

mutateRate = 0.03
num = 20

--遺伝子列を評価可能な値に変換
geneValue :: Gene -> Double
geneValue gene = (\x -> x/(2^n-1)).fst $ foldl f (0,n) gene where
	f (value,k) I = (value+2^(k-1),k-1)
	f (value,k) O = (value,k-1)
	n = length gene

--交叉
intersect :: Int -> (Gene,Gene) -> (Gene,Gene)
intersect seed (g1,g2) = (g1_1++g2_2 , g2_1++g1_2) where
	(g1_1,g1_2) = splitAt point g1
	(g2_1,g2_2) = splitAt point g2
	point = fst.randomR (0,length g1-1) $ mkStdGen seed

--初期遺伝子群
initGenes :: Int -> [Gene]
initGenes = map (toGene.mkSeed).mkSeed where
	mkSeed = take 20.randomRs (1,100).mkStdGen

toGene = map (\x -> if x <= 50 then I else O)

--親のペアを作成
mkParents :: Int -> [Gene] -> [(Gene,Gene)]
mkParents seed group = marry pairs where
	marry [] = []
	marry (p1:p2:ps) = (group !! p1,group !! p2):marry ps
	pairs = take 10.randomRs (0,length group-1) $ mkStdGen seed

nextGenes :: Int -> [Gene] -> [Gene]
nextGenes seed group = mutate r1.toList.map (intersect r2) $ mkParents r3 group where
	[r1,r2,r3] = take 3.randoms $ mkStdGen seed
	toList = concat.map (\(c1,c2) -> [c1,c2])

--突然変異体
mutate :: Int -> [Gene] -> [Gene]
mutate r children = foldl mutate' [] $ zip (randomRs (0,1.0) $ mkStdGen r) children where
	mutate' :: [Gene] -> (Double,Gene) -> [Gene]
	mutate' gs (rate,gene) = (if rate < mutateRate then map change else id) gene:gs
	change I = O
	change O = I

--淘汰
select :: [Gene] -> [Gene]
select genes=  excelents ++ roulette where
	gs = zip (map geneValue genes) genes
	excelents = map snd.drop (length genes-5).sort $ map (\(x,g) -> (func x,g)) gs
	roulette = take 15 (genes \\ excelents)

--駆動
run :: Int -> IO ()
run n = do
	t1 <- getClockTime
	t2 <- getClockTime
	let pico = read.take 4.show $ tdPicosec (diffClockTimes t1 t2)
	let [r1,r2] = take 2.randoms $ mkStdGen  pico
	run' n r1 (initGenes r2) where
		run' 0 _ genes = mapM_ showResult genes
		run' k seed genes = do
			let [r1,r2] = take 2.randoms $ mkStdGen seed
			run' (k-1) r1 $ select (nextGenes r2 genes ++ genes)

showResult :: Gene -> IO()
showResult gene = do
	putStrLn $ "(x,y) = (" ++ show (geneValue gene) ++ "," ++ show (func $ geneValue gene) ++ ")"
