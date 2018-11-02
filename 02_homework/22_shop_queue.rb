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

def queue_time(times, n)
  i = 2
  if n == 1
    result = times.sum
  else n == 2
    queue1 = []
    queue2 = []
    queue1 << times[0]
    queue2 << times[1]
    while i < times.length
      if queue1.sum > queue2.sum
        queue2 << times[i]
      else
        queue1 << times[i]
      end
      i += 1
    end
    if queue1.sum > queue2.sum
      result = queue1.sum
    else
      result = queue2.sum
    end
  end
  result
end

puts queue_time([5,3,4], 1) #=> 12
puts queue_time([10, 2, 3, 3], 2) #=> 10
puts queue_time([2, 3, 10], 2) #=> 12
