class Product
   attr_accessor :name, :price
   def initialize(name, price)
      @name = name
      @price = price
   end
end

class Shop
   attr_accessor :name, :products
   def initialize(name)
      @name = name
      @products = []
   end

   def add_product(name, quantity=1)
      quantity.times do
         products << name
      end
   end

   def take(product_name)
      index = products.index do |product|
         product.name == product_name
      end
      return products.delete_at(index) if index
   end
end

class Client
   attr_accessor :name, :cash, :list, :bag
   def initialize(name, cash)
      @name = name
      @cash = cash
      @bag = []
      @list = []
   end

   def perform_shopping(shop)
      omitted = []
      while product_name = list.pop
         product = shop.take(product_name)
         if @cash - product.price > 0
            @cash = @cash - product.price
            bag << product
         else
            omitted << product_name
            shop.add_product(product)
         end
      end
      if omitted.size != 0
         @list = omitted
         return false
      else
         return true
      end
   end
end


shop = Shop.new('Stonka')
shop.add_product(Product.new('chleb', 1), 10)
shop.add_product(Product.new('jogurt', 1.23), 4)
shop.add_product(Product.new('szynka', 5.99), 8)

janusz = Client.new("Janusz", 7)
janusz.list = ['chleb', 'jogurt', 'jogurt', 'szynka']
puts "janusz"
puts janusz.inspect
puts "shop"
puts shop.inspect

janusz.perform_shopping(shop)
puts

puts "janusz"
puts janusz.inspect
puts "shop"
puts shop.inspect
