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
