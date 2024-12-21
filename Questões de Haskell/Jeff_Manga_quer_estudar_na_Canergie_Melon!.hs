{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Conversão de Sistemas de Notas*
Jeff Manga é um aluno brasileiro que se mudou para os EUA na parte final do seu Ensino Médio. Ele recentemente recebeu os resultados das provas que ele realizou já em território americano e essas notas servirão de avaliação pra Jeff ingressar em alguma faculdade dos EUA.
Porém, há um detalhe: Jeff não sabe como calcular a média das notas do sistema de avaliação dos EUA, pois ele é alfabético ('A', 'B', 'C', 'D', 'F' e considera subvariantes compostas pelos sufixos '+' ou '-', exceto na nota 'F'). Na dúvida, ele decidiu converter, simplificadamente, para o sistema numérico. Jeff Manga sabe que o sistema alfabético corresponde a intervalos numéricos (ex: 'A' é um intervalo entre 10 e 9), então ele decidiu converter cada nota para o seu respectivo limite inferior de cada intervalo, mais precisamente: 'A+' = 9.7; 'A' = 9.3 e 'A-' = 9.0. As notas B, C e D derivam das notas A's, sendo: B = A - 1, C = B - 1 e D = C - 1 (inclusas, também, as subvariantes: "B-" = "A-" - 1, "D+" = "C+" - 1, por exemplo), e F = 5.9.)
Jeff Manga possui um lista de faculdades desejadas e, para saber em quantas ele é selecionável, decidiu calcular a média de suas notas convertidas para valores numéricos e, após isso, reconverter esta média para o sistema alfabético: Se a média for >= 9.7, então ela será convertida para "A+"; se for >= 9.3 e < 9.7, então ela será convertida para "A"; por fim, se for >= 9.0 e < 9.3, ela será convertida para "A-". Novamente, a lógica da conversão das notas B, C e D derivam das notas A's, subtraindo 1; e uma média < 6 será convertida para a nota F.
Main sugerida para resolver o problema:
main = do
    a <- getLine
    b <- getLine
    print (contagemNotas (read a) (read b))
Onde deve-se criar a função:
contagemNotas :: [String] -> [String] -> Int
PS: Como o nome já sugere, essa main e essa função são sugestões, não uma obrigatoriedade. Contanto que o output do seu código esteja correto, sinta-se livre para desenvolver outra main e outras funções, caso seja mais conveniente para você.

Input
O input consiste de duas Listas de Strings: a primeira corresponde às notas tiradas por Jeff e a segunda corresponde às notas de corte das faculdades de determinado estado desejadas por ele.
Output
O output consiste em um Inteiro: a quantidade de faculdades nas quais Jeff é um potencial candidato válido, ou seja, que sua média reconvertida é maior ou igual que as respectivas notas de corte das faculdades em questão.

Examples
Case: 1
Input
["A+", "B+", "D", "D-", "F", "A-", "B-", "A-"]
["A+", "C", "D", "D", "B", "A-"]

Output
3

Case: 2
Input
["A+", "C-", "B", "F", "D", "C"]
["C-", "A-", "A", "B+", "D-", "C+", "B"]

Output
2
-}

notaParaNumero :: String -> Float
notaParaNumero "A+" = 9.7
notaParaNumero "A"  = 9.3
notaParaNumero "A-" = 9.0
notaParaNumero "B+" = 8.7
notaParaNumero "B"  = 8.3
notaParaNumero "B-" = 8.0
notaParaNumero "C+" = 7.7
notaParaNumero "C"  = 7.3
notaParaNumero "C-" = 7.0
notaParaNumero "D+" = 6.7
notaParaNumero "D"  = 6.3
notaParaNumero "D-" = 6.0
notaParaNumero "F"  = 5.9
notaParaNumero _    = error "Nota inválida"

numeroParaNota :: Float -> String
numeroParaNota n
    | n >= 9.7  = "A+"
    | n >= 9.3  = "A"
    | n >= 9.0  = "A-"
    | n >= 8.7  = "B+"
    | n >= 8.3  = "B"
    | n >= 8.0  = "B-"
    | n >= 7.7  = "C+"
    | n >= 7.3  = "C"
    | n >= 7.0  = "C-"
    | n >= 6.7  = "D+"
    | n >= 6.3  = "D"
    | n >= 6.0  = "D-"
    | otherwise = "F"

calculaMediaNotas :: [String] -> Float
calculaMediaNotas notas = media
  where
    notasNumericas = map notaParaNumero notas
    media = sum notasNumericas / fromIntegral (length notasNumericas)

contagemNotas :: [String] -> [String] -> Int
contagemNotas notasJeff notasCorte = length $ filter id $ zipWith (<=) notasCorteConvertidas (repeat media)
  where
    media = calculaMediaNotas notasJeff
    notasCorteConvertidas = map notaParaNumero notasCorte

main :: IO ()
main = do
  a <- getLine
  b <- getLine
  print (contagemNotas (read a) (read b))