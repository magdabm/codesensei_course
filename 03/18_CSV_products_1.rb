require "csv"

class Product
  attr_reader :name, :price, :weight

  def initialize(name, price, weight)
    @name = name
    @price = price
    @weight = weight
  end
end

csv_content = File.read("products.csv")
puts csv_content.inspect
csv_array = CSV.parse(csv_content)
puts csv_array.inspect
csv_array.shift

products = csv_array.map do |elements|
  Product.new(elements[0], elements[1].to_f, elements[2].to_f)
end

puts products.inspect
