module SaveLoad where

import System.IO
import Types
import LoadParse

datanum :: Int -- how many line is used to save the single data
datanum = 3

save :: Date -> FLine -> ScreenState -> Music -> IO()
save date n scr mg = do h <- openFile datafile AppendMode
                        hPutStrLn h $ date ++ " " ++ (show n)
                        hPrint h scr
                        hPutStrLn h $ show mg
                        hClose h

load :: Int -> IO (Date,FLine,ScreenState,Music)
load k = do h <- openFile datafile ReadMode
            fs <- hGetContents h
            result <- extract.pickedData $ fs
            return result
    where
        pickedData = take datanum.drop (k*datanum).lines

extract :: [String] -> IO (Date,FLine,ScreenState,Music)
extract [l1,l2,l3] = parseRun parseList l2
                      >>= \scr -> return (date,read n,scr,mg)
    where
        (date:n:_) = words $ l1
        mg :: Music
        mg = case l3 of
            "Silence" -> Silence
            otherwise -> PlayOn $ last.words $ l3
