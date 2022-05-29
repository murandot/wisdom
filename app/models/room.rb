class Room < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
