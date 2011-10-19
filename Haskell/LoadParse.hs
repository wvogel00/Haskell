module LoadParse where

import Text.Parsec
import Text.Parsec.String
import Control.Applicative hiding ((<|>) , many)
import Types

--for example,[(0,"123.jpg"),(2,"r.png"),(21,"l.png")]
parseRun :: Parser ScreenState -> String -> IO ScreenState
parseRun p str = case (parse p "" str) of
                    Left  _ -> return []
                    Right x -> return x

parseList :: Parser ScreenState
parseList = do char '['
               l <- factor
               rs <- many (do  char ','
                               x <- factor
                               return $ (++) [x]
                          )
               char ']'
               return $ foldr ($) [l] rs

factor :: Parser Image
factor = do char '('
            layer <- layerTerm
            char ','
            fname <- fileTerm
            char ')'
            return (layer,fname)

fileTerm :: Parser ImageFile
fileTerm = do char '\"'
              k <- many( letter <|> digit <|> (char '.' >> return '.'))
              char '\"'
              return k

layerTerm :: Parser Int
layerTerm = read<$>many1 digit