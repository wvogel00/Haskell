{-# LANGUAGE TypeFamilies, QuasiQuotes,
   TemplateHaskell, MultiParamTypeClasses, OverloadedStrings #-}

import Yesod

article = "hello,this is wVogel,living in Japan.I'm learning about Yesod,web framework. I want to make blog for me!!!"

data Entry = Entry{
                   entryTitle   :: String,
                   entrySlug    :: String,	--used in the URL
                   entryContent ::String
                  }

loadEntries :: IO [Entry]
loadEntries = return [Entry "introduce myself" "entry-0" article,
                      Entry "Entry2" "entry-1" "second_entry",
                      Entry "Entry3" "entry-2" "third_entry"
                     ]

data Blog  = Blog {blogEntries :: [Entry] }

mkYesod "Blog" [parseRoutes|
/                     HomeR GET
/entry/#String        EntryR GET
|]

instance Yesod Blog where
  approot _ = ""

getHomeR :: Handler ()
getHomeR = do Blog entries <- getYesod
              let newest = last entries
              redirect RedirectTemporary $ EntryR $ entrySlug newest

data Nav = Nav{
               navUrl   :: Route Blog,
               navTitle :: Html
              }

data TemplateArgs = TemplateArgs{
                      templateTitle   :: Html,
                      templateContent :: Html,
                      templateNavbar  :: [Nav]
                    }

entryTemplate :: TemplateArgs -> HtmlUrl (Route Blog)
entryTemplate args = [hamlet|
  !!!
  <html>
    <head>
      <title>#{templateTitle args}
    <body>
      <h1>Yesod Sample Blog by WVogel
      <h2>#{templateTitle args}
      <ul id="nav">
        $forall nav <- templateNavbar args
          <li>
            <a href="@{navUrl nav}">#{navTitle nav}
      <div id="content">
        \#{templateContent args}
  |]

getEntryR :: String -> Handler RepHtml
getEntryR slug = do
  Blog entries <- getYesod
  case filter (\e -> entrySlug e == slug) entries of
    [] -> notFound
    (entry:_) -> do let nav = reverse $ map toNav entries
                    let tempArgs = TemplateArgs{
                                   templateTitle = toHtml $ entryTitle entry,
                                   templateContent =toHtml $ entryContent entry,
                                   templateNavbar = nav
                                   }
                    hamletToRepHtml $ entryTemplate tempArgs
    where
      toNav :: Entry -> Nav
      toNav e = Nav{
                   navUrl = EntryR $ entrySlug e,
                   navTitle = toHtml $ entryTitle e
                   }

main :: IO()
main = do entries <- loadEntries
          warpDebug 3000 $ Blog entries
