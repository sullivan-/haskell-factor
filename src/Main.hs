module Main where

import Data.Maybe (isNothing)
import Factor
import System.Environment
import System.IO (hPutStrLn, stderr)
import Text.Read (readMaybe)

main :: IO ()
main = getArgs >>= mainArgs

mainArgs :: [String] -> IO ()
mainArgs args
  | length args /= 1                               = usage
  | isNothing (readMaybe (head args) :: Maybe Int) = usage
  | otherwise                                      =
      let n = read (head args) :: Int in
        if n <= 0
        then usage
        else putStrLn $ show (factor (n))

usage :: IO ()
usage = hPutStrLn stderr ("usage: factor <positive integer>")
