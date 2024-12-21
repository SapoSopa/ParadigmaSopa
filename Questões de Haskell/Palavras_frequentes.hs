{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Dada uma lista de palavras encontre as três palavras que ocorrem com mais frequência, use a função abaixo como exemplo de assinatura.
palavrasFrequentes :: [String] -> [String]
Algumas regras a serem seguidas:
     - Caso duas palavras tenham a mesma frequência escolha a menor.
     - A posição dos elementos é descrecente, isto é o primeiro é sempre mais frequente.
     - Pode ser que a lista inicial tenha tamanho < 3, nesse caso a lista de saída deverá tamanho < 3 tambem.
<sugestão de main>
main = do
        lista <- getLine
        print $ palavrasFrequentes (read lista :: [String])
Input
Uma lista de strings

Output
Uma lista de strings de tamanho entre [0-3]

Examples
Case: 1
Input
["Prata", "Jamones", "Jamones", "Prata", "HP", "Prata", "Logan", "Jamones", "Logan"]

Output
["Prata","Jamones","Logan"]

Case: 2
Input
["ICO","ICO","ICO"]

Output
["ICO"]
-}

palavrasFrequentes :: [String] -> [String]
palavrasFrequentes lista = take 3 $ ordenaPorFrequencia $ contaFrequencias lista
  where
    contaFrequencias :: [String] -> [(String, Int)]
    contaFrequencias [] = []
    contaFrequencias (x:xs) = (x, 1 + length (filter (== x) xs)) : contaFrequencias (filter (/= x) xs)

    ordenaPorFrequencia :: [(String, Int)] -> [String]
    ordenaPorFrequencia [] = []
    ordenaPorFrequencia xs = map fst (sortPorFrequencia xs)

    sortPorFrequencia :: [(String, Int)] -> [(String, Int)]
    sortPorFrequencia [] = []
    sortPorFrequencia (x:xs) = menores ++ [x] ++ maiores
      where
        menores = sortPorFrequencia [y | y <- xs, snd y > snd x || (snd y == snd x && length (fst y) <= length (fst x))]
        maiores = sortPorFrequencia [y | y <- xs, snd y < snd x || (snd y == snd x && length (fst y) > length (fst x))]

main :: IO ()
main = do
  lista <- getLine
  print $ palavrasFrequentes (read lista :: [String])