class SessionsController < ApplicationController
    before_action :set_user, only: [:create]

    def new
        render 'top/index'
    end

    def create
        if @user.authenticate(session_params[:password])
            sign_in(@user)
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        sign_out
        redirect_to login_path
    end

    private
        def set_user
            # find_by! : if record is not found, throw exception.
            @user = User.find_by!(mail_address: session_params[:mail_address])
        rescue
            render :new
        end
    
        def session_params
            params.require(:session).permit(:mail_address, :password)
        end
end
