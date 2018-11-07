class Book
   attr_accessor :num
   def initialize(title)
      @title = title
      @num = 700
      puts "Number of pages: #{@num}"
   end

   def title
      @title
   end

   def how_many
      puts "Your book \"#{@title}\" have #{@num} pages."
   end


end


book = Book.new("Ogniem i mieczem")
book.how_many
puts book.title
puts
book.num = 200
book.how_many
