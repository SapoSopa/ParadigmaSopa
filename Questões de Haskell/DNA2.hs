{-
Time limit: 1000ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

O ano é 2048 e foram descobertos fósseis de três animais do período jurássico inéditos o Cisnal, um ancestral do cisne, o iguanoide, similiaridade forte com uma iguana, mas 10x maior e o narvale um animal que é o ancestral mais antigo do narvalo. O laboratório KMVII conseguiu dois envelopes com amostras, do que aparenta ser DNA extraído dos fósseis descobertos, você trabalha como estagiário/a no KMVII e te incubiram de catalogar quantas amostras são de fato um desses raros animais.
Para resolver tal problema você sabe ainda de uma curiosa propriedade sobre as amostras, se você modelar cada envelope como uma lista de palavras então a primeira palavra do envelope0 corresponde ao DNA da primeira palavra do envelope1 e consequentemente a i-ésima-palavra do envelope 0 corresponde ao DNA da iésima-palavra do envelope 1.
Infelizmente a técnica de amostragem utilizada pelo laboratório apresenta um peculiar problema e portanto não há garantia que a j-ésima-palavra do envelope 0 é de fato igual ao da jésima-palavra do envelope 1, logo impossível de afirmar com certeza que para a jésima-palavra temos o DNA de um dos animais previamente mencionados. Isto se deve ao fato que palavras no mesmo index não necessariamente tem o mesmo tamanho e ainda por cima um envelope pode conter mais amostras que outros, isto é numa das amostragens algumas amostras foram destrúidas.
Além do previamente mencionado você sabe devido ao estudo de álgebra linear/geometria analítica do operador produto escalar de dois vetores e como eles podem computar o grau de similiaridade de dois vetores se fizermos uma pequena variação: compute o produto escalar dos dois vetores e divida o resultado pelo tamanho do maior vetor. Assim você consegue obter um valor entre 0.0 e 1.0 e fazer o mapeamento como deseja.
Munido do que foi dito acima e sabendo da seguinte tabela de conversão, a saída do seu programa deve gerar uma lista com três elementos onde cada posição da lista corresponde respectivamente ao número de amostras que de fato correspondem a um cisnal, Iguanoide e Narvale.

  TABELA               i >= 0.1 && i <= 0.3      i >= 0.4 && i <= 0.7         i >= 0.8
  P(Cisnal)       |        1.0           |          0.0         |       0.0
  P(Iguanoide)    |        0.0           |          1.0         |       0.0
  P(Narvale)      |        0.0           |          0.0         |       1.0
OBS1: P é a probabilidade de ser DNA daquele animal, i é o grau de similidaridade.
OBS2: Para computar o produto escalar, compare cada i-ésimo char de uma j-ésima palavra do envelope0 com o i-ésimo char da j-ésima palavra do envelope1, para cada comparação retorne 1.0 se iguais ou 0.0 se distintos, some os valores retornados.
Considere o seguinte tipo algébrico:
data Animal = Cisnal | Iguanoide | Narvale | Null
  deriving (Eq, Show)
E a seguinte assinatura

dna2 :: [String] -> [String] -> [Int]

OBS3: Sugestão de main
main = do
  firstExtract <- words <$> getLine                       -- equivalente a (read firstExtract :: [String])
  secondExtract <- words <$> getLine
  let result = dna2 firstExtract secondExtract
  print result

OBS4: Exemplo de cálculo do produto escalar:
    "Viverqa" "Toverl"
    V==T?0.0
    i==o?0.0
    v==v?1.0
    e==e?1.0
    r==r?1.0
    q==l?0.0
    a=="?0.0
    0.0+0.0+1.0+1.0+1.0+0.0+0.0=3.0

Input
Duas listas de palavras, note que uma lista pode ser menor que a outra.

Output
Uma lista com três inteiros.

Examples
Case: 1
Input

Output
[0,0,0]

Case: 2
Input
UTHUNOHUNOHU HUNHOUHNOHUOHOUH NHUNHOUTECUTTUUNOHUH NHONUHHOUTHOHHUTOCUUTUNT TOHUHUNHHUOUH THUOTNUHHOHUHOHUHTH HOUHHOTUHOHTUHHOUH OTUHOHUHTOHTUHTHOUHN
UTHONUHNOTOu HUTNOEHUNHHueuhnh othutnouhUTNEHUHNHO ohuhohuhtUHEOUHNTONHeott TUNHENTUHuehu uhohntuhHUHENUTNHNH THUTNEHHteuhehUTEH TNUHTNETHNHENHUHNUHEN

Output
[5,1,0]

Case: 3
Input
312903 19038 912 81239 183 1838 913 81908389 19 918938 1829 39019 381098 93 81838 1903 810 38103 0813 18 0380 810
9013 231263 12 3712 1726 183 938123 637 638 80819083 16323 761223 78168 10 09818 1 76 2332 2323 23413 23 23234

Output
[7,1,0]

Case: 4
Input
TEONTUthuo toutuhHEHUNHUH tocontahurc hotnuhonuhc egucroegur thTHUERCNTOHUTH cgurohtnhou43234 houhoeu9903.ouhnhuhh
nuhontuhgcr outhoenthuHUHNE ohuntoccr onhunRCGRG ecug324324 oguroe123123hnhu oeuhntohenuhn3324

Output
[2,0,0]
-}

data Animal = Cisnal | Iguanoide | Narvale | Null deriving (Eq, Show)

produtoEscalar :: String -> String -> Double
produtoEscalar xs ys = sum [if x == y then 1.0 else 0.0 | (x, y) <- zip xs ys]

grauSimilaridade :: String -> String -> Double
grauSimilaridade xs ys = produtoEscalar xs ys / fromIntegral (max (length xs) (length ys))

classificarAnimal :: Double -> Animal
classificarAnimal i
  | i >= 0.1 && i <= 0.3 = Cisnal
  | i >= 0.4 && i <= 0.7 = Iguanoide
  | i >= 0.8             = Narvale
  | otherwise            = Null

dna2 :: [String] -> [String] -> [Int]
dna2 xs ys = [count Cisnal, count Iguanoide, count Narvale]
  where
    similaridades = [grauSimilaridade x y | (x, y) <- zip xs ys]
    animais = map classificarAnimal similaridades
    count animal = length (filter (== animal) animais)

main :: IO ()
main = do
  firstExtract <- words <$> getLine
  secondExtract <- words <$> getLine
  let result = dna2 firstExtract secondExtract
  print result