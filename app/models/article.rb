class Article < ApplicationRecord
  belongs_to :user
  has_many :like
  
  validates :title, presence: true
  validates :content, presence: true

  scope :featured, -> { where(featured: true).order(created_at: :desc) }
end
