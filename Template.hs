{-# LANGUAGE OverloadedStrings #-}

import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes
import Text.Blaze.Html.Renderer.Pretty (renderHtml)
import Control.Monad (mapM)

links = [("https://workaline.com/?search=technical4", "workaline"),
         ("https://news.ycombinator.com/jobs", "hacker news jobs"),
         ("https://news.ycombinator.com", "hacker news"),
         ("https://remote.com/jobs", "remote"),
         ("https://www.glassdoor.com", "glassdoor"),
         ("https://remotelist.io/", "remote list"),
         ("https://www.bitwage.com", "bitwage"),
         ("http://www.cloudpeeps.com/", "cloudpeeps"),
         ("https://www.workingnomads.co/jobs", "working nomads"),
         ("https://www.upwork.com/ab/find-work/", "upwork"),
         ("https://angel.co/job-collections/remote", "angel remote"),
         ("https://stackoverflow.com/jobs/remote-developer-jobs", "* stack overflow"),
         ("https://github.com/engineerapart/TheRemoteFreelancer", "the remote freelancer (list of links)"),
         ("https://twitter.com/search?f=tweets&q=%20%23remote%20%23job&src=typd", "twitter #remote #job"),
         ("https://twitter.com/search?f=tweets&q=remote javascript", "twitter remote javascript"),
         ("https://jobspresso.co/", "jobspresso"),
         ("https://gigster.com/", "gigster"),
         ("https://www.askdomino.com/", "domino"),
         ("http://facebook.com", "facebook"),
         ("http://linkedin.com", "linkedin"),
         ("http://hashnode.com", "hashnode")]

template = renderHtml $ do
  H.head $ do
    H.title "Abanico"
    link ! rel "icon" ! type_ "image/png" ! href "favicon.png"
    link ! rel "stylesheet" ! href "style.css"
  body $ do
    mapM (\ (h,t) -> a ! href h $ t) links
    pure ()

main = putStrLn template
