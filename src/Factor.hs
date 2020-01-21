module Factor (factor) where

factor :: Int -> [Int]
factor n
  | n <= 0       = error "factor of a non-positive number"
  | n == 1       = []
  | mod n 2 == 0 = 2 : factor (div n 2)
  | otherwise    = factorOdds n 3

factorOdds :: Int -> Int -> [Int]
factorOdds n odd
  | n < odd * odd  = [n]
  | mod n odd == 0 = odd : factorOdds (div n odd) odd
  | otherwise      = factorOdds n (odd + 2)
