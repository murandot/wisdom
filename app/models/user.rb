class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#  has_many :mamterials
#  has_many :articles
#  has_many :questions
#  has_many :feedbacks
#  has_many :comments
#  has_many :answers
#  has_many :material_favorites
#  has_many :article_favorites
#  has_many :relationships
#  has_many :followings, through: :relationships, source: :follow
#  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
#  has_many :followers, through: :reverse_of_relationships, source: :user
#  has_many :rooms, through: :rooms
#  has_many :members
#  has_many :messages

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school_category
  belongs_to :subject
  belongs_to :grade
  belongs_to :club
  belongs_to :duty

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :school_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :subject_id, numericality: { other_than: 1, message: "can't be blank" }

end
