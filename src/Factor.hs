module Factor (factor) where

import Data.List (find)

factor :: Int -> [Int]
factor n
  | n <= 0       = error "factor of a non-positive number"
  | n == 1       = []
  | mod n 2 == 0 = 2 : factor (div n 2)
  | otherwise    =
    let odds            = [3, 5 ..]
        possibleFactors = takeWhile (\x -> x * x <= n) odds
        smallestFactor  = find (\x -> mod n x == 0) possibleFactors 
    in case smallestFactor of
      Just f  -> f : factor (div n f)
      Nothing -> [n]
