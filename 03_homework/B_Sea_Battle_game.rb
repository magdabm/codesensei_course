# battleship 1, cruiser 2, destroyer 3, submarine 4

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
      @waves_positions = []
   end

   def make_board_to_play_ships   # metoda tworząca losową planszę
      place_and_mark_battleship
      place_and_mark_cruiser
      place_and_mark_destroyer
      place_and_mark_submarine
      make_waves_on_empty_positions

   end

   def look_on_board   # metoda pomocnicza żeby zobaczyć jak wygląda plansza :)
      ocean.to_a.each do |row|
         row.each do |e|
            print "| #{e} "
         end
         puts
         print "+---" * 10
         print "+" "\n"
      end
   end

   def look_on_array_of_ships   # metoda pomocnicza żeby zobaczyć jak wygląda tablica współrzędnych statków :)
      @ships_positions.each { |row| puts row.inspect }
   end

   # def look_on_array_of_waves   # metoda pomocnicza żeby zobaczyć jak tablica współrzędnych statków :)
   #    @waves_positions.each { |row| puts row.inspect }
   # end

   private
   def place_and_mark_battleship   # metoda tworząca losowo czteromasztowiec i zaznaczająca na planszy statek i miejsca dookoła
      place_battleship
      mark_battleship_on_ocean
      mark_waves_around_battleship
   end

   def place_and_mark_cruiser   # metoda tworząca losowo dwa trzymasztowce i zaznaczająca na planszy statki i miejsca dookoła
      2.times do
         place_cruiser
         mark_cruiser_on_ocean
         mark_waves_around_cruiser
      end
   end

   def place_and_mark_destroyer   # metoda tworząca losowo 3 dwumasztowce i zaznaczająca na planszy statki i miejsca dookoła
      3.times do
         place_destroyer
         mark_destroyer_on_ocean
         mark_waves_around_destroyer
      end
   end

   def place_and_mark_submarine   # metoda tworząca losowo 4 jednomasztowce i zaznaczająca na planszy statki i miejsca dookoła
      4.times do
         place_submarine
         mark_submarine_on_ocean
         mark_waves_around_submarine
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

   def place_battleship   # metoda wyznaczająca losowo 4-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @b1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]
         if ocean[@b1[0], @b1[1] + 3] != nil   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą
            @b2 = [x, y+1]
            @b3 = [x, y+2]
            @b4 = [x, y+3]
            @battleship = [@b1, @b2, @b3, @b4]
            @ships_positions << @battleship
            return @battleship
         else
            place_battleship   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @b1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]   # jeśli wylosowana opcja pion
         if ocean[@b1[0] + 3, @b1[1]] != nil # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą
            @b2 = [x+1, y]
            @b3 = [x+2, y]
            @b4 = [x+3, y]
            @battleship = [@b1, @b2, @b3, @b4]
            @ships_positions << @battleship
            return @battleship
         else
            place_battleship   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
   end

   def place_cruiser   # metoda wyznaczająca losowo 3-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @c1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]
         if ocean[@c1[0], @c1[1] + 2] != nil &&
            ocean[@c1[0], @c1[1] + 2] != '.' &&
            ocean[@c1[0], @c1[1] + 2] != '#' &&
            ocean[@c1[0], @c1[1]] != '.' &&
            ocean[@c1[0], @c1[1]] != '#'   # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @c2 = [x, y+1]
            @c3 = [x, y+2]
            @cruiser = [@c1, @c2, @c3]
            @ships_positions << @cruiser
            return @cruiser
         else
            place_cruiser   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @c1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]   # jeśli wylosowana opcja pion
         if ocean[@c1[0] + 2, @c1[1]] != nil &&
            ocean[@c1[0] + 2, @c1[1]] != '.' &&
            ocean[@c1[0] + 2, @c1[1]] != '#' &&
            ocean[@c1[0], @c1[1]] != '.' &&
            ocean[@c1[0], @c1[1]] != '#' # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @c2 = [x+1, y]
            @c3 = [x+2, y]
            @cruiser = [@c1, @c2, @c3]
            @ships_positions << @cruiser
            return @cruiser
         else
            place_cruiser   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
   end

   def place_destroyer   # metoda wyznaczająca losowo 2-masztowiec
      if horizontal_or_vertical   # jeśli wylosowana opcja poziom
         @d1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]
         if ocean[@d1[0], @d1[1] + 1] != nil &&
            ocean[@d1[0], @d1[1] + 1] != '.' &&
            ocean[@d1[0], @d1[1] + 1] != '#' &&
            ocean[@d1[0], @d1[1]] != '.' &&
            ocean[@d1[0], @d1[1]] != '#' # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @d2 = [x, y+1]
            @destroyer = [@d1, @d2]
            @ships_positions << @destroyer
            return @destroyer
         else
            place_destroyer   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      else
         @d1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]   # jeśli wylosowana opcja pion
         if ocean[@d1[0] + 1, @d1[1]] != nil &&
            ocean[@d1[0] + 1, @d1[1]] != '.' &&
            ocean[@d1[0] + 1, @d1[1]] != '#' &&
            ocean[@d1[0], @d1[1]] != '.' &&
            ocean[@d1[0], @d1[1]] != '#' # sprawdzenie czy ostatni element statku nie znajdzie się poza macierzą, oraz pierwszy i ostatni element nie znajdzie się na innym statku lub obszarze wave
            @d2 = [x+1, y]
            @destroyer = [@d1, @d2]
            @ships_positions << @destroyer
            return @destroyer
         else
            place_destroyer   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
         end
      end
   end

   def place_submarine   # metoda wyznaczająca losowo 1-masztowiec
      @s1 = [x = (0..9).to_a.sample, y = (0..9).to_a.sample]
      if ocean[@s1[0], @s1[1]] != '.' && ocean[@s1[0], @s1[1]] != '#'
         @submarine = [@s1]
         @ships_positions << @submarine
         return @submarine
      else
         place_submarine   # wywołanie metody ponownie (jeśli wybrany zły punkt początkowy)
      end
   end

   def mark_battleship_on_ocean   # metoda zaznaczająca współrzędne wylosowanego statku w macierzy
      @battleship.each do |elem|
         ocean.[]=(elem[0], elem[1], '#')
      end
   end

   def mark_cruiser_on_ocean   # metoda zaznaczająca współrzędne wylosowanego statku w macierzy
      @cruiser.each do |elem|
         ocean.[]=(elem[0], elem[1], '#')
      end
   end

   def mark_destroyer_on_ocean   # metoda zaznaczająca współrzędne wylosowanego statku w macierzy
      @destroyer.each do |elem|
         ocean.[]=(elem[0], elem[1], '#')
      end
   end

   def mark_submarine_on_ocean   # metoda zaznaczająca współrzędne wylosowanego statku w macierzy
      @submarine.each do |elem|
         ocean.[]=(elem[0], elem[1], '#')
      end
   end

   def mark_waves_around_mast(mast)

      if mast[0] == 0 || mast[0] == 9 || mast[1] == 0 || mast[1] == 9
         if mast[0] == 0 && mast[1] == 0
            if ocean[mast[0], mast[1]+1] != '#'   # 01
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]+1] != '#'   # 11
               ocean.[]=(mast[0]+1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]] != '#'   # 10
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
         elsif mast[0] == 0 && mast[1] != 0 && mast[1] != 9
            if ocean[mast[0], mast[1]+1] != '#'   # 02
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]+1] != '#'   # 12
               ocean.[]=(mast[0]+1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]] != '#'   # 11
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]-1] != '#'   # 10
               ocean.[]=(mast[0]+1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]-1] != '#'   # 00
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
         elsif mast[0] == 0 && mast[1] == 9
            if ocean[mast[0]+1, mast[1]] != '#'   # 01
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]-1] != '#'   # 11
               ocean.[]=(mast[0]+1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]-1] != '#'   # 10
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
         elsif mast[0] == 9 && mast[1] == 0
            if ocean[mast[0]-1, mast[1]] != '#'   # 80
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]+1] != '#'   # 81
               ocean.[]=(mast[0]-1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]+1] != '#'   # 91
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
         elsif mast[0] == 9 && mast[1] != 0 && mast[1] != 9
            if ocean[mast[0], mast[1]-1] != '#'   # 90
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]-1] != '#'   # 80
               ocean.[]=(mast[0]-1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]] != '#'   # 81
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]+1] != '#'   # 82
               ocean.[]=(mast[0]-1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]+1] != '#'   # 92
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
         elsif mast[0] == 9 && mast[1] == 9
            if ocean[mast[0], mast[1]-1] != '#'   # 98
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]-1] != '#'   # 88
               ocean.[]=(mast[0]-1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]] != '#'   # 89
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
         elsif mast[1] == 0 && mast[0] != 0 && mast[0] != 9
            if ocean[mast[0]-1, mast[1]] != '#'   # 70
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]+1] != '#'   # 71
               ocean.[]=(mast[0]-1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]+1] != '#'   # 81
               ocean.[]=(mast[0], mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]+1] != '#'   # 91
               ocean.[]=(mast[0]+1, mast[1]+1, '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]] != '#'   # 90
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
         elsif mast[1] == 9 && mast[0] != 0 && mast[0] != 9
            if ocean[mast[0]+1, mast[1]] != '#'   # 99
               ocean.[]=(mast[0]+1, mast[1], '.')
            else
               '#'
            end
            if ocean[mast[0]+1, mast[1]-1] != '#'   # 98
               ocean.[]=(mast[0]+1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0], mast[1]-1] != '#'   # 88
               ocean.[]=(mast[0], mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]-1] != '#'   # 78
               ocean.[]=(mast[0]-1, mast[1]-1, '.')
            else
               '#'
            end
            if ocean[mast[0]-1, mast[1]] != '#'   # 79
               ocean.[]=(mast[0]-1, mast[1], '.')
            else
               '#'
            end
         end
      else
         if ocean[mast[0], mast[1]-1] != '#'   # 62
            ocean.[]=(mast[0], mast[1]-1, '.')
         else
            '#'
         end
         if ocean[mast[0]-1, mast[1]-1] != '#'   # 52
            ocean.[]=(mast[0]-1, mast[1]-1, '.')
         else
            '#'
         end
         if ocean[mast[0]-1, mast[1]] != '#'   # 53
            ocean.[]=(mast[0]-1, mast[1], '.')
         else
            '#'
         end
         if ocean[mast[0]-1, mast[1]+1] != '#'   # 54
            ocean.[]=(mast[0]-1, mast[1]+1, '.')
         else
            '#'
         end
         if ocean[mast[0], mast[1]+1] != '#'   # 64
            ocean.[]=(mast[0], mast[1]+1, '.')
         else
            '#'
         end
         if ocean[mast[0]+1, mast[1]+1] != '#'   # 74
            ocean.[]=(mast[0]+1, mast[1]+1, '.')
         else
            '#'
         end
         if ocean[mast[0]+1, mast[1]] != '#'   # 73
            ocean.[]=(mast[0]+1, mast[1], '.')
         else
            '#'
         end
         if ocean[mast[0]+1, mast[1]-1] != '#'   # 72
            ocean.[]=(mast[0]+1, mast[1]-1, '.')
         else
            '#'
         end
         ocean.to_a.each { |row| row.inspect }
      end
   end   # metoda dzięki której zaznaczane są pola dookoła każdego masztu z uwzględnieniem miejsc gdzie nie da się zaznaczyć (krawędź macierzy) /problematyczne było zaznaczanie gdy któraś wsþółrzędna wynosi -1 -> wtedy następowało nieprawidłowe przejście do ostatniego wiersza lub kolumny macierzy, dlatego aby to wyeliminować kod tej metody ma tylko 215 linijek ;p /

   def mark_waves_around_battleship   # metoda wyznaczająca pola dookoła każdego wylosowanego statku (używa metody oznczającej pole dookoła pojedynczego masztu)
      @battleship.each do |elem|
         mark_waves_around_mast(elem)
      end
   end

   def mark_waves_around_cruiser   # metoda wyznaczająca pola dookoła każdego wylosowanego statku (używa metody oznczającej pole dookoła pojedynczego masztu)
      @cruiser.each do |elem|
         mark_waves_around_mast(elem)
      end
   end

   def mark_waves_around_destroyer   # metoda wyznaczająca pola dookoła każdego wylosowanego statku (używa metody oznczającej pole dookoła pojedynczego masztu)
      @destroyer.each do |elem|
         mark_waves_around_mast(elem)
      end
   end

   def mark_waves_around_submarine   # metoda wyznaczająca pola dookoła każdego wylosowanego statku (używa metody oznczającej pole dookoła pojedynczego masztu)
      @submarine.each do |elem|
         mark_waves_around_mast(elem)
      end
   end

   def make_waves_on_empty_positions   # metoda zamieniająca pozostałe w macierzy "0" na kropki (fale)
      loop do
         zero = ocean.find_index(0)
         ocean.[]=(zero[0], zero[1], '.')
         break if ocean.find_index(0) == nil
      end
   end

end


ships = Ships.new
ships.make_board_to_play_ships
ships.look_on_board
ships.look_on_array_of_ships
