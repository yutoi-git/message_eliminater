class ExchangesController < ApplicationController
  before_action :set_exchange, only: %i[edit update destroy]
  before_action :set_companion, only: %i[new edit]

  def index
    @exchanges = current_user.exchanges
  end

  def new
    @exchange = Exchange.new
  end

  def create
    @exchange = current_user.exchanges.build(exchange_params)
    if @exchange.save
      redirect_to exchanges_url, notice: 'Exchanges was successfully created'
    else
      flash[:alert] = 'Creating exchanges failed'
      render :new
    end
  end

  def edit; end

  def update
    if @exchange.update(exchange_params)
      redirect_to(exchanges_url, notice: 'Exchanges was successfully updated')
    else
      render :edit
    end
  end

  def destroy
    @exchange.destroy!
    redirect_to(exchanges_path, notice: 'Exchanges was successfully deleted')
  end

  private

  def exchange_params
    params.permit(:title, :companion_id)
  end

  def set_exchange
    @exchange = current_user.exchanges.find(params[:id])
  end

  def set_companion
    @companion = Companion.where(user_id: current_user.id)
  end
end 
