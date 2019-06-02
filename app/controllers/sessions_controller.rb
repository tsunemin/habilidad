class SessionsController < ApplicationController
    # filter
    # actionの直前に実行されるfilterをskipする
    skip_before_action :require_sign_in!, only: [:new, :create]
    # actionの直前に実行されるfilter
    before_action :set_user, only: [:create]

    # GET /login
    def new
        redirect_to root_path
    end

    # PUT /login
    def create
        if @user.authenticate(@session.password)
            sign_in(@user)
        else
            @session.sign_in_failure
        end
        render "top/index"
    end

    # DELETE /logout
    def destroy
        sign_out
        redirect_to login_path
    end

    private
        def set_user
            @session = Session.new(session_params)
            if !@session.valid?
                render "top/index" and return
            end
            @user = User.find_by!(mail_address: @session.mail_address)
        rescue
            @session.sign_in_failure
            render "top/index"
        end
    
        def session_params
            params.require(:session).permit(:mail_address, :password)
        end
end
