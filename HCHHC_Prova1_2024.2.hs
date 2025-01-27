--Q1
ehPrimo :: Int -> Bool
ehPrimo 0 = False
ehPrimo 1 = False
ehPrimo a = aux a (a-1)
    where
        aux :: Int -> Int -> Bool
        aux 2 _ = True
        aux a 1 = True
        aux a b | a `mod` b == 0 = False
                | otherwise = aux a (b-1)

-- Q2                
sumPrimeSquares1 :: Int -> Int -> Int 
sumPrimeSquares1 a b | a >= b = 0
                     | otherwise = foldr (+) 0 (map (^2) (filter (ehPrimo) [a..b])) 
                
{- Q3
sumPrimeSquaresl a b | a >= b = 0
                     | otherwise = [\x -> x*x +, [a..b], ehPrimo x]
-}

--Q4
sumPrimeSquares2 :: Int -> Int -> Int
sumPrimeSquares2 a b | a >= b = 0
                     | otherwise = auxs a b
    where
        auxs :: Int -> Int -> Int
        auxs a b | a > b = 0
                 | ehPrimo a = a*a + auxs (a+1) b
                 | otherwise = auxs (a+1) b

--Q5                  
insert :: Int -> [Int] -> [Int]
insert a [] = [a]
insert x list@(a:as) | x <= a = x:list
                     | otherwise = a:insert x as

--Q6
data Tree = No Int Tree Tree | Folha Int deriving Show

teste1= No 50 (No 25 (No 12 (Folha 6) (Folha 13)) (No 30 (Folha 26) (Folha 32))) (Folha 59)
teste2 = No 100 teste1 (No 200 (Folha 99) (No 298 (Folha 297) (Folha 299)))

ordenada :: Tree -> Bool
ordenada (Folha a) = True
ordenada (No a (Folha b) (Folha c)) | a < b = False
                                    | a > c = False
                                    | otherwise = ordenada (Folha b) && ordenada (Folha c)
ordenada (No a (No b (b1) (b2)) (No c (c1) (c2))) | a < b = False
                                                  | a > c = False
                                                  | otherwise = (percorreNom a (No b (b1) (b2))) && (percorreNoM a (No c (c1) (c2)))
ordenada (No a (Folha b) (No c (c1) (c2))) | a < b = False
                                           | a > c = False
                                           | otherwise = (percorreNom a (Folha b)) && (percorreNoM a (No c (c1) (c2)))
ordenada (No a (No b (b1) (b2)) (Folha c)) | a < b = False
                                           | a > c = False
                                           | otherwise = (percorreNom a (No b (b1) (b2))) && (percorreNoM a (Folha c))
    where
        percorreNom :: Int -> Tree -> Bool
        percorreNom a (Folha b) | a > b = True
                                | otherwise = False
        percorreNom x (No a (a1) (a2)) = percorreNom x a1 && percorreNom x a2
        
        percorreNoM :: Int -> Tree -> Bool
        percorreNoM a (Folha b) | a < b = True
                                | otherwise = False
        percorreNoM x (No a (a1) (a2)) = percorreNoM x a1 && percorreNoM x a2