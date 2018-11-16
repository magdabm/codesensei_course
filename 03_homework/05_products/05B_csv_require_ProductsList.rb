require 'csv'

class ProductsList
  attr_writer :products, :euro_products

  def initialize
    self.products = []
  end

  def parse
    self.products = csv_data.map do |elements|
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

  def find_product(name)
    products.find { |product| product.name == name }
  end

  def find_lower_price(price)
    products.find_all { |product| product.price < price }
  end

  def find_bigger_price(price)
    products.find_all { |product| product.price > price }
  end

  def euro_converse(exchange, currency)
     @eur_products = []
     products.each do |product|
        @eur_products << ["#{product.name}, #{(product.price*exchange).round(2)} #{currency}, #{product.weight}"]
     end
     @eur_products
  end

  def create_eur_csv(file_name)
     CSV.open("#{file_name}", "w+") do |csv|
         @euro_products.each { |product| csv << product }
     end
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
