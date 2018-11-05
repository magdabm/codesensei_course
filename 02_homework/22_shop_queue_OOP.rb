# W supermarkecie ludzie ustawiają się w jedną długą kolejkę i proszeni są kolejno do wolnej kasy.
# Twoim zadaniem jest napisać funkcję queue_time, która przyjmuje:
# • tablicę liczb całkowitych - czasy obsługi poszczególnych klientów
# • liczbę całkowitą - ilość dostępnych kas.
# Funkcja powinna zwracać czas potrzebny na obsłużenie wszystkich klientów supermarketu.
# Pamiętaj że:
# - istnieje tylko jedna kolejka
# - kolejność klientów w kolejce nie zmienia się
# - pierwsza osoba w kolejce podchodzi do pierwszej wolnej kasy
# Przykłady:
# queue_time([5,3,4], 1) #=> 12
# Istnieje tylko jedna kasa, więc całkowity czas jest sumą czasów wszystkich klientów.
# queue_time([10, 2, 3, 3], 2) #=> 10
# W supermarkecie znajduje się dwie kasy, druga, trzecia i czwarta osoba wyjdzie ze sklepu przed pierwszą.
#  queue_time([2, 3, 10], 2) #=> 12


# !!! rozwiązanie tylko dla 1 lub 2 kas

def queue_time(clients, checkouts)
  checkouts_state = Array.new(checkouts, 0)
  sum_time = 0

  while clients.length > 0 || checkouts_busy(checkouts_state)
    checkouts.times do |checkout|
      if checkouts_state[checkout] == 0 && clients.length > 0
        checkouts_state[checkout] = clients.shift
      end
      checkouts_state[checkout] -= 1
    end
    sum_time += 1
  end
  sum_time
end

def checkouts_busy(checkouts_state)
  checkouts_state.map do |checkout|
    if checkout > 0
      true
    else
      false
    end
  end.any?
end

puts queue_time([5, 3, 4], 1)
puts queue_time([10, 2, 3, 3], 2)
puts queue_time([2, 3, 10], 2)
