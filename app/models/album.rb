class Album < ApplicationRecord
  validates :title, presence: true, length: {maximum: 140, minimum: 10, message: "Maximum 140 characters", message: "Minimun 10 characters"} # format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters and numbers" }
  validates :description, length: {maximum: 300, message: "Maximum 300 characters"}
# desciption: format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters and numbers" } and presense: true
  before_save :ensure_album_has_a_description

  protected
  def ensure_album_has_a_description
    unless description.present?
      self.description = "This is album of user has id " + self.user_id.to_s
    end
  end
  has_many :photos, dependent: :destroy
  belongs_to :user
  has_many :likes, as: :likeable
end
