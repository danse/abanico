{-# LANGUAGE OverloadedStrings #-}

import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Control.Monad (mapM, void)
import Web.Scotty (scotty, get, html, file)
import Paths_abanico (getDataFileName)
import Web.Browser (openBrowser)
import Data.Text.Lazy (Text)

import qualified Web.Scotty as Scotty

favorites :: [(Html, AttributeValue)]
favorites = [
         ("stack overflow", "https://stackoverflow.com/jobs/remote-developer-jobs")
            ]

links :: [(Html, AttributeValue)]
links = [("hashtagnomads jobs", "https://nomadlist.slack.com/messages/C02SU0WLE"),
         ("d3 contracting", "https://d3js.slack.com/messages/C082ZDBU0/"),
         ("workaline", "https://workaline.com/?search=technical4"),
         ("hacker news jobs", "https://news.ycombinator.com/jobs"),
         ("hacker news", "https://news.ycombinator.com"),
         ("remote", "https://remote.com/jobs"),
         ("glassdoor", "https://www.glassdoor.com"),
         ("remote list", "https://remotelist.io/"),
         ("cloudpeeps", "http://www.cloudpeeps.com/"),
         ("working nomads", "https://www.workingnomads.co/jobs"),
         ("upwork", "https://www.upwork.com/ab/find-work/"),
         ("angel remote", "https://angel.co/job-collections/remote"),
         ("the remote freelancer (list of links)", "https://github.com/engineerapart/TheRemoteFreelancer"),
         ("twitter #remote #job", "https://twitter.com/search?f=tweets&q=%20%23remote%20%23job&src=typd"),
         ("twitter remote javascript", "https://twitter.com/search?f=tweets&q=remote javascript"),
         ("jobspresso", "https://jobspresso.co/"),
         ("gigster", "https://gigster.com/"),
         ("domino", "https://www.askdomino.com/"),
         ("facebook", "http://facebook.com"),
         ("linkedin", "http://linkedin.com"),
         ("hashnode", "http://hashnode.com")]

template :: Text
template = renderHtml $ do
  H.head $ do
    H.title "Abanico"
    link ! rel "icon" ! type_ "image/png" ! href "favicon.png"
    link ! rel "stylesheet" ! href "style.css"
  body $ do
    void (mapM (\ (t,h) -> a ! href h $ t) (favorites ++ links))

data Asset   = Style | Favicon
type PathEnd = String
type Static  = (PathEnd, FilePath)

app :: [Static] -> Scotty.ScottyM ()
app statics = do
  get "/" (Web.Scotty.html template)
  void (mapM getStatic statics)
  where getStatic :: Static -> Scotty.ScottyM ()
        getStatic (e, f) = get (Scotty.literal ('/':e)) (file f)

main :: IO ()
main = do
  statics <- mapM (dataStatic . assetPath) assets
  void (openBrowser "http://localhost:3000")
  scotty 3000 (app statics)
  where assets = [Style, Favicon]
        assetPath :: Asset -> PathEnd
        assetPath Style   = "style.css"
        assetPath Favicon = "favicon.png"
        dataStatic :: PathEnd -> IO Static
        dataStatic e = getDataFileName e >>= \ f -> pure (e,f)
