{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Uma sentença é uma sequência de palavras separadas por um único espaço, em que cada palavra consiste apenas de letras. Uma palavra é incomum se aparecer exatamente uma vez em uma das frases e não aparecer na outra frase. As palavras não diferenciam letras maiúsculas de minúsculas, portanto, "Banana" é o mesmo que "banana". Dadas duas sentenças s1 e s2 , retorne uma lista de todas as palavras incomuns em letras minúsculas em ordem alfabética
main = do
    sentence_1 <- getLine
    sentence_2 <- getLine
    let result = uncommonFromTwoSentences sentence_1 sentence_2
    print result
Input
-As sentenças s1 e s2 tem pelo menos um caractere.
-s1 e s2 consistem em letras e espaços em inglês.
-s1 e s2 não têm espaços à esquerda ou à direita.
-Todas as palavras em s1 e s2 são separadas por um único espaço.

Output
O formato de saída é definido como uma lista de strings contendo as palavras incomuns em ordem alfabética e escritas com letras minúsculas

Examples
Case: 1
Input
a banana esta verde
a banana esta amarela

Output
["amarela","verde"]

Case: 2
Input
esta Banana eh vErde
esta bAnAnA eh Amarela

Output
["amarela","verde"]
-}

toLowerStr :: String -> String
toLowerStr = map toLower
  where
    toLower c
      | 'A' <= c && c <= 'Z' = toEnum (fromEnum c + 32)
      | otherwise = c

uncommonFromTwoSentences :: String -> String -> [String]
uncommonFromTwoSentences s1 s2 = sort $ filter eIncomum todasAsPalavras
  where
    words1 = map toLowerStr (words s1)
    words2 = map toLowerStr (words s2)
    todasAsPalavras = words1 ++ words2
    eIncomum w = (count w words1 == 1 && count w words2 == 0) || (count w words2 == 1 && count w words1 == 0)

count :: Eq a => a -> [a] -> Int
count x = length . filter (== x)

sort :: [String] -> [String]
sort [] = []
sort (x:xs) = sort [y | y <- xs, y <= x] ++ [x] ++ sort [y | y <- xs, y > x]

main :: IO ()
main = do
    sentence1 <- getLine
    sentence2 <- getLine
    let result = uncommonFromTwoSentences sentence1 sentence2
    print result