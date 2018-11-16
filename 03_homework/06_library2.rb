# Napisz program do obsługi biblioteki. Powinien on umożliwiać:
# wyświetlenie listy książek w bibliotece, z zaznaczeniem dostępnych oraz aktualnie wypożyczonych (lista książek nie powinna być udostępniona publicznie)
# dodawanie nowych książek do listy dostępnych w bibliotece
# wypożyczanie i oddawanie książek przez czytelników (niemożliwe jest wypożyczenie już wypożyczonej książki)
# dodawanie nowych czytelników do biblioteki wraz z generowaniem im numeru karty bibliotecznej (powinien on składać się z liter oraz cyfr i być unikalny dla każdego czytelnika)
# wyświetlenie listy książek wypożyczonych w danym momencie przez konkretnego czytelnika, wraz z datami wypożyczenia każdej z nich
# wyświetlenie historii wypożyczeń danego czytelnika wraz z czasem przetrzymywania każdej z nich (uwzględniającej oddane już książki). Stwórz ok. 10 książek i 3 czytelników. Sprawdź manualnie poprawność działania programu.

# 1. klasy: library, book, reader
# 2. obiekty w library: zbiór książek wszytskich, zbiór książek wypożyczonych, zbiór książek dostępnych
# 3. obiekty w book: książka -> tytuł
# 4. obikety w reader: reader -> card number, books, loan_history

class Library
   include Enumerable
   attr_accessor :collection, :available_books, :borrowed_book

   def initialize
      @collection = []
      @available_books = []
      @borrowed_book = []
   end

   def add_book(*title)
      collection << title
      available_books << title
      available_books.flatten
      collection.flatten
   end
end


class Reader
   attr_accessor :card_number, :id_data_base

   def initialize
      @card_number = id_generating
      @books = []
   end

   def borrow_book(title)
      if available_books.include?(title)
         borrowed_books << title
         available_books.delete(title)
         books << title
      else
         puts "This book is borrowed."
      end
   end


   def id_data_base
      @id_data_base = []
   end

   def id_generating
      card_number = ["A", "A", "A", rand(0..9), rand(0..9), rand(0..9)].join
      id_check == false
      if id_check == false
         id_generating
      else
         card_number
      end
   end



   def id_check
      if id_data_base.empty?
         id_data_base << card_number
      else
         id_data_base.each do |id|
            if id_data_base.include?(card_number)
               false
            else
               id_data_base << card_number
            end
         end
      end
   end

end

class Book
   attr_accessor

   def initialize(title)
      @title = title
   end
end


puts library = Library.new

puts library.add_book("Okno", "Droga", "Drzewo", "Dom", "Pies").inspect
puts library.add_book("Komin", "Dach").inspect

puts r1 = Reader.new
puts r1.borrow_book("Dom")
