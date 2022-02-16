class TasksController < ApplicationController

  #before_action :authenticate_api_user!
  # before_action: set_user, only: index


  def index
    # tasks = Task.all.order(created_at: :desc)
    # #シリアライズでjson整形
    # render json: tasks
    render json: Task.all
  end

  def show
    #idでレコードそのものを取りたい時はfindでOK
    @task = Task.find(params[:id])

    #三項演算子で格納してrender jsonで返してもOK
    if @task.present?
      render json: @task
    else
      render json: { error_message: 'Not Found'}
    end
  end

  def create
    tasks = Task.new(set_params)
    if tasks.save
      render json: { success_message: '保存しました' }
    else
      render json: tasks.errors.messages
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(set_params)
      render json: { success_message: '更新しました' }
    else
      render json: task.errors.messages
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: { success_message: '削除しました' }
  end

  # def set_user
  #   @gender = User.find(params[:id]).gender
  # end

  private
  def set_params
    #api通信の場合はテーブル名ではなくフロントで設定したオブジェクトparamsかtaskを指定?
    params.require(:task).permit(:title, :is_done, :limit_day, :limit_time)
  end

end
