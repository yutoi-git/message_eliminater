class ProfilesController < ApplicationController
  before_action :set_user
  
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to edit_profile_path, success: 'ユーザーを更新しました'
    else
      flash.now['danger'] = 'ユーザーを更新できませんでした'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :myself_gender, :myself_age)
  end
end