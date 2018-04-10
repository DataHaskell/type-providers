-- | Utilities for type providers
module Data.TypeProvider.Util(report, filepathToModuleName) where

import System.FilePath
import System.IO

-- | Translate input filename to module name/path
filepathToModuleName :: FilePath -> [String]
filepathToModuleName = undefined

-- | Report to standard error output.
report ::  String -> IO ()
report = hPutStrLn stderr

