class MessagesController < ApplicationController
  before_action :authenticate_api_user!, only: ["index"]

  def index
    messages = Message.all
    messages_array = messages.map do |message|
      {
        #relationships_idを入れないとおかしい
        id: message.id,
        # user_id: message.user.id,
        # name: message.user.name,
        content: message.content,
        priority: message.priority,
        # email: message.user.email,
        created_at: message.created_at
      }
    end

    render json: messages_array, status: 200
  end
end
