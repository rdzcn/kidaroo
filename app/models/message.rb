class Message < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :broadcast_message

  private

  def broadcast_message
    ActionCable.server.broadcast("chat_room_#{self.event.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, user_is_message_author: true}
      ),
      current_user_id: self.user.id
    })
  end
end
