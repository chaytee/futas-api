class Api::Users::RelationshipsController < Api::UserController

  def create

    # relationship = current_user.build_relationship(paircode: paircode_params[:paircode])
    # raise relationship.inspect
    #raise current_user.relationship.inspect
    #relationship = Relationship.new(paircode_params, user_id: current_user.id)
    #has_oneのものをnewした意味と同じ.build_relationship
    #current_userに紐づいたものを取得できる
    #no templateエラーはcaseのどれも当てはまらない
    case paircode_params[:pass_type].to_i
    when 1
      #左はカラム名で右はpaircode_paramsのこと
      # relationship = current_user.build_relationship(paircode: paircode_params[:paircode])
      relationship = Relationship.new(paircode: paircode_params[:paircode])
      #raise relationship.inspect
      if relationship.save
        message = only_relationship(current_user, relationship.id)

        render json: message
      else
        render json: relationship.errors.full_messages
      end

    when 2
      #送信されたemailで探します
      partner = User.find_by(email: paircode_params[:partner_email])

      # raise partner.relationship.inspect
      #送信されたものと一致していたら
      if partner.relationship.paircode == paircode_params[:paircode]

        message = only_relationship(current_user, partner.relationship.id)

        render json: message

       else
         render json: relationship.errors.full_messages
       end
    end


    #わざとエラー起こして中身見るraise current_user.inspect
    #同じ p current_user
    #p current_user
    #raise paircode_params.inspect

  end

  private

  def paircode_params
    #raise params.inspect
    #何を通すかの記述
    #params.require(:relationship).permit(:paircode).merge(user_id: current_user.id)
    #current_userは取得できているからそもそもmergeは不要
    params.require(:relationship).permit(:paircode, :pass_type, :partner_email)
  end

  #メソッドので引数は任意なので実際に入れ込むところに入れ替える
  def only_relationship(user, relationship_id)
    if user.relationship_id.nil?
      user.update(relationship_id: relationship_id)
      #success_messageは任意 msgはフロントへ返す
      msg = { success_message: '保存しました' }
    else
      msg = { errors: 'すでに認証済みです'}
    end
      msg
  end



end
