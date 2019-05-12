class TempUser < ApplicationRecord
    include ActiveModel::Validations
    # token length
    TOKEN_LENGTH = 48

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :mail_address, presence: true
    validates :mail_address, mail_format: true, unless: Proc.new { |p| p.mail_address.blank? }
    validate :already_used_mail_address

    # already used mail address
    def already_used_mail_address
        unless User.find_by(mail_address: mail_address).nil?
            errors.add(:mail_address, I18n.t('validate.already_use'))
        end
    end

    class << self
        # create token
        # if already used token, create token again.
        def create_token
            token = nil
            loop do
                token = SecureRandom.urlsafe_base64(TOKEN_LENGTH)
                    break if TempUser.find_by(token: token).nil?
            end
            return token
        end
    end
end
