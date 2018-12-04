require 'matrix'

class Matrix   # klasa i metoda potrzebna do zmiany wartości wewnątrz macierzy
   def []=(row, column, value)
      @rows[row][column] = value
   end
end

class Ships
attr_accessor :ocean

   def initialize
      self.ocean = Matrix.build(10,10) { |row, col| 0 }
      @ships_positions = []
   end

   def show_board(matrix)   # metoda wyświetlająca planszę - użyty argument, żeby można było też w testach wyświetlić wygenerowaną planszę
      puts
      print "+---" * 11
      print "+" "\n"
      print "|   | A | B | C | D | E | F | G | H | I | J |" "\n"
      print "+---" * 11
      print "+" "\n"
      matrix.to_a.each_with_index do |row, index|
         print ("| %-2d" % (index + 1))
         print "|"
         row.each { |e| print " #{e} |" }
         puts
         print "+---" * 11
         print "+" "\n"
      end
      puts
      sleep 1
   end

   # def show_board_of_ships   # metoda do wyświetlenia wygenerowanej planszy
   #    show_board(ocean)
   # end

   def generate_board_to_play_ships   # metoda tworząca losową planszę
      place_and_mark_battleship
      place_and_mark_cruiser
      place_and_mark_destroyer
      place_and_mark_submarine
      make_waves_on_empty_positions
   end

   # def look_on_array_of_ships   # metoda pomocnicza żeby zobaczyć jak wygląda tablica współrzędnych statków :)
   #    @ships_positions.each { |row| puts row.inspect }
   # end
   #
   # def look_on_array_of_ships3
   #    ships_to_sink  # metoda pomocnicza żeby zobaczyć jak wygląda tablica współrzędnych statków :)
   #    @ships_to_sink.each { |row| puts row.inspect }
   # end

   def place_and_mark_battleship   # metoda tworząca losowo czteromasztowiec i zaznaczająca na planszy statek i miejsca dookoła
      mark_ship_and_waves_on_ocean(place_battleship)
   end

   def place_and_mark_cruiser   # metoda tworząca losowo dwa trzymasztowce i zaznaczająca na planszy statki i miejsca dookoła
      2.times do
         mark_ship_and_waves_on_ocean(place_cruiser)
      end
   end

   def place_and_mark_destroyer   # metoda tworząca losowo 3 dwumasztowce i zaznaczająca na planszy statki i miejsca dookoła
      3.times do
         mark_ship_and_waves_on_ocean(place_destroyer)
      end
   end

   def place_and_mark_submarine   # metoda tworząca losowo 4 jednomasztowce i zaznaczająca na planszy statki i miejsca dookoła
      4.times do
         mark_ship_and_waves_on_ocean(place_submarine)
      end
   end

   def horizontal_or_vertical   # metoda losująca czy statek będzie w pionie czy w poziomie
      horv = ['vertical', 'horizontal']
      hov = horv.sample
      if hov == 'horizontal'
         return true
      else
         return false
      end
   end

   def drawing_first_mast   # meotda losująca pierwsze koordynaty
      [@x = (0..9).to_a.sample, @y = (0..9).to_a.sample]
   end

   def place_battleship   # metoda wyznaczająca losowo 4-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @b1 = drawing_first_mast
         if ocean[@b1[0], @b1[1] + 3] != nil   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą
            @ships_positions << [@b1, @b2 = [@x, @y+1], @b3 = [@x, @y+2], @b4 = [@x, @y+3]]
         else
            place_battleship   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @b1 = drawing_first_mast   # jeśli wylosowana opcja pion
         if ocean[@b1[0] + 3, @b1[1]] != nil # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą
            @ships_positions << [@b1, @b2 = [@x+1, @y], @b3 = [@x+2, @y], @b4 = [@x+3, @y]]
         else
            place_battleship   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
      return [@b1, @b2, @b3, @b4]
   end

   def place_cruiser   # metoda wyznaczająca losowo 3-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @c1 = drawing_first_mast
         if ![nil, '.', 'X'].include?(ocean[@c1[0], @c1[1] + 2]) && !['.', 'X'].include?(ocean[@c1[0], @c1[1]])   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @ships_positions << [@c1, @c2 = [@x, @y+1], @c3 = [@x, @y+2]]
         else
            place_cruiser   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @c1 = drawing_first_mast   # jeśli wylosowana opcja pion
         if ![nil, '.', 'X'].include?(ocean[@c1[0] + 2, @c1[1]]) &&
            !['.', 'X'].include?(ocean[@c1[0], @c1[1]])   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @ships_positions << [@c1, @c2 = [@x+1, @y], @c3 = [@x+2, @y]]
         else
            place_cruiser   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
      return [@c1, @c2, @c3]
   end

   def place_destroyer   # metoda wyznaczająca losowo 2-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @d1 = drawing_first_mast
         if ![nil, '.', 'X'].include?(ocean[@d1[0], @d1[1] + 1]) &&
            !['.', 'X'].include?(ocean[@d1[0], @d1[1]])   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @ships_positions << [@d1, @d2 = [@x, @y+1]]
         else
            place_destroyer   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @d1 = drawing_first_mast   # jeśli wylosowana opcja pion
         if ![nil, '.', 'X'].include?(ocean[@d1[0] + 1, @d1[1]]) &&
            !['.', 'X'].include?(ocean[@d1[0], @d1[1]])   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @ships_positions << [@d1, @d2 = [@x+1, @y]]
         else
            place_destroyer   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
      return [@d1, @d2]
   end

   def place_submarine   # metoda wyznaczająca losowo 1-masztowiec
      @s1 = drawing_first_mast
      if !['.', 'X'].include?(ocean[@s1[0], @s1[1]])
         @ships_positions << [@s1]
      else
         place_submarine   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
      end
      return [@s1]
   end

   def ships_to_sink   # metoda duplikująca tablicę współrzednych statków (żeby na etapie gry na jednej można było usuwać statki po strzałach, a na drugiej wyciągać tablicę danego statku do oznaczania kropek dookoła
      @ships_to_sink = []
      @ships_positions.each do |e|
         @ships_to_sink << e.dup
      end
   end

   def mark_ship_and_waves_on_ocean(ship)   # metoda zaznaczająca współrzędne wylosowanego statku w macierzy oraz pozycje dookoła
      ship.each do |elem|
         ocean.[]=(elem[0], elem[1], 'X')
      end
      ship.each do |elem|
         mark_waves_around_mast(elem, ocean)
      end
   end

   def mark_waves_around_mast(mast, matrix)   # metoda zaznaczająca kropki dookoła jednego masztu
      if mast[0] == 0 || mast[0] == 9 || mast[1] == 0 || mast[1] == 9
         if mast[0] == 0 && mast[1] == 0
            if matrix[mast[0], mast[1]+1] != 'X'   # 01
               matrix.[]=(mast[0], mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]+1] != 'X'   # 11
               matrix.[]=(mast[0]+1, mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]] != 'X'   # 10
               matrix.[]=(mast[0]+1, mast[1], '.')
            else
               'X'
            end
         elsif mast[0] == 0 && mast[1] != 0 && mast[1] != 9
            if matrix[mast[0], mast[1]+1] != 'X'   # 02
               matrix.[]=(mast[0], mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]+1] != 'X'   # 12
               matrix.[]=(mast[0]+1, mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]] != 'X'   # 11
               matrix.[]=(mast[0]+1, mast[1], '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]-1] != 'X'   # 10
               matrix.[]=(mast[0]+1, mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0], mast[1]-1] != 'X'   # 00
               matrix.[]=(mast[0], mast[1]-1, '.')
            else
               'X'
            end
         elsif mast[0] == 0 && mast[1] == 9
            if matrix[mast[0]+1, mast[1]] != 'X'   # 01
               matrix.[]=(mast[0]+1, mast[1], '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]-1] != 'X'   # 11
               matrix.[]=(mast[0]+1, mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0], mast[1]-1] != 'X'   # 10
               matrix.[]=(mast[0], mast[1]-1, '.')
            else
               'X'
            end
         elsif mast[0] == 9 && mast[1] == 0
            if matrix[mast[0]-1, mast[1]] != 'X'   # 80
               matrix.[]=(mast[0]-1, mast[1], '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]+1] != 'X'   # 81
               matrix.[]=(mast[0]-1, mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0], mast[1]+1] != 'X'   # 91
               matrix.[]=(mast[0], mast[1]+1, '.')
            else
               'X'
            end
         elsif mast[0] == 9 && mast[1] != 0 && mast[1] != 9
            if matrix[mast[0], mast[1]-1] != 'X'   # 90
               matrix.[]=(mast[0], mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]-1] != 'X'   # 80
               matrix.[]=(mast[0]-1, mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]] != 'X'   # 81
               matrix.[]=(mast[0]-1, mast[1], '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]+1] != 'X'   # 82
               matrix.[]=(mast[0]-1, mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0], mast[1]+1] != 'X'   # 92
               matrix.[]=(mast[0], mast[1]+1, '.')
            else
               'X'
            end
         elsif mast[0] == 9 && mast[1] == 9
            if matrix[mast[0], mast[1]-1] != 'X'   # 98
               matrix.[]=(mast[0], mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]-1] != 'X'   # 88
               matrix.[]=(mast[0]-1, mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]] != 'X'   # 89
               matrix.[]=(mast[0]-1, mast[1], '.')
            else
               'X'
            end
         elsif mast[1] == 0 && mast[0] != 0 && mast[0] != 9
            if matrix[mast[0]-1, mast[1]] != 'X'   # 70
               matrix.[]=(mast[0]-1, mast[1], '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]+1] != 'X'   # 71
               matrix.[]=(mast[0]-1, mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0], mast[1]+1] != 'X'   # 81
               matrix.[]=(mast[0], mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]+1] != 'X'   # 91
               matrix.[]=(mast[0]+1, mast[1]+1, '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]] != 'X'   # 90
               matrix.[]=(mast[0]+1, mast[1], '.')
            else
               'X'
            end
         elsif mast[1] == 9 && mast[0] != 0 && mast[0] != 9
            if matrix[mast[0]+1, mast[1]] != 'X'   # 99
               matrix.[]=(mast[0]+1, mast[1], '.')
            else
               'X'
            end
            if matrix[mast[0]+1, mast[1]-1] != 'X'   # 98
               matrix.[]=(mast[0]+1, mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0], mast[1]-1] != 'X'   # 88
               matrix.[]=(mast[0], mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]-1] != 'X'   # 78
               matrix.[]=(mast[0]-1, mast[1]-1, '.')
            else
               'X'
            end
            if matrix[mast[0]-1, mast[1]] != 'X'   # 79
               matrix.[]=(mast[0]-1, mast[1], '.')
            else
               'X'
            end
         end
      else
         if matrix[mast[0], mast[1]-1] != 'X'   # 62
            matrix.[]=(mast[0], mast[1]-1, '.')
         else
            'X'
         end
         if matrix[mast[0]-1, mast[1]-1] != 'X'   # 52
            matrix.[]=(mast[0]-1, mast[1]-1, '.')
         else
            'X'
         end
         if matrix[mast[0]-1, mast[1]] != 'X'   # 53
            matrix.[]=(mast[0]-1, mast[1], '.')
         else
            'X'
         end
         if matrix[mast[0]-1, mast[1]+1] != 'X'   # 54
            matrix.[]=(mast[0]-1, mast[1]+1, '.')
         else
            'X'
         end
         if matrix[mast[0], mast[1]+1] != 'X'   # 64
            matrix.[]=(mast[0], mast[1]+1, '.')
         else
            'X'
         end
         if matrix[mast[0]+1, mast[1]+1] != 'X'   # 74
            matrix.[]=(mast[0]+1, mast[1]+1, '.')
         else
            'X'
         end
         if matrix[mast[0]+1, mast[1]] != 'X'   # 73
            matrix.[]=(mast[0]+1, mast[1], '.')
         else
            'X'
         end
         if matrix[mast[0]+1, mast[1]-1] != 'X'   # 72
            matrix.[]=(mast[0]+1, mast[1]-1, '.')
         else
            'X'
         end
         matrix.to_a.each { |row| row.inspect }
      end
   end   # metoda dzięki której zaznaczane są pola dookoła każdego masztu z uwzględnieniem miejsc gdzie nie da się zaznaczyć (krawędź macierzy) /problematyczne było zaznaczanie gdy któraś wsþółrzędna wynosi -1 -> wtedy następowało nieprawidłowe przejście do ostatniego wiersza lub kolumny macierzy, dlatego aby to wyeliminować kod tej metody ma tylko 215 linijek ;p /

   def make_waves_on_empty_positions   # metoda zamieniająca pozostałe w macierzy '0' na kropki (fale)
      loop do
         zero = ocean.find_index(0)
         ocean.[]=(zero[0], zero[1], '.')
         break if ocean.find_index(0) == nil
      end
   end

################################# GAME #################################

   def game_with_player
      say_hello
      show_board(make_board_for_player)
      ships_to_sink
      give_shot_and_check
   end

   def say_hello
      puts "Podaj swoje imię:"
      @name = gets.chomp
      puts
      puts "Cześć #{@name}!"
      puts "Zagrajmy w Okręty!"
      sleep 1
      puts
      puts "To jest Twoja plansza:"
   end

   def make_board_for_player
      @game_board = Matrix.build(10,10) { |row, col| ' ' }
   end

   def give_shot_and_check   # tu toczy się cała gra
      puts "#{@name}, podaj Twój strzał:"
      @shot = gets.chomp.upcase.chars
      puts
      prepare_shot
      if check_shot_correction
         puts "Koordynaty strzału nie są prawidłowe. Spróbuj jeszcze raz:"
         puts
         sleep 1
         give_shot_and_check
      else
         puts "Sprawdzam..."
         puts
         conversion_coordinates_from_shot_to_matrix
         checking_shot_on_generated_board
         give_shot_and_check
      end
   end

   def checking_shot_on_generated_board   # porównanie strzału z wygenerowaną planszą, usuwanie koordynat z tablicy gdy trafiony, sprawdzanie czy statek zatopiony oraz zy koniec gry
      if ocean[@coordinates[0], @coordinates[1]] == 'X'
         puts "Trafiony!"
         sign_shot_on_board("X")
         @ships_positions.each do |elem|
            if elem.include?(@coordinates)
               elem.delete(@coordinates)
               if elem.empty?
                  puts "Zatopiony!"
                  mark_positions_around_ship_on_game_board
                  show_board(@game_board)
                  if @ships_positions.flatten.empty?
                     puts "Gratulacje #{@name}! Wszystkie statki zostały zatopione!"
                     exit
                  end
               else
                  show_board(@game_board)
               end
            end
         end
      else
         puts "Pudło!"
         sign_shot_on_board('.')
         show_board(@game_board)
      end
   end

   def mark_positions_around_ship_on_game_board   # metoda znajdująca statek w tablicy statków i zaznaczająca dookoła kropki
      @ship = @ships_to_sink.find do |array|
         array[0] == @coordinates || array[1] == @coordinates || array[2] == @coordinates || array[3] == @coordinates
      end
      @ship.each do |elem|
         mark_waves_around_mast(elem, @game_board)
      end
   end

   def prepare_shot   # przygotowanie koordynat (gdy będzie 10 trzeba zmienić tablicę strzału)
      if @shot.size > 2
         @shot[1] = [@shot[1], @shot[2]].join
         @shot.delete_at(2)
      end
      @shot = [@shot[0], @shot[1]]
      return @shot
   end

   def check_shot_correction   # sprawdzenie czy gracz podał prawidłowe koordynaty (a do j, 1 do 10)
      @letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
      @numbers = (1..10).to_a
      @numbers.map! { |e| e.to_s }
      if @letters.include?(@shot[0]) == false || @numbers.include?(@shot[1]) == false
         return true
      else
         return false
      end
   end

   def conversion_coordinates_from_shot_to_matrix   # konwersja koordynat strzału na koordynaty odpowiadające macierzy
      @coordinates = []
      if @letters.include?(@shot[0]) && @numbers.include?(@shot[1])
         @coordinates[0] = @numbers.index(@shot[1])
         @coordinates[1] = @letters.index(@shot[0])
      end
      @coordinates
   end

   def sign_shot_on_board(sign)   # zaznaczenie na tablicy gracza znaku (używane w przypadku trafienia ('x') lub  pudła ('.')
      @game_board.[]=(@coordinates[0], @coordinates[1], sign)
   end
end


ships = Ships.new
ships.generate_board_to_play_ships
ships.game_with_player
