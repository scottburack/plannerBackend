class ChatMessage < ApplicationRecord
  belongs_to :group
  after_create_commit do
    ChatMessageCreationEventBroadcastJob.perform_later(self)
  end
end
