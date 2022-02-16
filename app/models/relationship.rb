class Relationship < ApplicationRecord
  has_many :users
  has_many :tasks
  has_many :messages

  validates :paircode, presence: true

end
