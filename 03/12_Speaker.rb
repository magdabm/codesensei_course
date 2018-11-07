class Speaker

   def initialize
      @disk = "Evolve"
   end

   def disk
      @disk
   end

   def play(track_name)
      puts "Speaker number ##{@pi} playing: #{track_name}" # tu @pi zadziała bo wywołanie metody play pochodzi z klasy w której @pi zostało zdefiniowane i otrzymało wartość
   end

   def stop
      puts "Speker #{@pi} - stop. Silence."   # tu @pi nie zadziała, pozostanie puste miejsce bo wywałnie tej metody pochodzi z tej klasy a tu nie ma @pi
   end
end

class BluetoothSpeaker < Speaker
   attr_reader :pi
   def initialize(pi)
      @pi = pi
   end

   def play(track_name)
      puts "Streaming..."
      super
   end
end

class MusicBox < Speaker
   def play
      super("Believer")
   end

   def check
      puts "The playing disk is: #{@disk}"
   end
end


speak = BluetoothSpeaker.new("019")
speak.play("Shots")
puts
spiky = MusicBox.new
spiky.play
spiky.check
puts
main = Speaker.new
main.stop
puts main.disk
