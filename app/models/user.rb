class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :materials
  has_many :articles
  has_many :questions
  has_many :feedbacks
  has_many :comments
  has_many :answers
#  has_many :material_favorites
#  has_many :article_favorites
#  has_many :relationships
#  has_many :followings, through: :relationships, source: :follow
#  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
#  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :members
  has_many :rooms, through: :members
  has_many :messages

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school_category
  belongs_to :subject
  belongs_to :grade
  belongs_to :club
  belongs_to :duty

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :school_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :subject_id, numericality: { other_than: 1, message: "can't be blank" }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :password, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true, on: :update
  validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true, on: :update

  def update_without_current_password(params, *options)
    params.delete(:current_password)
 
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
 
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end   
