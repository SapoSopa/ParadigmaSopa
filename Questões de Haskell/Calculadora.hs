{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Crie a função 
type Comando = String
type Valor = Int
executa :: [(Comando, Valor)] -> Int
que recebe uma lista de tuplas com comandos e valores.
A função deve começar pelo valor 0. Por exemplo, caso a sequência de comandos seja "[("Multiplica", 2), ("Soma", 5), ("Subtrai", 3)]" a função deve pegar 0 e efetuar as seguintes operações: (((0 * 2) + 5) - 3).
Esses comandos podem ser "Multiplica", "Soma", "Subtrai" ou "Divide". Para o caso de uma divisão por 0, a função deve retornar o valor -666 independente de quanto tenha calculado até essa divisão;
Utilize a seguinte função main para chamar executa:
main = do
    a <- getLine
    let result = executa (read a)
    print result

Input
Lista de tuplas contendo uma String e um Inteiro

Output
Um Inteiro

Examples
Case: 1
Input
[("Multiplica", 2), ("Soma", 5), ("Subtrai", 3)]

Output
2

Case: 2
Input
[("Multiplica", 2), ("Soma", 5), ("Divide", 0)]

Output
-666
-}
type Comando = String
type Valor = Int

main :: IO ()
main = do
    a <- getLine
    let result = executa (read a)
    print result
    where
        executa :: [(Comando, Valor)] -> Int
        executa operacoes = op operacoes 0
            where
                op [] r = r
                op ((comando,valor):xs) r   | comando == "Multiplica" = op xs (r * valor)
                                            | comando == "Soma" = op xs (r + valor)
                                            | comando == "Subtrai" = op xs (r - valor)
                                            | comando == "Divide" = divisao r valor xs
                                            | otherwise = 0 
                    where
                        divisao _ 0 _ = -666
                        divisao x y xs = op xs (div x y)