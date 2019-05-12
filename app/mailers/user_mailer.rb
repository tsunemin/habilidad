class UserMailer < ApplicationMailer
    default from: 'hogehoge@gmail.com'

    def request_registration
        @temp_user = params[:temp_user]       
        mail(to: @temp_user.mail_address, subject: I18n.t('mailers.user_mailer.request_registration.subject'))
    end
end
