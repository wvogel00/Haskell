import Data.Char
import Foreign.Marshal

main = getLine >>= brainf_ck

brainf_ck :: String -> IO()
brainf_ck str = putStr $ stream ([],[0,0..]) ([],str)

stream :: ([Int],[Int]) -> (String,String) -> String
stream _ (_,[]) = []
stream (n1,n2) str
 = do case head (snd str) of
        '>' -> stream (n1++[head n2],tail n2) str'
        '<' -> stream (init n1,last n1:n2) str'
        '+' -> stream (n1,(head n2+1):tail n2) str'
        '-' -> stream (n1,(head n2-1):tail n2) str'
        '.' -> (chr $ head n2) : stream (n1,n2) str'
        ',' -> stream (n1,unsafeLocalState input:n2) str'
        '[' -> stream (n1,n2) str'
        ']' -> judgeIF (n1,n2) str
  where
    str' = (fst str ++ [head $ snd str] , tail $ snd str)
    input :: IO Int
    input = getChar >>= return.ord

judgeIF :: ([Int],[Int]) -> (String,String) -> String
judgeIF (n1,n2) str@(cs1,cs2)
  = if head n2 == 0
    then stream (n1,n2) (cs1++[head cs2],tail cs2)
    else stream (n1,n2) (cs1',cs2')
  where
    cs1' = takeWhile (/= '[') cs1
    cs2' = dropWhile (/= '[') cs1 ++ cs2
