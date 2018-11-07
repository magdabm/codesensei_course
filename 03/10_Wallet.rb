class Wallet
   attr_accessor :money, :owner

   def initialize(money:, owner:)
      @money = money
      @owner = owner
      puts "The cash status of #{owner} wallet: #{money}."
   end

   def add_money(payment)
      @money += payment
      puts "Status changed. #{@owner} have #{@money} cash."
   end
end

bob = Wallet.new(money: 80, owner: "Bob")
marta = Wallet.new(money: 150, owner: "Marta")

puts bob.money
puts marta.money

bob.add_money(100)
marta.add_money(20)

puts bob.money
puts marta.money
