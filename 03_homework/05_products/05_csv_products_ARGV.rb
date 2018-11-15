require "csv"   # ten zapis wczytuje do tego pliku możliwość używania rozszerzenia csv / metod na csv (?)
require "./19A_CSV_product_require.rb"   # ten zapis jest odwołaniem do innego pliku, informuje że do wykonania kodu w tym pliku potrzebne są dane zawarte w powyższym pliku
require "./19B_CSV_products_list_require.rb"

products_list = ProductsList.new

if ARGV[0] == "-f"
  product = products_list.find_product(ARGV[1])
  puts "#{product.name}: #{product.price} zł"
else
  puts "USAGE: ruby products.rb FUNCTION ARGUMENT"
end

if ARGV[0] == "-gt"
  products = products_list.find_bigger_price(ARGV[1].to_f)
  puts "Products with bigger price than '#{ARGV[1]}':"
  products.each do |product|
     puts "#{product.name}: #{product.price} zł"
  end
else
  puts "USAGE: ruby products.rb FUNCTION ARGUMENT"
end

if ARGV[0] == "-lt"
  products = products_list.find_lower_price(ARGV[1].to_f)
  puts "Products with lower price than '#{ARGV[1]}':"
  products.each do |product|
     puts "#{product.name}: #{product.price} zł"
  end
else
  puts "USAGE: ruby products.rb FUNCTION ARGUMENT"
end

if ARGV[0] == "-c"
   products = products_list.euro_converse(ARGV[1].to_f)
   

else
puts "USAGE: ruby products.rb FUNCTION ARGUMENT"
end
