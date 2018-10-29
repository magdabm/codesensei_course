# Pangram to zdanie, w którym przynajmniej raz pojawia się każda litera alfabetu. Napisz metodę, która sprawdzi czy podany ciąg znaków jest pangramem dla języka polskiego. Np:
# pangram?('Dość błazeństw, żrą mój pęk luźnych fig') #=> true
# pangram?('Losowy ciąg znaków') #=> false

def pangram?(input)
  input = input.downcase.chars
  alphabet = ["a", "ą", "b", "c", "ć", "d", "e", "ę", "f", "g", "h", "i", "j", "k", "l", "ł", "m", "n", "ń", "o", "ó", "p", "r", "s", "ś", "t", "u", "w", "y", "z", "ź", "ż"]
  common_letters = []
  alphabet.each do |elem|
    if input.include?(elem)
      common_letters << elem
    end
  end
  common_letters == alphabet
end

puts pangram?('Dość błazeństw, żrą mój pęk luźnych fig')
puts pangram?('Losowy ciąg znaków')
puts pangram?("abcdefg")
