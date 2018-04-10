-- This module searches for files matching glob pattern or filename, and tries to run type providers listed.
{-# LANGUAGE ViewPatterns #-}
module Main(main) where

import System.Directory
import System.Exit
import System.FilePath
import System.IO
import Data.List(isSuffixOf)
--import Magic
import Data.Maybe(maybeToList)

import ProvidersList

-- * Recursing directory tree in order to list Haskell source files.
-- | Find all Haskell source files within a given path.
-- Recurse down the tree, if the path points to directory.
subTrees          :: (FilePath -> IO (Maybe a)) -> FilePath -> IO [a]
-- Recurse to . or .. only at the first level, to prevent looping:
subTrees f dir      | dir `elem` [".", ".."] = concatMapM (subTrees' f) =<< getDirectoryPaths dir
subTrees f filepath                          = do
  result <- f filepath
  case result of
    Just r  -> -- Return the match
               return [r]
    Nothing -> do -- Unmatched: recurse
      isDir <- doesDirectoryExist filepath
      if isDir
         then subTrees' f filepath
         else do
           exists <- doesFileExist filepath
           if exists
              then    return []
              else do hPutStrLn stderr $ "File does not exist: " ++ filepath
                      return []

-- | Return filepath if normal file, or recurse down the directory if it is not special directory ("." or "..")
subTrees'                       :: (FilePath -> IO (Maybe a)) -> FilePath -> IO [a]
subTrees' f (takeFileName -> "..") = return []
subTrees' f (takeFileName -> "." ) = return []
subTrees' f  fp                    = do
  isDir <- doesDirectoryExist fp
  if isDir
    then concatMapM (subTrees' f) =<< getDirectoryPaths fp
    else do
      r <- f fp
      return $ maybeToList r
       

-- | Get contents of a given directory, and return their full paths.
getDirectoryPaths        :: FilePath -> IO [FilePath]
getDirectoryPaths dirPath = map (dirPath </>) <$> getDirectoryContents dirPath

-- | Commonly defined function - should be added to base...
concatMapM  :: (Functor m, Monad m) => (a -> m [b]) -> [a] -> m [b]
concatMapM f = fmap concat . mapM f

main = putStrLn "Testing!"
