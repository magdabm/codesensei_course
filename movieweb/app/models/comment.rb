class Comment < ApplicationRecord
  belongs_to :movie

  validates :commenter, presence: true
  validates :content, presence: true, length: { in: 5..1000 }
end
