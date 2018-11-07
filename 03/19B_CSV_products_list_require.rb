class ProductsList
  attr_writer :products

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
