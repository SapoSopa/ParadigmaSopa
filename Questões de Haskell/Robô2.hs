{-
Time limit: 200ms
Author: plcecufpe
Valid: true
Solve
Problem Statement

Considere os seguintes tipos:
data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)
Faça a função: "faces :: Direction -> [Command] -> Direction", que recebe a direção inicial do robô e uma lista de comandos e retorna para qual direção o robô estará voltado depois de executar essa lista de comandos.
O robô é controlado por 4 comandos:
Left, para girar sua direção em 90 graus no sentido anti-horário.
Right, para girar sua direção em 90 graus no sentido horário.
Forward seguido de um número N, que indica um avanço de N metros.
Backward seguido de um número N, que indica um retrocesso de N metros.
Utilize a seguinte função main para chamar faces:
main = do
       a <- getLine
       b <- getLine
       let result = faces (read a) (read b)
       print result
Input
Um Direction e uma lista de Comands, um em cada linha

Output
Um Direction

Examples
Case: 1
Input
North
[Forward 2, TurnLeft, TurnLeft, Forward 1]

Output
South
-}

data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)

faces :: Direction -> [Command] -> Direction
faces direcao comando = foldl applyCommand direcao comando
  where
    applyCommand :: Direction -> Command -> Direction
    applyCommand dir TurnLeft = turnLeft dir
    applyCommand dir TurnRight = turnRight dir
    applyCommand dir _ = dir

    turnLeft :: Direction -> Direction
    turnLeft North = West
    turnLeft West = South
    turnLeft South = East
    turnLeft East = North

    turnRight :: Direction -> Direction
    turnRight North = East
    turnRight East = South
    turnRight South = West
    turnRight West = North

main :: IO ()
main = do
  a <- getLine
  b <- getLine
  let direction = read a :: Direction
  let commands = read b :: [Command]
  let result = faces direction commands
  print result