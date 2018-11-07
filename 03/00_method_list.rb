# Napisz metodę, która przyjmuje jako parametr dowolny obiekt i wypisująca na ekran wszystkie metody jakie można na nim wywołać.

def mmethods(object)
  object.methods.inspect
end

puts mmethods([1, 2, 3])
puts mmethods("hello")

# metoda nie może mieć takiej sama nazwy jak wbudowana metoda!

# tu metoda zlicza ilość dostępnych metod dla zadanego obiektu

def mmethods(object)
  object.methods.size
end

puts mmethods([1, 2, 3])
puts mmethods("hello")
