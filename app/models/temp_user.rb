class TempUser < ApplicationRecord
    include ActiveModel::Validations
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :mail_address, presence: true
    validates :mail_address, mail_format: true, unless: Proc.new { |a| a.mail_address.blank? }
    validate :already_used_mail_address

    # usersですでに使用されているか
    def already_used_mail_address
        unless User.find_by(mail_address: mail_address).nil?
            errors.add(:mail_address, I18n.t('validate.already_use'))
        end
    end

    class << self
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
end
