class Message < ApplicationRecord
  belongs_to :exchange

  validates :sender, presence: true

  enum sender: { companion: 0, myself: 1 }
  enum read: { unread: 0, already: 1 }
end
