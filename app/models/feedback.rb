class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :material

  validates :content, presence: true
end
