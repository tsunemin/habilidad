class TopController < ApplicationController

  # filter
  # actionの直前に実行されるfilterをskipする
  skip_before_action :require_sign_in!, only: [:index, :sign_on, :create]

  def index
    @session = Session.new
  end

  def sign_on
    @temp_user = TempUser.new
  end

  def create
    @temp_user = TempUser.create_temp_user(temp_users_params)
    respond_to do |format|
      if @temp_user.save
        UserMailer.with(temp_user: @temp_user, locale: params[:locale]).request_registration.deliver_later
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
  end

  private

  def temp_users_params
    params.require(:temp_user).permit(:mail_address, :last_name, :first_name)
  end
end
