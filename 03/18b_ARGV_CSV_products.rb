require "csv"

class Product
  attr_reader :name, :price, :weight

  def initialize(name, price, weight)
    @name = name
    @price = price
    @weight = weight
  end
end

class ProductsList
  attr_writer :products

  def initialize
     @products = []
  end

  def parse
     @products = csv_data.map do |elements|
        Product.new(elements[0], elements[1].to_f, elements[2].to_f)
     end
  end

  def products
     if @products.count == 0
        parse
     else
        @products
     end
  end

  def find_product(name)   # metoda do ARGV
    products.find { |product| product.name == name }
  end

  private

  def file
    @file ||= File.read("products.csv")
  end

  def csv_data
    csv_array = CSV.parse(file)
    csv_array.shift
    csv_array
  end
end

products_list = ProductsList.new

if ARGV[0] == "-f"
  product = products_list.find_product(ARGV[1])
  puts "#{product.name}: #{product.price} zł"
else
  puts "USAGE: ruby products.rb FUNCTION ARGUMENT"
end
