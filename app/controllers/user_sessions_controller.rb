class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(root_url, notice: 'Login successful')
    else
      flash[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(login_url, notice: 'Logged out!')
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
    redirect_back_or_to root_path, success: 'ゲストとしてログインしました'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
