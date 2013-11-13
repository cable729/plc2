module Paths_PLC2 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "C:\\Users\\Caleb\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\Caleb\\AppData\\Roaming\\cabal\\PLC2-0.1.0.0\\ghc-7.6.3"
datadir    = "C:\\Users\\Caleb\\AppData\\Roaming\\cabal\\PLC2-0.1.0.0"
libexecdir = "C:\\Users\\Caleb\\AppData\\Roaming\\cabal\\PLC2-0.1.0.0"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "PLC2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "PLC2_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "PLC2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "PLC2_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
