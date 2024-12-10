class Like < ApplicationRecord
  belongs_to :article, counter_cache: true
end
