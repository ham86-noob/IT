class Room < ApplicationRecord
    before_validation :sort_ids

    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy
    has_many :notifications, as: :notifiable, dependent: :destroy

    validates :user_id1, presence: true
    validates :user_id2, presence: true
    validates :user_id1, uniqueness: { scope: :user_id2, message: "この部屋はすでに存在します。"}

    private

    def sort_ids
        if user_id1 > user_id2
            self.user_id1, self.user_id2 = user_id2, user_id1
        end
    end
end
