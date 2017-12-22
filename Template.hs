{-# LANGUAGE OverloadedStrings #-}

import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes
import Text.Blaze.Html.Renderer.Pretty (renderHtml)
import Control.Monad (mapM)

links = [("d3 contracting", "https://lack.com/messages/C082ZDBU0/"),
         ("workaline", "https://workaline.com/?search=technical4"),
         ("hacker news jobs", "https://news.ycombinator.com/jobs"),
         ("hacker news", "https://news.ycombinator.com"),
         ("remote", "https://remote.com/jobs"),
         ("glassdoor", "https://www.glassdoor.com"),
         ("remote list", "https://remotelist.io/"),
         ("bitwage", "https://www.bitwage.com"),
         ("cloudpeeps", "http://www.cloudpeeps.com/"),
         ("working nomads", "https://www.workingnomads.co/jobs"),
         ("upwork", "https://www.upwork.com/ab/find-work/"),
         ("angel remote", "https://angel.co/job-collections/remote"),
         ("* stack overflow", "https://stackoverflow.com/jobs/remote-developer-jobs"),
         ("the remote freelancer (list of links)", "https://github.com/engineerapart/TheRemoteFreelancer"),
         ("twitter #remote #job", "https://twitter.com/search?f=tweets&q=%20%23remote%20%23job&src=typd"),
         ("twitter remote javascript", "https://twitter.com/search?f=tweets&q=remote javascript"),
         ("jobspresso", "https://jobspresso.co/"),
         ("gigster", "https://gigster.com/"),
         ("domino", "https://www.askdomino.com/"),
         ("facebook", "http://facebook.com"),
         ("linkedin", "http://linkedin.com"),
         ("hashnode", "http://hashnode.com")]

template = renderHtml $ do
  H.head $ do
    H.title "Abanico"
    link ! rel "icon" ! type_ "image/png" ! href "favicon.png"
    link ! rel "stylesheet" ! href "style.css"
  body $ do
    mapM (\ (t,h) -> a ! href h $ t) links
    pure ()

main = putStrLn template
