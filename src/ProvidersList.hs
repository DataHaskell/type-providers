-- List of available providers
-- Either as external executables, or matching functions that are wired-in here.
module ProvidersList(
    ProviderName
  , Glob
  , MIME
  , Provider(..)
  , Match
  , availableProviders) where

import Data.TypeProvider.Util

import Text.ParserCombinators.Parsec(parseFromFile)
import Data.CSV(csvFile)
import Data.List

type ProviderName = String
type Glob = String
type MIME = String

type MatcherFunction = FilePath -> IO (Maybe Match)

type Matcher = Either FilePath MatcherFunction

data Provider = Provider {
    name          :: ProviderName
  , matcher       :: Matcher
  , filenameMatch :: Maybe Glob
  , magicMatch    :: Maybe Glob
  }

type Match = (FilePath, ProviderName)

availableProviders = [dumbCsv]

-- Naive matching of .csv files with mismatch in number of columns.
dumbCsv = Provider {
            name          = "missingH:Data.CSV"
          , matcher       = Right dumbCsvMatch
          , filenameMatch = Just "*.csv"
          , magicMatch    = Just "text/csv"
          }

dumbCsvMatch :: MatcherFunction
dumbCsvMatch filename = do
  result <- parseFromFile csvFile filename
  case result of
    Left  err -> do report $ concat ["Error in .csv input ", filename, ": ", show err]
                    return   Nothing
    Right _   ->    return $ Just (filename, name dumbCsv)

