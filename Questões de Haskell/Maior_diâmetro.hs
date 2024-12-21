{-
Time limit: 1000ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

diâmetro de uma arvore
Dado o seguinte tipo algébrico:
data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)
Escreva a função: "maiorDiametro :: Ord t => Tree t -> Int", que calcula o maior diâmetro de uma arvore. o diâmetro de uma árvore e maior distância entre entre dois nós.
Utilize a seguinte função main para chamar maiorDiametro:
main = do
       s <- getLine
       let result = maiorDiametro (read s::Tree Int)
       print result
Input
Uma árvore de inteiros

Output
Um inteiro

Examples
Case: 1
Input
(Node 5 (Node 3 (Node 2 Nilt Nilt) (Node 4 Nilt Nilt)) (Node 6 Nilt (Node 7 Nilt Nilt)))

Output
5
-}
data Tree t = Nilt | Node t (Tree t) (Tree t) deriving (Read)

altura :: Tree t -> Int
altura Nilt = 0
altura (Node _ esq dir) = 1 + max (altura esq) (altura dir)

diametro :: Tree t -> Int
diametro Nilt = 0
diametro (Node _ esq dir) = max (max (diametro esq) (diametro dir)) (1 + altura esq + altura dir)

maiorDiametro :: Tree t -> Int
maiorDiametro = diametro

main :: IO ()
main = do
    s <- getLine
    let result = maiorDiametro (read s :: Tree Int)
    print result