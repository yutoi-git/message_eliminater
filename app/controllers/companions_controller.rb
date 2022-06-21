class CompanionsController < ApplicationController
  before_action :set_companion, only: %i[edit update destroy]

  def index
    @companions = current_user.companions
  end

  def new
    @companion = Companion.new
  end

  def create
    @companion = current_user.companions.build(companion_params)
    if @companion.save
      redirect_to companions_path, notice: 'Companions was successfully created'
    else
      flash[:alert] = 'Creating companions failed'
      render :new
    end
  end

  def edit; end

  def update
    if @companion.update(companion_params)
      redirect_to(companions_path, notice: 'Companions was successfully updated')
    else
      render :edit
    end
  end

  def destroy
    @companion.destroy!
    redirect_to(companions_path, notice: 'Companions was successfully deleted')
  end

  private

  def companion_params
    params.require(:companion).permit(:nickname, :relationship, :acquainted, :closeness, :solution, :partner_gender, :partner_age, :other).merge(user_id: current_user.id)
  end

  def set_companion
    @companion = current_user.companions.find(params[:id])
  end
end
