class Photo < ApplicationRecord
  validates :title, presence: true, length: {maximum: 140, message: "Maximum 140 characters"}, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters and numbers" }
  validates :description, presence: true, length: {maximum: 300, message: "Maximum 300 characters"}, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters and numbers" }
  belongs_to :user
  belongs_to :album, optional: true
  has_many :likes, as: :likeable

  mount_uploader :image, ImageUploader
end
