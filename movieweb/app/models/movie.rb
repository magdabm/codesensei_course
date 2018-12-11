class Movie < ApplicationRecord
   has_many :comments

   validates :title, presence: true
   validates :director, presence: true
   validates :country, presence: true
   validates :genre, presence: true
   validates :description, presence: true, length: { in: 10..1000 }

end
