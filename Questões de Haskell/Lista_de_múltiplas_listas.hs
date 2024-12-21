{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Crie a função "somarMultiplos :: [Int] -> Int -> [Int]" que recebe 1 lista de inteiros e um inteiro M, e retorna uma lista com a soma dos termos dos elementos de cada número na lista que são multiplos de M menores que o elemento da lista.

Ex:
Input
[5, 10, 15] 3
A lista retornada é:
[3, 18, 45] 
-> 3 = 3
-> 3 + 6 + 9 = 18
-> 3 + 6 + 9 + 12 + 15 = 45

Note que o único múltiplo de 3 <= 5 é o próprio 3;
Note que os múltiplos de 3 <= 10 são 3,6 e 9;
Note que os múltiplos de 3 <= 15 são 3,6,9,12 e 15;
Caso M seja maior que um elemento da lista, a saída deve ser 0. Se o número M for 0, a saída também deve ser 0;

Utilize a seguinte função main para chamar somarMultiplos:
main = do
    lista <- getLine
    let readList = read lista :: [Int]
    num <- getLine
    let readNum = read num :: Int
    let result = somarMultiplos readList readNum
    print result
Input
Lista de números e inteiro

Output
Lista de números

Examples

Case: 1
Input
[5, 10, 15]
3

Output
[3,18,45]

Case: 2
Input
[-1, -2, -3]
2

Output
[0,0,0]

Case: 3
Input
[15, 1, 4]
2

Output
[56,0,6]
-}
main :: IO ()
main = do
    lista <- getLine
    let readList = read lista :: [Int]
    num <- getLine
    let readNum = read num :: Int
    let result = somarMultiplos readList readNum
    print result
    where
        somarMultiplos :: [Int] -> Int -> [Int]
        somarMultiplos [] _ = []
        somarMultiplos (x:xs) 0 = 0 : somarMultiplos xs 0
        somarMultiplos (x:xs) m | m > x = 0 : somarMultiplos xs m
                                | otherwise = (somaDosMultiplos m x 0 m) : somarMultiplos xs m
            where
                somaDosMultiplos m x n o| m > x = n
                                        | otherwise = somaDosMultiplos (m + o) x (n + m) o