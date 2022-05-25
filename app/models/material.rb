class Material < ApplicationRecord
  belongs_to :user
#  has_many :feedbacks
#  has_many :material_favorites
#  has_many :material_tags, through: material_taggings
#  has_many :material_taggings
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school_category
  belongs_to :subject
  belongs_to :grade

  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :school_category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :subject_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  mount_uploader :data, DataUploader

end
