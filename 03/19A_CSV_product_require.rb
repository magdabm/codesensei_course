class Product
  attr_reader :name, :price, :weight

  def initialize(name, price, weight)
    @name = name
    @price = price
    @weight = weight
  end
end
