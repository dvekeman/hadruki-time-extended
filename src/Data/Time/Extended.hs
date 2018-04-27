module Data.Time.Extended
    ( module Data.Time
    , expirationFromNow
    ) where

import           Control.Monad.IO.Class
import           Data.Time

expirationFromNow :: MonadIO m => m UTCTime
expirationFromNow = do
    let lifetime = 86400
    now <- liftIO getCurrentTime
    return $ addUTCTime (fromIntegral lifetime) now