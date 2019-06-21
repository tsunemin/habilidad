class AccountController < ApplicationController
  # filter
  # actionの直前に実行されるfilter
  skip_before_action :require_sign_in!, only: [:regist, :create]

  def regist
    temp_user = TempUser.get_active_temp_user(params[:token])
    p temp_user
    if temp_user.nil?
      redirect_to root_path
    else
      @user = User.new(last_name: temp_user.last_name, first_name: temp_user.first_name, mail_address: temp_user.mail_address)
    end
  end

  def create
    @user = User.new(users_params)
    if @user.save
      render action: :complete
    else
      render action: :regist
    end
  end

  private

  def users_params
    params.require(:user).permit(:last_name, :first_name, :last_name_roman, :first_name_roman, :sex, :birthed_on, :mail_address, :password, :password_confirmation)
  end
end
