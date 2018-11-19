# Warsztaty mają dwa typy uczestników. Studentów i wykładowców. Wszyscy uczestnicy posiadają atrybut full_name.
# Ddatkowo każdy student posiada atrybut z informacją o tym dlaczego uczestniczy w warsztatach. Każdy wykładowca posiada informacje o bio i umiejętnościach.
# Stwórz klasę odpowiedzialną za warsztaty, gdzie będą przechowywane następujące informacje: data, miejsce, wykładowcy, studenci.
# Stwórz metodę do dodawania uczestników, rozpoznaj tam studenta od wykładowcy i zależnie od typu dodaj go do odpowiedniej listy.
# Dodatkowo utwórz metodę print_details, która wypisze na ekran informacje o warsztatach.


class Workshop
   attr_accessor :date, :place, :students, :coaches
   def initialize(date, place)
      self.date = date
      self.place = place
      self.students = []
      self.coaches = []
   end

   def add_participant(participant)
      if participant.class == Student
         students << participant
      elsif participant.class == Coach
         coaches << participant
      end
   end

   def print_details
      puts "Workshop: #{date}, #{place}"
      puts "Our coaches:"
      coaches.each_with_index do |coach, index|
         puts "#{index + 1}. #{coach.full_name} - /#{coach.skill}/ - \"#{coach.info}\""
      end
      puts
      puts "Our students:"
      students.each_with_index do |student, index|
         puts "#{index + 1}. #{student.full_name} - \"#{student.info}\""
      end
      puts
   end
end

class Student
   attr_accessor :full_name, :info
   def initialize(full_name, info)
      self.full_name = full_name
      self.info = info
   end
end

class Coach < Student
   attr_accessor :skills, :skill
   def initialize(full_name, info)
      super
      self.skills = []
   end

   def add_skill(skill)
      self.skill = skill
      skills << skill
   end
end

workshop = Workshop.new("17/11/2018", "Fabryczna 20A")
jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")
lena = Student.new("Lena Smith", "I am really excited about learning to program!")
vicky = Coach.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")
nicole = Coach.new("Nicole McMillan", "I have been programming for 5 years in Ruby and want to spread the love")
nicole.add_skill("Ruby")
workshop.add_participant(jane)
workshop.add_participant(lena)
workshop.add_participant(vicky)
workshop.add_participant(nicole)
puts workshop.print_details
