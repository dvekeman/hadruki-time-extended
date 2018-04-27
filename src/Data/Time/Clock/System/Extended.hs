module Data.Time.Clock.System.Extended (
  module Data.Time.Clock.System
  , systemTimeToMillis
  , systemTimeToSeconds
) where

import           Data.Time.Clock.System
import qualified Data.Text as T



systemTimeToSeconds :: SystemTime -> Int
systemTimeToSeconds (MkSystemTime systemSeconds _) = fromIntegral systemSeconds

systemTimeToMillis :: SystemTime -> Int
systemTimeToMillis (MkSystemTime systemSeconds systemNanoseconds) =
    secondsToMillis systemSeconds 
    + nanosToMillis systemNanoseconds

nanosToMillis :: (Integral a) => a -> Int
nanosToMillis = fromIntegral . round . (*) (10**(-6)) . fromIntegral

secondsToMillis :: (Integral a) => a -> Int
secondsToMillis = fromIntegral . round . (*) (10**3) . fromIntegral

