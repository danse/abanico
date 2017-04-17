{-# LANGUAGE OverloadedStrings #-}

import Text.Blaze.Html5 as H hiding (main)
import Text.Blaze.Html5.Attributes
import Text.Blaze.Html.Renderer.Pretty (renderHtml)

template = renderHtml $ do
  H.head $ do
    H.title "Abanico"
    link ! rel "icon" ! type_ "image/png" ! href "favicon.png"
  body $ do
    p "Main"
    ul $ do
        li $ a ! href "https://www.glassdoor.com" $ "Glassdoor"
        li $ a ! href "https://remotelist.io/" $ "Remote List"
        li $ a ! href "https://www.bitwage.com" $ "Bitwage"
        li $ a ! href "http://www.cloudpeeps.com/" $ "CloudPeeps - not many programmers yet, apparently"
        li $ a ! href "https://www.workingnomads.co/jobs" $ "Working Nomads"
        li $ a ! href "https://www.upwork.com/ab/find-work/" $ "Upwork"
        li $ a ! href "https://angel.co/job-collections/remote" $ "Angel Remote"
        li $ a ! href "https://stackoverflow.com/jobs?ref=jobs-tab" $ "Stack overflow"
        li $ a ! href "https://github.com/engineerapart/TheRemoteFreelancer" $ "The Remote Freelancer (list of links)"
        li $ a ! href "https://twitter.com/search?f=tweets&q=%20%23remote%20%23job&src=typd" $ "Twitter #remote #job"
        li $ a ! href "https://twitter.com/search?f=tweets&q=remote javascript" $ "Twitter remote javascript"
        li $ a ! href "https://jobspresso.co/" $ "Jobspresso"
        li $ a ! href "https://gigster.com/" $ "Gigster"
        li $ a ! href "https://www.askdomino.com/" $ "Domino"
        li $ a ! href "http://facebook.com" $ "Facebook"
        li $ a ! href "http://linkedin.com" $ "Linkedin"
        li $ a ! href "http://hashnode.com" $ "Hashnode"
    p "Low traffic"
    ul $ li $ a ! href "https://www.jobsinnew.tech/langs/haskell/" $ "Jobs in new tech -- Haskell"

main = putStrLn template
