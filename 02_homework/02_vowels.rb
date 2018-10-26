# Napisz funkcję obliczającą ilość samogłosek w podanym ciągu znaków. Jako samogłoski uznajemy: a, e, i, o, u oraz y. Np:
# vowel_count("test") #=> 1
# vowel_count("foobar") #=> 3


def vowel(string)

  array_string = string.downcase.chars

  vowels = ["a", "e", "i", "o", "u", "y"]

  counter = 0

  array_string.each do |elem|
    if vowels.include?(elem)
      counter += 1
    end
  end
  counter
end

puts vowel("test")
puts vowel("foobar")
puts vowel("a coś dłuższego?")
puts vowel("a UPCASE?")  # po dodaniu metody .downcase do stringa przed .chars :)

# jeśli w bloku jest najpierw array, a w if jest vowels działa ok, jeżeli na odwr odwrót - zlicza tylko rodzaje samogłosek zamiast wszystkich
