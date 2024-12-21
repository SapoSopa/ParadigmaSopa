{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Crie a função "mul2 :: [Int] -> [Int] -> [Int]" que recebe 2 listas de inteiros e retorna uma lista com o produto elemento por elemento entre as duas listas.
Caso as listas não tenham o mesmo tamanho multiplique por 0 os elementos restantes.
Utilize a seguinte função main para chamar mul2:
main = do
    sa <- getLine
    let a = read sa :: [Int]
    sb <- getLine
    let b = read sb :: [Int]
    let result = mul2 a b
    print result
Input
A entrada é composta por 2 listas de inteiros, uma em cada linha.

Output
A saída é uma lista de inteiros.

Examples
Case: 1
Input
[1,2,3]
[3,3,3]

Output
[3,6,9]

Case: 2
Input
[1,2]
[4,5,6]

Output
[4,10,0]
-}
main :: IO ()
main = do
    sa <- getLine
    let a = read sa :: [Int]
    sb <- getLine
    let b = read sb :: [Int]
    let result = mul2 a b
    print result

mul2 :: [Int] -> [Int] -> [Int]
mul2 [] [] = []
mul2 [] (b:bs) = 0 : mul2 [] bs
mul2 (a:as) [] = 0 : mul2 as []
mul2 (a:as) (b:bs) = a*b : mul2 as bs
