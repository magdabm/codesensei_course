# Napisz metodę initials , która wypisuje inicjały osoby na podstawie jej pełnego imienia. Wszystkie znaki inicjałów powinny być pisane z dużej litery. Np:
# initials('Jan Kozlowski') #=> 'JK'
# initials('Jan Krzysztof Rakoczy') #=> 'JKR'
# initials('marcin nowak') #=> 'MN'


def initials(string)
  name = string.chomp.split
  init = ""
  name.each do |elem|
    init += elem[0]
  end
  init.upcase
end

puts initials("Jan Nowak Jeziorański")
puts initials("szach mat")
puts initials("Morus")
puts initials("Imię imię nazwisko Nazwisko")
