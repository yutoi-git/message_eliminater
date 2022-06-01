class ExchangesController < ApplicationController
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

  def show
  end

  def edit
  end

  private

  def exchange_params
    params.require(:exchange).permit(:list_name)
  end
end 
