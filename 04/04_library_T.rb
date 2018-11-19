# Napisz program do obsługi biblioteki. Powinien on umożliwiać:
# wyświetlenie listy książek w bibliotece, z zaznaczeniem dostępnych oraz aktualnie wypożyczonych (lista książek nie powinna być udostępniona publicznie)
# dodawanie nowych książek do listy dostępnych w bibliotece
# wypożyczanie i oddawanie książek przez czytelników (niemożliwe jest wypożyczenie już wypożyczonej książki)
# dodawanie nowych czytelników do biblioteki wraz z generowaniem im numeru karty bibliotecznej (powinien on składać się z liter oraz cyfr i być unikalny dla każdego czytelnika)
# wyświetlenie listy książek wypożyczonych w danym momencie przez konkretnego czytelnika, wraz z datami wypożyczenia każdej z nich
# wyświetlenie historii wypożyczeń danego czytelnika wraz z czasem przetrzymywania każdej z nich (uwzględniającej oddane już książki). Stwórz ok. 10 książek i 3 czytelników. Sprawdź manualnie poprawność działania programu.


class Book
  attr_accessor :title, :author, :status

  def initialize(title, author)
    self.title = title
    self.author = author
    self.status = :available
  end
end

class Reader
  attr_accessor :name, :card_number

  def initialize(name)
    self.name = name
    self.card_number = generate_id
    @borrowed_books = []
    @history = []
  end

  def add_borrowed_book(book)
    @borrowed_books << { book: book, time: Time.now }
  end

  def remove_returned_book(book)
    book_info = @borrowed_books.find do |row|
      row[:book].object_id == book.object_id
    end

    return unless book_info

    add_line_to_history(book_info)
    @borrowed_books.delete(book_info)
  end

  def print_books
    puts "Borrowed books:"
    @borrowed_books.each do |row|
      puts "Book: #{row[:book].title} borrowed at: #{row[:time]}"
    end
  end

  def print_history
    puts "Reader History:"
    @history.each do |row|
      puts "Book: #{row[:book].title}, " \
            "borrowed by: #{row[:to].to_i - row[:from].to_i}"
    end
  end

  private

  def add_line_to_history(row)
    @history << { book: row[:book], from: row[:time], to: Time.now }
  end

  def generate_id
    object_id.to_s(16)
  end
end

class Library
  attr_accessor :readers

  def initialize
    @books = []
    self.readers = []
  end

  def add_reader(name)
    new_reader = Reader.new(name)
    readers << new_reader
    new_reader
  end

  def add_book(book)
    @books << book
  end

  def print_books
    @books.each do |book|
      puts "Tytuł: #{book.title}, Autor: #{book.author}, Status: #{book.status}"
    end
  end

  def borrow_book(reader, title, author)
    book = @books.find do |row|
      row.title == title &&
        row.author == author &&
        row.status == :available
    end

    return false unless book

    reader.add_borrowed_book(book)
    book.status = :booked
    true
  end

  def return_book(reader, title, author)
    book = @books.find do |row|
      row.title == title &&
        row.author == author &&
        row.status == :booked
    end

    return false unless book

    reader.remove_returned_book(book)
    book.status = :available
    true
  end
end

book1 = Book.new("Hobbit", "Tolkien")
book2 = Book.new("Harry Potter", "Tolkien")
book3 = Book.new("Władca Pierścieni", "Tolkien")
book4 = Book.new("Gra o Tron", "Tolkien")
book5 = Book.new("Igrzyska Śmierci", "Tolkien")
book6 = Book.new("Zmierzch", "Tolkien")
book7 = Book.new("Krzyżacy", "Tolkien")
book8 = Book.new("Chłopi", "Tolkien")
book9 = Book.new("Lalka", "Tolkien")
book10 = Book.new("Przedwiośnie", "Tolkien")

library = Library.new
library.add_book(book1)
library.add_book(book2)
library.add_book(book3)
library.add_book(book4)
library.add_book(book5)
library.add_book(book6)
library.add_book(book7)
library.add_book(book8)
library.add_book(book9)
library.add_book(book10)
library.print_books

reader = library.add_reader("Tolkien")
reader2 = library.add_reader("Sapkowski")

puts library.borrow_book(reader, "Hobbit", "Tolkien")
sleep 2
puts library.borrow_book(reader2, "Hobbit", "Tolkien")
sleep 2
puts "Po wizycie tolkiena"
library.print_books

puts library.return_book(reader, "Hobbit", "Tolkien")

sleep 3
puts library.borrow_book(reader2, "Hobbit", "Tolkien")


reader.print_books
reader.print_history
reader2.print_books
reader2.print_history

puts library.inspect
puts reader.inspect
puts reader2.inspect
