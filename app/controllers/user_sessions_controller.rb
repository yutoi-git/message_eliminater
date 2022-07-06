class UserSessionsController < ApplicationController

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました'
  end

  def guest_login
    rondom_value = SecureRandom.alphanumeric(10) + Time.zone.now.to_i.to_s
    @guest_user = User.create(
      email: rondom_value + '@example.com',
      password: 'password',
      password_confirmation: 'password',
      role: :guest
    )
    auto_login(@guest_user)
    redirect_back_or_to root_path, success: 'お試しで使用中です'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
