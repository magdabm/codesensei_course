puts "Calculation assumptions:"
puts "fuel price 1 l = 4,30 PLN"
puts "fuel consuption 6,5 l / 100 km"

puts "Enter the distance:"
dis = gets.to_i

cons = 6.5
price = 4.30

consx = cons.to_f * dis / 100
pricex = consx * price.to_f

puts "For #{dis} km distance:"
puts "Fuel consuption: #{consx} l."
puts "Fuel price: #{pricex} PLN."



# 5. Algorytm, który wczytuje dystans (w km) do pokonania i wyliczający zużycie paliwa (w l) i koszt (w zł) przejechania go. Załóż, że samochód spala 6.5 litra benzyny na 100 km. 1 litr benzyny kosztuje 4.30zł. Np. dla dystansu 150km algorytm wypisze "Zużycie paliwa: 9.75l" oraz "Koszt: 41,925zł".
