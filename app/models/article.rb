class Article < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true

  #scope :featured, -> (count = 10) { where(featured: true).order(created_at: :desc).limit(count) }

  # メタデータを保存する
  before_save :store_image_metadata

  private

  def store_image_metadata
    if image.attached?
      self.image_file_name = image.filename.to_s
      self.image_file_size = image.byte_size
      self.image_content_type = image.content_type
    end
  end
end
