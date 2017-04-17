{-# LANGUAGE OverloadedStrings #-}

import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes
import Text.Blaze.Html.Renderer.Pretty (renderHtml)
import Control.Monad (mapM)

links = [("https://www.glassdoor.com", "Glassdoor"),
         ("https://remotelist.io/", "Remote List"),
         ("https://www.bitwage.com", "Bitwage"),
         ("http://www.cloudpeeps.com/", "CloudPeeps - not many programmers yet, apparentl"),
         ("https://www.workingnomads.co/jobs", "Working Nomads"),
         ("https://www.upwork.com/ab/find-work/", "Upwork"),
         ("https://angel.co/job-collections/remote", "Angel Remote"),
         ("https://stackoverflow.com/jobs?ref=jobs-tab", "Stack overflow"),
         ("https://github.com/engineerapart/TheRemoteFreelancer", "The Remote Freelancer (list of links)"),
         ("https://twitter.com/search?f=tweets&q=%20%23remote%20%23job&src=typd", "Twitter #remote #job"),
         ("https://twitter.com/search?f=tweets&q=remote javascript", "Twitter remote javascript"),
         ("https://jobspresso.co/", "Jobspresso"),
         ("https://gigster.com/", "Gigster"),
         ("https://www.askdomino.com/", "Domino"),
         ("http://facebook.com", "Facebook"),
         ("http://linkedin.com", "Linkedin"),
         ("http://hashnode.com", "Hashnode")]

template = renderHtml $ do
  H.head $ do
    H.title "Abanico"
    link ! rel "icon" ! type_ "image/png" ! href "favicon.png"
  body $ do
    mapM (\ (h,t) -> a ! href h $ t) links
    pure ()

main = putStrLn template
