class TopController < ApplicationController
    require 'securerandom'

    def index
    end

    def sign_on
        @temp_user= TempUser.new
    end

    def create
        # 入力されたメールアドレスは登録済みか
        @temp_user = TempUser.find_or_initialize_by(mail_address: temp_users_params[:mail_address])
        # 入力された姓・名をセット
        @temp_user.last_name = temp_users_params[:last_name]
        @temp_user.first_name = temp_users_params[:first_name]
        # トークンを生成
        @temp_user.token = create_token
        # 有効期限に現在日時をセットする
        @temp_user.expired_at = DateTime.now

        respond_to do |format|
            # UPSERT実行
            if @temp_user.save
                format.js { @status = "success" }
            else
                format.js { @status = "fail" }
            end
        end
    end

    private
        def temp_users_params
            params.require(:temp_user).permit(:mail_address, :last_name, :first_name);
        end

        # トークン生成
        # 生成したトークンが使用されていた場合 再作成する
        def create_token
            token = nil
            loop do
                token = SecureRandom.urlsafe_base64
                    break if TempUser.find_by(token: token).nil?
            end
            return token
        end
end
