class Article < ApplicationRecord
  belongs_to :user
  has_many :like, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true

  scope :featured, -> { where(featured: true).order(created_at: :desc) }
end
