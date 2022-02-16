class Api::Users::MessagesController < Api::UserController

  def index
    #messages = Message.all
    messages = Message.where(relationship_id: current_user.relationship_id)
    messages_array = messages.map do |message|
      {
        id: message.id,
        name: message.user.name,
        user_id: message.user_id,
        email: message.user.email,
        content: message.content,
        relationship_id: message.relationship_id,
        priority: message.priority,
        created_at: message.created_at
      }
    end

    render json: messages_array, status: 200
  end
end