class Message < ApplicationRecord

  #has_one :relationship
  belongs_to :relationship
  belongs_to :user

  validates :content, presence: true
end
