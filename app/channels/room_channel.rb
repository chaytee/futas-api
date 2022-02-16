class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #フロントで送信→メッセージデータを受信する度に呼び出されるのがreceiveメソッド
  #data フロントよりmessage email priority
  def receive(data)
    user = User.find_by(email: data['email'])

    if message = Message.create(content: data['message'], user_id: user.id, relationship_id: user.relationship_id, priority: data['priority'])

      ActionCable.server.broadcast 'room_channel', { message: data['message'], name: user.name, user_id: user.id, relationship_id: user.relationship_id, priority: data['priority'], created_at: message.created_at }
    end
  end

end
