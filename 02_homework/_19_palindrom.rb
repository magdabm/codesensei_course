# Palindrom – wyrażenie brzmiące tak samo czytane od lewej do prawej i od prawej do lewej. Przykładem palindromu jest: “Kobyła ma mały bok”. Napisz funkcję palindrome?, która otrzymuje ciąg znaków i zwraca wartość logiczną ( true / false ) w zależnośći czy dany ciąg jest palindromem. Np:
# palindrome?('Kobyła ma mały bok') #=> true
# palindrome?('kajak') #=> true
# palindrome?('kajak i wiosło') #=> false

def palindrome?(input)
  normalized_input = input.downcase.split.join
  normalized_input == normalized_input.reverse
end

puts palindrome?('ej i po pracy car popije')
