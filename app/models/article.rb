class Article < ApplicationRecord
  before_create :generate_uuid

  def to_param
      uuid
  end

  belongs_to :user
  belongs_to :subcategory
  has_many :likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy 
  
  validates :title, presence: true
  validates :content, presence: true

  #scope :featured, -> (count = 10) { where(featured: true).order(created_at: :desc).limit(count) }

  private

  def generate_uuid
    self.uuid = SecureRandom.hex(8)
  end
end