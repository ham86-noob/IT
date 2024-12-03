class Article < ApplicationRecord
  belongs_to :user
  has_many :like
  has_one_attached :image
  
  validates :title, presence: true
  validates :content, presence: true

  scope :featured, -> { where(featured: true).order(created_at: :desc) }
end
