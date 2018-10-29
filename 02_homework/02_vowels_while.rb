# Napisz funkcję obliczającą ilość samogłosek w podanym ciągu znaków. Jako samogłoski uznajemy: a, e, i, o, u oraz y. Np:
# vowel_count("test") #=> 1
# vowel_count("foobar") #=> 3


def vowel(string)
  string = string.downcase.chars
  i = 0
  sum = 0
  while i < string.length
    sum += 1 if string[i] == "a" || string[i] == "e" || string[i] == "i" || string[i] == "o" || string[i] == "u" || string[i] == "y"
    i += 1
  end
sum
end

puts vowel("test")
puts vowel("foobar")
puts vowel("a coś dłuższego?")
puts vowel("a UPCASE?")
