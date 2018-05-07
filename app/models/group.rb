class Group < ApplicationRecord
  has_many :events
  has_many :groups_user
  has_many :users, through: :groups_user
  # has_many :chat_messages
  has_many :group_messages



end
