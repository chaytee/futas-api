class RelationshipsController < ApplicationController
  before_action :create_invitation_digest, only: [:invitation_code]
  before_action :authenticate_api_user!

  def index
    relationship = Relationship.all
    render json: relationship
  end

  def create
    #authenticate_api_user!は文字が返ってきた
    #current_api_user
    #puts user_signed_in?はfalseなのでログインしてないことになってる？

    puts 'xxxxxxxxxxxxxxxx'
    puts user_signed_in?
    puts 'xxxxxxxxxxxxxxxx'

    #puts paircode_params
    # relationship = Relationship.new(paircode_params, user_id: current_user.id)

    # if relationship.save
    #   render json: { success_message: '保存しました' }
    # else
    #   render json: todo.errors.messages
    # end
  end

  private

  # def paircode_params
  #   #params.require(:relationship).permit(:paircode, :user_id)
  #   params.require(:relationship).permit(:paircode).merge(user_id: current_user.id)
  # end
end
