class Api::UserController < ApplicationController
  before_action :authenticate_user!, except: [:create, :index]

  include DeviseTokenAuth::Concerns::SetUserByToken
  #skip_before_action :verify_authenticity_token
  skip_before_action :method_name, raise: false

  # user 一覧の取得
  def index
    #フロントに渡したいものgender
    render json: current_user.to_json(only: [:id, :name, :gender, :relationship_id])
  end

  def show
    render json: current_user.to_json(only: [:id, :name, :gender, :relationship_id])
  end


end