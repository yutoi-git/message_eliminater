class MessagesController < ApplicationController
  before_action :set_exchange, only: %i[index new create edit update destroy]
  before_action :set_message, only: %i[edit update destroy]

  def index
    @messages = @exchange.messages
  end

  def new
    @message = @exchange.messages.build
  end

  def create
    @message = @exchange.messages.build(message_params)
    if @message.save
      redirect_to exchange_messages_path(@exchange), notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to exchange_messages_path(@exchange), notice: "コメントを編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @message.destroy!
    redirect_to exchange_messages_path(@exchange)
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender, :datetime, :read).merge(exchange_id: params[:exchange_id])
  end

  def set_exchange
    @exchange = current_user.exchanges.find(params[:exchange_id])
  end

  def set_message
    @message = @exchange.messages.find(params[:id])
  end
end
