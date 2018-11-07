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


def queue_time(times, n)
   cash_array =  [0] * n
   times.each do |time|
      cash_array[cash_array.find_index(cash_array.min)] += time
   end
   cash_array.max
end
puts queue_time([5, 3, 4], 1)
puts queue_time([10, 2, 3, 3], 2)
puts queue_time([2, 3, 10], 2)

# [0,0]
# 10
# [10, 0]
# 2
# [10, 2]
# 3
# [10, 5]
# 3
# [10, 8]


def queue_time(kolejka, liczba_kas)
   kasy = []
   liczba_kas.times{ kasy.push(0) }
   i = 0
   kolejka.each do |cz|
      kasy[min_index(kasy)] += cz
   end
"#{kasy[max_index(kasy)]}"
end

puts queue_time([5, 3, 4], 1)
puts queue_time([10, 2, 3, 3], 2)
puts queue_time([2, 3, 10], 2)
