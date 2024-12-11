class Notification < ApplicationRecord
    belongs_to :recipient, class_name: 'User'
    belongs_to :actor, class_name: 'User', optional: true
    belongs_to :notifiable, polymorphic: true

    validates :action, presence: true
    validates :recipient, presence: true
end
