class Exchange < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, length: { maximum: 30 }
end
