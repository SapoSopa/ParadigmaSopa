{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Dados os seguintes tipos algébricos
data Ops = SUM | MUL | SUB
           deriving (Read)

data IntTree = Nilt Int |
               Node Ops IntTree IntTree
               deriving (Read)
Escreva a função: "evalTree :: IntTree -> Int", que calcula o valor resultante das operações na árvore dada.
As operações podem ser:
SUM = Soma
SUB = Subtração
MUL = Multiplicação
Utilize a seguinte função main para chamar evalTree:
main = do
    s <- getLine
    let result = evalTree (read s)
    print result
Input
Um IntTree

Output
Um Int

Examples
Case: 1
Input
(Node SUM (Node MUL (Nilt 5) (Nilt 3)) (Node SUB (Nilt 10) (Nilt 5)))

Output
20
-}

data Ops = SUM | MUL | SUB
           deriving (Read)

data IntTree = Nilt Int |
               Node Ops IntTree IntTree
               deriving (Read)

evalTree :: IntTree -> Int
evalTree (Nilt n) = n
evalTree (Node op left right) =
    case op of
        SUM -> evalTree left + evalTree right
        SUB -> evalTree left - evalTree right
        MUL -> evalTree left * evalTree right

main :: IO ()
main = do
    s <- getLine
    let result = evalTree (read s)
    print result
