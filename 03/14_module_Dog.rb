module Collar
   def pull
      puts "Pulling #{@name}"
   end
end

module TrackingChip
   def get_tracking_id
      @tracking_id ||= rand(1000)
   end
end

class Dog
   include Collar
   include TrackingChip
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
