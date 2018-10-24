names = ["Antoni",
"Jakub",
"Jan",
"Szymon",
"Aleksander",
"Franciszek",
"Filip",
"Wojciech",
"Mikołaj",
"Kacper"]

names.each do |name|
  puts name if name.length > 5
end

# lub, ale stracimy dane, będzie nil przy wywołaniu... -> chociaż w irb, po wywołaniu dalej dane takie same imiona, a nie "nil", (!ale gdy zamienimy na metodę map, imiona zostaną stracone, bez względu na wcześniejsze przypisanie do zmiennej)
# (nie używać bloku bezpośrednio na danych, wcześniej lepiej przypisać do zmiennej)

names = ["Antoni",
"Jakub",
"Jan",
"Szymon",
"Aleksander",
"Franciszek",
"Filip",
"Wojciech",
"Mikołaj",
"Kacper"].each do |name|
  puts name if name.length > 5
end
