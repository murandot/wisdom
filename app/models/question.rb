class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  #has_many :queation_tags, through: question_taggings
  #has_many :question_taggings
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :school_category

  with_options presence: true do
    validates :title
    validates :content
  end
  
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  
end