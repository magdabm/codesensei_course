class Bottle
   attr_accessor :water
   def initialize
      self.fill
   end

   def drink
      @water -= 10 unless @water.zero?
   end

   protected
   def fill
      @water = 100
   end
end

puts beer = Bottle.new
puts beer.drink
puts beer.drink
puts beer.drink
puts beer.drink
puts beer.drink
puts beer.drink
