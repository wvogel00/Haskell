import Network.HTTP (getRequest)
import Network.HTTP.Base (rspBody)
import Network.Browser(request,browse)
import Control.Arrow
main = do
 url <- getLine
 (_,res) <- browse.request.getRequest $ url
 putStr $ rspBody res
