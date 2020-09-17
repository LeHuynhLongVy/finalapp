class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validates :firstname, presence: true, length: {maximum: 25, message: "Maximum 25 characters"}#, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :lastname, presence: true, length: {maximum: 25, message: "Maximum 25 characters"}#, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :email, presence: true,length: {maximum: 255, message: "Maximum 255 characters"}#, format: { with: /\A.+@.+\z/, message: "Email invalid" }
  validates :password, length: {maximum: 64, message: "Maximum 64 characters"}
  has_many :photos
  has_many :albums
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
  has_many :followers, through: :received_follows, source: :follower
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :given_follows, source: :followed_user
  has_many :likes
  mount_uploader :avatar, AvatarUploader
end
