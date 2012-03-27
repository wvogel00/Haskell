module Test where

import Text.Parsec
import Text.Parsec.String
import Data.IORef
import System.IO

numbers = "0123456789"
alphabets = ['a'..'z']++['A'..'Z']

keyWord = ["int","for","while","char"]

type Name = String
data Value = Int | String deriving (Eq,Ord,Show)
type ConstValue = (Name,Value) -- 定数
type VariableValue = IORef (Name,Value)

data Token = KeyWord | Const | Variable | Literal | Operator | Delimiter
  deriving (Show,Eq)

--識別子か否か
isIdentifier :: String -> Bool
isIdentifier str
 = let str' = dropWhile (\c -> any (==c) alphabets) str
   in  filter (\c -> all (/=c) numbers) str' == []

--ファイルから次の一文字を取得
nextCh :: Handle -> IO Char
nextCh h = do
 c <- hGetChar h
 case c of
  ' ' -> nextCh  h --space読み飛ばし
  '\t'-> nextCh  h --  tab読み飛ばし
  '/' -> nextCh' h
  _  -> return c
 where
  nextCh' h = do
   c' <- hGetChar h
   case c' of
    '*' -> do c'' <- hGetChar h
              deleteComment h c''
              nextCh h
    '/' -> do hGetLine h
              hGetChar h >>= return

deleteComment :: Handle -> Char -> IO()
deleteComment h c1 = do
 c2 <- hGetChar h
 if c1 == '*' && c2 == '/' then return () else deleteComment h c2

--次のトークンを取得
--nextTkn :: Handle -> IO String
--nextTkn h = do
 
