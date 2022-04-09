class Note < ApplicationRecord
  validates :title, presence: true, length: { in: 1..100 }
end
