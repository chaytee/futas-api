class Task < ApplicationRecord

  belongs_to :relationship
  belongs_to :user

  validates :title, presence: true
end
