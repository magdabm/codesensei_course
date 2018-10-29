# Zaimplementuj funkcję, która wypisze, który z graczy wygrywa w grze papier, kamień, nożyce. Funkcja powinna przyjmować dwa argumenty odpowiadające wyborom graczy i działać w następujący sposób:
# rps('scissors', 'paper') #=> 'Gracz 1 wygrywa'
# rps('rock', 'paper') #=> 'Gracz 2 wygrywa'
# rps('scissors', 'scissors') #=> 'Remis'


def rps(arg1, arg2)
  if arg1 == arg2
    puts "Remis"
  elsif (arg1 == "paper" && arg2 == "rock") || (arg1 == "scissors" && arg2 == "paper") || (arg1 == "rock" && arg2 == "scissors")
    puts "Gracz 1 wygrywa"
  else
    puts "Gracz 2 wygrywa"
  end
end

rps("scissors", "scissors")
rps("rock", "paper")
rps("scissors", "paper")
