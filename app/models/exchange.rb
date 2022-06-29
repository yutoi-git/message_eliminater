class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :companion, optional: true
  has_many :messages, dependent: :destroy

  validates :title, length: { maximum: 30 }
end
