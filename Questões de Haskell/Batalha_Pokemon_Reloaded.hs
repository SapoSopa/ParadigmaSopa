{-
Time limit: 2000ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Biu capturou um Charmander! Ele descobriu que seu pokemón tem uma habilidade especial depois de algumas batalhas, ele leva vantagem contra pokemóns que possui CPs(Combat Power) determinados. Para o Charmander vencer a batalha, seu oponente deve ter CP com seguintes características:
CP deve possuir 4 dígitos; Sendo o CP representado pelas letras ABCD, onde cada letra representa um dígito. O Charmander só vencerá a partida caso (A*B - C*D)^2 < (A*B*C*D).
Sua tarefa é escrever um programa que ajude Biu a escolher melhor os oponentes para que seu Charmander saia sempre vitorioso.

Input

C - número inteiro positivo.
A linha única de entrada é composta pelo CP do oponente.

Output

R - string
A linha única de saída é composta pelo resultado da batalha, com uma das mensagens:
"Charmander vitorioso" "Charmander derrotado"

Examples

Case: 1

Input
5321

Output
"Charmander derrotado"
-}

-- Resolução:
main :: IO ()
main = do
    input <- getLine
    let cp = read input :: Int
    let result = cpCheck cp
    putStrLn result
    
cpCheck :: Int -> String
cpCheck cp  | ((a * b) - (c * d))^2 < (a * b * c * d) = "Charmander vitorioso"
            | otherwise = "Charmander derrotado"
    where
        a = div cp 1000
        b = mod (div cp 100) 10
        c = mod (div cp 10) 10
        d = mod cp 10
    