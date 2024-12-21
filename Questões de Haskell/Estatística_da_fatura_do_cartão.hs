{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Considere a fatura anual de um cartão
----------------------------------------
Data;Tipo;Compra;Valor;
14 JAN;Amazon;40.32;
15 JAN;Uber;14.84;
25 JAN;Uber;34.24;
02 FEV;Spotify;8.50;
06 FEV;Uber;6.94;
05 MAR;Burger;29.90;
10 MAR;Burger;24.99;
15 MAR;UCI;19.00;
08 ABR;Itunes;3.50;
13 ABR;Picpay;20.00;
----------------------------------------
Essa fatura é representada pela String:

"14 JAN;Amazon;40.32;15 JAN;Uber;14.84;25 JAN;Uber;34.24;02 FEV;Spotify;8.50;06 FEV;Uber;6.94;05 MAR;Burger;29.90;10 MAR;Burger;24.99;15 MAR;UCI;19.00;08 ABR;Itunes;3.50;13 ABR;Picpay;20.00;"

Escreva a função "minMaxCartao :: String -> (Double, Double)" que recebe uma String referente a fatura anual e retorna uma tupla com o menor e o maior dos valores gastos.
Utilize a seguinte função main para chamar minMaxCartao:
main = do
    a <- getLine
    let result = minMaxCartao a
    print result
Input
Uma string

Output
Uma tupla com dois Double

Examples
Case: 1
Input
14 JAN;Amazon;40.32;15 JAN;Uber;14.84;25 JAN;Uber;34.24;02 FEV;Spotify;8.50;06 FEV;Uber;6.94;05 MAR;Burger;29.90;10 MAR;Burger;24.99;15 MAR;UCI;19.00;08 ABR;Itunes;3.50;13 ABR;Picpay;20.00;

Output
(3.5,40.32)
-}
main :: IO ()
main = do
    a <- getLine
    let result = minMaxCartao a
    print result

minMaxCartao :: String -> (Double, Double)
minMaxCartao str = (minimum valores, maximum valores)
  where
    valores = extrairValores str

extrairValores :: String -> [Double]
extrairValores [] = []
extrairValores str = pegarValores (separar ';' str)
    
pegarValores :: [String] -> [Double]
pegarValores [] = []
pegarValores (x:xs) | isNumber x = read x : pegarValores xs
                    | otherwise = pegarValores xs

separar :: Char -> String -> [String]
separar _ [] = []
separar delim str = parte : if null resto then [] else separar delim (tail resto)
    where
    (parte, resto) = break (== delim) str
    
isNumber :: String -> Bool
isNumber [] = False
isNumber xs = all (`elem` "0123456789.") xs