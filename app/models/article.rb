class Article < ApplicationRecord
  belongs_to :user
  #has_many :comments
  #has_many :article_favorites
  #has_many :article_tags, through: article_taggings
  #has_many :article_taggings
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :school_category

  with_options presence: true do
    validates :title
    validates :content
  end

  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

  mount_uploader :image, ImageUploader

end
