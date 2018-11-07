class Coffee

   def self.name
      puts "Foo company"
   end

   def show
      self
   end

   def grind
      puts "Grinding grains..."
   end

   def milk
      puts "Adding milk..."
   end

   def water
      puts "Heating water..."
   end

   def make_coffee
      self.grind
      water
      milk
      puts "Making coffee, mhm..."
   end
end

coffee = Coffee.new
coffee.make_coffee
puts
puts coffee.itself
puts
puts coffee.show
puts
puts coffee.object_id

# coffee.show i coffee.itself daje w tym przypadku ten sam rezultat\
