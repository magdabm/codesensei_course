class Dog
   attr_reader :name
   def self.name
      puts "The class name: #{self}"
   end

   def initialize(name)
      @name = name
      puts "This is new dog: #{name}"
   end

   def bark
      puts "Bark, barrrk, barking!!!"
   end

   def bring(item)
      puts "Come on #{@name}, bring the #{item}!"
   end

   def put_down(place:, item:)
      puts "#{@name}, put down on the #{place}, and take your #{item}!"
   end

   def want_eat
      puts "Where is my cookie??"
      self.eating
   end

   private
   def eating
      puts "Munch, munch..."
   end

end


class Cat
   attr_accessor :item
   def self.size
      puts "The class name length is: #{self} -> #{self.to_s.chars.size}"
   end

   def self.show
      puts "It's me, class: #{self}"
   end

   def initialize
      @item = "mouse"
   end

   def bring(item)
      @item = item
      puts "Come on kitty, bring the #{item}!"
      never
   end

   def where
      puts "Where is your #{@item}?"
   end

   def never
      sleep 1
      print "N"
      sleep 1
      print "E"
      sleep 1
      print "V"
      sleep 1
      print "E"
      sleep 1
      print "R"
      sleep 1
      puts "!!!!!!!"
      sleep 1
   end

   def meow
      puts "Meow, meooooow..."
   end

   def show
      self
   end
end

dog = Dog.new("Roki")
dog.bring("ball")
dog.put_down(place: "sofa", item: "blanket")
puts
dog.eating



# cat = Cat.new
# cat.where
# puts
# cat.item = "pen"
# cat.where
# cat.bring("bone")
