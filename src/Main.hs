module Main where

import System.Environment
import Factor

-- TODO: handle usage errors:
--   - exactly 1 arg
--   - numeric, non-negative arg

main :: IO ()
main = do
  args <- getArgs
  let n = read (head args) :: Int in
    putStrLn $ show (factor (n))
