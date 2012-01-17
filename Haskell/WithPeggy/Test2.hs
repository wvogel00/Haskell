{-# Language TemplateHaskell , QuasiQuotes ,FlexibleContexts #-}

import Text.Peggy
import Control.Monad

data Script
 = Mes   {name     ::String,
          sentence ::String}
  |Img  {layer    ::Int,
         x        ::Int,
         y        ::Int,
         filepath ::String}
  |Sound {filepath ::String,
          isOn     ::Bool}
  deriving (Show)
[peggy|
scripts :: [Script]
 =  script* !.	--0個以上のスクリプト

script :: Script
 = "mes(" parseMes ");"    { $1 }
 / "img(" parseImg ");"    { $1 }
 / "music(" parseMusic ");"{ $1 }
 / '\n' script             { $1 }
 / '\r' script             { $1 }

parseMes :: Script
 = scString "," scString { mesScr  $1 $2 }
 / scString              { mes1Scr $1}

parseImg :: Script
 = num "," num "," num "," scString { imgScr  $1 $2 $3 $4 }
 / num "," scString                 { img1Scr $1 $2 }
 / scString                         { img2Scr $1 }

parseMusic :: Script
 = scString "," scMusicBool { soundScr $1 $2 }

scMusicBool :: Bool
 = "\"" "on"  "\"" { True }
 / "\"" "off" "\"" { False }

scString ::: String
 = '\"' scChar* '\"'

scChar :: Char
 = [0-9a-zA-Z .,_!?]

num ::: Int
 = [1-9] [0-9]* {read ($1 : $2)}
 / [0]          {0}
|]

mesScr a b = Mes {name = a , sentence = b}
mes1Scr a  = Mes {name = "", sentence = a}

imgScr a b c d = Img {layer = a,x = b,y = c,filepath = d}
img1Scr a b    = Img {layer = a,x = 0,y = 0,filepath = b}
img2Scr a      = Img {layer = 0,x = 0,y = 0,filepath = a}

soundScr a b = Sound {filepath = a , isOn = b}

format e = "line="++show (locLine e) ++ ",pos" ++show (locAbs e)

main = do 
 cs <- getContents
 case parseString scripts "<script>" cs of
  Right xs -> forM_ xs print
  Left (ParseError (LocPos e) comment) -> putStrLn $ format e ++ "\n\r"++comment
