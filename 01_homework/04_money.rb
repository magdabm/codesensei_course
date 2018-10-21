puts "Enter the amount of money [$]:"
dol = gets.to_f

puts "Enter the exchange rate [for PLN]:"
ex = gets.to_f

pln = dol * ex

puts "#{dol} $ after conversion at a rate of #{ex} is: #{pln} PLN."


# 4. Algorytm wczytujący ilość pieniędzy w $, kurs kupna dolara w zł i zamieniający podaną wartość w $ na zł. Np. dla 20$ i kursu 3.60zł algorytm wypisze 72zł.


# czy jeżeli użytkownik wprowadzi wartość z przecinkiem, program może to wychwycić i odkręcić, żeby obliczyć prawidłowo??
