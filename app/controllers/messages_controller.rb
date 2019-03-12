class MessagesController < ApplicationController

  before_action :move_to_index, except: [:index]

  def index
    @messages = Message.order("created_at DESC")
  end

  def new
    @message = Message.new
    flash[:notice] = "新規投稿画面"
  end

  def create
    Message.create(message: message_params[:message], user_id: current_user.id)
    flash[:notice] = "新規投稿が完了しました"

    redirect_to root_path

    # redirect_to action: :index
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy if message.user_id == current_user.id
    # if message.user_id == current_user.id
    flash[:notice] = "削除が完了しました"
    redirect_to root_path

  def edit
    flash[:notice] = "編集画面"
    @message = Message.find(params[:id])


  end

  def update
    message = Message.find(params[:id])
    if message.user_id == current_user.id
      message.update(message_params)
      flash[:notice] = "編集が完了しました"
      redirect_to root_path
    end
  end
end





  private
  def message_params
    params[:message].permit(:message)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
