class User < ApplicationRecord
  has_many :article, dependent: :nullify

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  acts_as_followable
  acts_as_follower

  # Include default devise modules. Others available are:
  #  :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable
end
