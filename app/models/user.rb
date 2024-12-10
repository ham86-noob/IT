class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable, :lockable, :timeoutable

  has_one_attached :avatar, dependent: :destroy

  has_many :article, dependent: :nullify

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # フォローの関係,フォローした
  has_many :relationships, foreign_key: :following_id, dependent: :destroy
  # 一覧画面で使用する（あるユーザーがフォローしている人全員をとってくる）
  has_many :followings, through: :relationships, source: :follower
  
  # フォロワーの関係、フォローされた
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  # 一覧画面で使用する（あるユーザーをフォローしている人全員をとってくる）
  has_many :followers, through: :reverse_of_relationships, source: :following

  # あるユーザが引数で渡されたuserにフォローされているか調べるメソッド
  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  validates :email, presence: true, uniqueness: { message: "このEメールはすでに使用されています" }
  validates :username, presence: true, uniqueness: { message: "このユーザー名はすでに使用されています" }
  validates :full_name, presence: true
  validates :encrypted_password, presence: true
end
