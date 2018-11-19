# Warsztaty mają dwa typy uczestników. Studentów i wykładowców. Wszyscy uczestnicy posiadają atrybut full_name.
# Ddatkowo każdy student posiada atrybut z informacją o tym dlaczego uczestniczy w warsztatach. Każdy wykładowca posiada informacje o bio i umiejętnościach.
# Stwórz klasę odpowiedzialną za warsztaty, gdzie będą przechowywane następujące informacje: data, miejsce, wykładowcy, studenci.
# Stwórz metodę do dodawania uczestników, rozpoznaj tam studenta od wykładowcy i zależnie od typu dodaj go do odpowiedniej listy.
# Dodatkowo utwórz metodę print_details, która wypisze na ekran informacje o warsztatach.


class Workshop
  attr_accessor :date, :venue, :students, :coaches

  def initialize(date, venue)
    self.date = date
    self.venue = venue
    self.students = []
    self.coaches = []
  end

  def add_participant(participant)
    if participant.class == Student
      students << participant
    else
      coaches << participant
    end
  end

  def print_details
    puts "-" * 20
    puts "Venue: #{venue}"
    puts "Date: #{date}"
    puts "-" * 20
    puts "Coaches:"
    coaches.each do |coach|
      puts "- #{coach.full_name}, skills: #{coach.skills.join(", ")}"
    end
    puts "-" * 20
    puts "Students:"
    students.each do |student|
      puts "- #{student.full_name}, reason: #{student.reason_why}"
    end
  end
end

class Student
  attr_accessor :full_name, :reason_why

  def initialize(full_name, reason_why)
    self.full_name = full_name
    self.reason_why = reason_why
  end
end

class Coach < Student
  attr_accessor :bio, :skills

  def initialize(full_name, bio)
    super(full_name, nil)
    self.bio = bio
    self.skills = []
  end

  def add_skill(skill)
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
workshop.print_details
